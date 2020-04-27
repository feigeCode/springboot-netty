package com.feige.controller;


import com.feige.core.ResultAjax;
import com.feige.pojo.User;
import com.feige.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
@RequestMapping("/api/user")
@Api(tags = "用户的增删改查接口")
public class UserController {
    @Resource
    private UserService userService;

    @ApiOperation(value = "查询所有的用户")
    @GetMapping("/get")
    public ResultAjax getUser(){
        List<User> user = userService.getUser();
        int count = userService.getCount();
        return ResultAjax.success(user,count);
    }


    /**
     * 查询所有的老师
     * @return
     */
    @ApiOperation(value = "查询所有的老师")
    @GetMapping("/get_teacher")
    public ResultAjax getTeacher(){
        List<User> user = userService.getTeacher();
        return ResultAjax.success(user);
    }
}

