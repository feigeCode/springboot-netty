package com.feige.netty;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.util.concurrent.GlobalEventExecutor;

import java.time.LocalDateTime;

//这是处理消息的handler，是用于处理文本的对象，frame是消息的载体
public class ChatHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {
    //用于记录和管理客户端的channel
    private static ChannelGroup clients = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    protected void channelRead0(ChannelHandlerContext channelHandlerContext, TextWebSocketFrame textWebSocketFrame) throws Exception {
        Channel channel = channelHandlerContext.channel();
        //获取客户端传过来的数据
        String content = textWebSocketFrame.text();
        System.out.println("接收到的数据："+content);
        for (Channel client : clients) {
            client.writeAndFlush(new TextWebSocketFrame("[服务器在]"+ LocalDateTime.now()+"的时候收到消息，消息为："+content));
        }
        //等同上面clients.writeAndFlush(new TextWebSocketFrame("[服务器在]"+ LocalDateTime.now()+"的时候收到消息，消息为："+content))

    }
    @Override
    public void handlerAdded(ChannelHandlerContext ctx) throws Exception {
        //当客户端连接服务端之后（打开连接）
        //获取客户端的channel放入clients
        clients.add(ctx.channel());
    }

    @Override
    public void handlerRemoved(ChannelHandlerContext ctx) throws Exception {
        //当触发handlerRemoved会自动移除对应的channel
        //clients.remove(ctx.channel());
        System.out.println("客户端断开，channel的长id为"+ctx.channel().id().asLongText());
        System.out.println("客户端断开，channel的短id为"+ctx.channel().id().asShortText());
    }
}
