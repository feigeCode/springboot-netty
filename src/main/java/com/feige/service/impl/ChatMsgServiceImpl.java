package com.feige.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.feige.dao.ChatMsgMapper;
import com.feige.pojo.ChatMsg;
import com.feige.service.ChatMsgService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
@Service
public class ChatMsgServiceImpl extends ServiceImpl<ChatMsgMapper, ChatMsg> implements ChatMsgService {


    @Resource
    private ChatMsgMapper chatMsgMapper;


    /**
     * 把聊天消息存入数据库
     * @param chatMsg
     * @return
     */
    @Transactional(
            propagation = Propagation.REQUIRED
    )
    @Override
    public int saveChatMsg(ChatMsg chatMsg) {
        return chatMsgMapper.insert(chatMsg);
    }

    /**
     * 更新消息标记为已读
     * @param chatMsg
     * @return
     */
    @Transactional(
            propagation = Propagation.REQUIRED
    )
    @Override
    public int updateChatMsg(ChatMsg chatMsg) {
        //更新消息标记为已读
        chatMsg.setSignFlag(true);
        return chatMsgMapper.updateById(chatMsg);
    }

    /**
     * 批量更新消息标记为已读
     * @param list
     * @return
     */
    @Transactional
    @Override
    public int batchUpdateChatMsg(List<Long> list) {
        return chatMsgMapper.batchUpdateChatMsg(list);
    }

    /**
     * 根据发送者ID和接受者ID分页查询数据
     * @param senderId
     * @param receiverId
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<ChatMsg> getChatMsg(Long senderId, Long receiverId, int page, int limit) {
        // 参数一：当前页
        // 参数二：页面大小
        Page<ChatMsg> page1 = new Page<>(page,limit);
        QueryWrapper<ChatMsg> wrapper = new QueryWrapper<>();
        wrapper
                .nested(i -> i.eq("sender_id",senderId)
                        .eq("receiver_id",receiverId))
                .or(i -> i.eq("receiver_id",senderId)
                        .eq("sender_id",receiverId))
                .orderByAsc("gmt_create");
        return chatMsgMapper.selectPage(page1,wrapper).getRecords();
    }

    /**
     * 根据发送者ID和接受者ID查询数据的条数
     * @param senderId
     * @param receiverId
     * @return
     */
    @Override
    public int getCount(Long senderId, Long receiverId) {
        QueryWrapper<ChatMsg> wrapper = new QueryWrapper<>();
        wrapper
                .nested(i -> i.eq("sender_id",senderId)
                        .eq("receiver_id",receiverId))
                .or(i -> i.eq("receiver_id",senderId)
                        .eq("sender_id",receiverId));

        return chatMsgMapper.selectCount(wrapper);
    }

    /**
     * 获取未签收消息
     * @param senderId
     * @return
     */
    @Override
    public List<ChatMsg> getUnreadChatMsg(Long senderId) {
        QueryWrapper<ChatMsg> wrapper = new QueryWrapper<>();
        wrapper
                .nested(i -> i.eq("sender_id",senderId)
                        .eq("sign_flag",false));
        return chatMsgMapper.selectList(wrapper);
    }
}
