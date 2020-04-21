package com.feige.controller;


import com.feige.core.ResultAjax;
import com.feige.pojo.ChatMsg;
import com.feige.service.ChatMsgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
@RestController
@RequestMapping("/api/chat-msg")
@Api(tags = "聊天消息的增删改查接口")
public class ChatMsgController {

    @Resource
    private ChatMsgService chatMsgService;

    /**
     * 查询未读消息
     * @param senderId
     * @return
     */
    @ApiImplicitParam(name = "senderId", value = "发送者ID", required = true)
    @ApiOperation(value = "查询未读消息")
    @GetMapping("/getUnreadChatMsg")
    public ResultAjax getUnreadChatMsg(@RequestParam(value = "senderId")String senderId){
        List<ChatMsg> chatMsg = chatMsgService.getUnreadChatMsg(senderId);
        return ResultAjax.success(chatMsg);
    }
}

