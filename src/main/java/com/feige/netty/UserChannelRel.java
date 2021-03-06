package com.feige.netty;

import io.netty.channel.Channel;

import java.util.HashMap;
import java.util.Map;

/**
 * 这是用户ID和channel的关联关系处理
 */
public class UserChannelRel {

    private static Map<String, Channel> manager = new HashMap<>();

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
