package com.feige.netty.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataContent implements Serializable {

    private static final long serialVersionUID = -4099761306562642132L;

    //动作类型
    private Integer action;
    //用户的聊天内容entity
    private ChatMessage chatMessage;
    //扩展字段
    private String extend;
}