package com.feige.controller;


import com.feige.core.ResultAjax;
import com.feige.pojo.User;
import com.feige.service.FriendService;
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
 * @since 2020-04-22
 */
@RestController
@RequestMapping("/api/friend")
@Api(tags = "朋友的增删改查接口")
public class FriendController {

    @Resource
    private FriendService friendService;


    /**
     * 查询所有的朋友
     * @param myId
     * @return
     */
    @ApiOperation(value = "查询所有的朋友")
    @ApiImplicitParam(name = "myId", value = "用户ID", required = true)
    @GetMapping("/get")
    public ResultAjax getFriend(@RequestParam("myId") String myId){
        List<User> friend = friendService.getFriend(myId);
        return ResultAjax.success(friend);
    }

}

