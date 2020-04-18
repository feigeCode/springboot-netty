package com.feige.netty.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatMessage implements Serializable {

    private static final long serialVersionUID = 1190488709731806719L;
    //发送者ID
    private String senderId;
    //接收者ID
    private String receiverId;
    //聊天内容
    private String msg;
    //用于消息的签收
    private String msgId;
}
