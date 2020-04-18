package com.feige.netty;

import io.netty.channel.Channel;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 这是用户ID和channel的关联关系处理
 */
public class UserChannelRel {

    private static ConcurrentHashMap<String, Channel> manager = new ConcurrentHashMap<>();

    public static void put(String senderId,Channel channel){
        manager.put(senderId,channel);
    }
    public static Channel get(String senderId){
        return manager.get(senderId);
    }
    public static void output(){
        for (Map.Entry<String, Channel> entry : manager.entrySet()) {
            System.out.println("userId:"+entry.getKey()+",channelId:"+entry.getValue().id().asLongText());
        }
    }
}
