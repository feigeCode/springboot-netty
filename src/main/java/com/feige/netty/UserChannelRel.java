package com.feige.netty;

import io.netty.channel.Channel;

import java.util.HashMap;
import java.util.Map;

/**
 * 这是用户ID和channel的关联关系处理
 */
public class UserChannelRel {

    private static Map<Long, Channel> manager = new HashMap<>();

    public static void put(Long senderId,Channel channel){
        manager.put(senderId,channel);
    }
    public static Channel get(Long senderId){
        return manager.get(senderId);
    }
    public static void output(){
        for (Map.Entry<Long, Channel> entry : manager.entrySet()) {
            System.out.println("userId:"+entry.getKey()+",channelId:"+entry.getValue().id().asLongText());
        }
    }
}
