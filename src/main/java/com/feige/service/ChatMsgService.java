package com.feige.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.feige.pojo.ChatMsg;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
public interface ChatMsgService extends IService<ChatMsg> {
    int saveChatMsg(ChatMsg chatMsg);
    int updateChatMsg(ChatMsg chatMsg);
    int batchUpdateChatMsg(List<Long> list);
    List<ChatMsg> getChatMsg(Long senderId,Long receiverId,int page,int limit);
    int getCount(Long senderId,Long receiverId);
    List<ChatMsg> getUnreadChatMsg(Long senderId);
}
