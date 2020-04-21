package com.feige.netty;

import com.feige.enums.MsgActionEnum;
import com.feige.netty.pojo.DataContent;
import com.feige.pojo.ChatMsg;
import com.feige.service.ChatMsgService;
import com.feige.utils.JsonUtils;
import com.feige.utils.StringUtils;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.util.concurrent.GlobalEventExecutor;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

//这是处理消息的handler，是用于处理文本的对象，frame是消息的载体
@Component
@ChannelHandler.Sharable
public class ChatHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {

    @Resource
    private ChatMsgService chatMsgService;
    //用于记录和管理客户端的channel
    private static ChannelGroup users = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame textWebSocketFrame) throws Exception {
        String content = textWebSocketFrame.text();
        //System.out.println(content);
        Channel currentChannel = ctx.channel();
        //1. 获取客户端的传输过来的消息
        //把字符串转化为java pojo
        DataContent dataContent = JsonUtils.jsonToPojo(content, DataContent.class);
        //2. 判断消息的类型，根据不同的类型来处理不同的义务
        assert dataContent != null;
        if (dataContent.getAction() == MsgActionEnum.CONNECT.type){
            //  2.1 当websocket第一次open的时候，初始化channel，把用的channel和userId关联起来
            Long senderId = dataContent.getChatMsg().getSenderId();
            UserChannelRel.put(senderId,currentChannel);
            //测试
//            UserChannelRel.output();
//            for (Channel user : users) {
//                System.out.println(user);
//            }
        } else if (dataContent.getAction() == MsgActionEnum.CHAT.type){
            //  2.2 聊天类型的消息，把聊天记录保存到数据库，同时标记消息的的签收状态【未签收】
            ChatMsg chatMsg = dataContent.getChatMsg();
            Long receiverId = chatMsg.getReceiverId();
            //System.out.println(dataContent);
            //保存到数据库，并且标记为未签收，返回msgId
            int saveChatMsg = chatMsgService.saveChatMsg(chatMsg);
            if (saveChatMsg != 1){
                return;
            }
            //发送消息
            //从全局用户Channel关系中获取接收方的channel
            Channel receiverChannel = UserChannelRel.get(receiverId);
            //System.out.println(chatMsg);
            if (receiverChannel != null && receiverChannel.isOpen()){
                //当receiverChannel不为空时，从ChannelGroup去查找对应的channel是否存在
                Channel channel = users.find(receiverChannel.id());
                if (channel != null){
                    //用户在线
                    receiverChannel.writeAndFlush(
                            new TextWebSocketFrame(JsonUtils.objectToJson(chatMsg))
                    );
                    //System.out.println(JsonUtils.objectToJson(chatMsg));
                    //把消息标记为已读
                    int updateChatMsg = chatMsgService.updateChatMsg(chatMsg);
                }
            }
        }else if (dataContent.getAction() == MsgActionEnum.SIGNED.type){
            //  2.3 签收消息类型，针对具体消息进行签收，修改数据库中对应消息的签收状态【已签收】
            //扩展字段在signed类型的消息中，代表需要去签收的消息id，逗号间隔
            String msgIdsStr = dataContent.getExtend();
            String[] msgIds = msgIdsStr.split(",");
            List<Long> msgIdList = new ArrayList<>();
            for (String msgId : msgIds) {
                if (StringUtils.isNotBlank(msgId)){
                    msgIdList.add(Long.valueOf(msgId));
                }
            }
            System.out.println(msgIdList.toString());
            if (msgIdList != null && !msgIdList.isEmpty() && msgIdList.size() > 0){
                //批量签收
                //更新数据库数据 用foreach语句
                //System.out.println("更新数据库数据");
                int batchUpdateChatMsg = chatMsgService.batchUpdateChatMsg(msgIdList);
            }
        }else if (dataContent.getAction() == MsgActionEnum.KEEPALIVE.type){
            //  2.4 心跳类型的消息
            System.out.println("心跳类型");
        }

    }
    @Override
    public void handlerAdded(ChannelHandlerContext ctx) throws Exception {
        //当客户端连接服务端之后（打开连接）
        //获取客户端的channel放入users
        users.add(ctx.channel());
    }

    @Override
    public void handlerRemoved(ChannelHandlerContext ctx) throws Exception {
        //当触发handlerRemoved会自动移除对应的channel
        users.remove(ctx.channel());
        System.out.println("客户端断开，channel的长id为"+ctx.channel().id().asLongText());
        System.out.println("客户端断开，channel的短id为"+ctx.channel().id().asShortText());
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        cause.printStackTrace();
        //发生异常时关闭channel，随后从channelGroup中移除
        ctx.channel().close();
        users.remove(ctx.channel());
    }
}
