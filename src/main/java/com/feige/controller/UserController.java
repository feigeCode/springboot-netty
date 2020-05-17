package com.feige.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.feige.core.ResultAjax;
import com.feige.pojo.User;
import com.feige.service.UserService;
import com.feige.utils.RedisUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

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
@Api(tags = "用户的增删改查接口")
@RestController
@RequestMapping("/api/user")
@Slf4j
public class UserController {
    @Resource
    private UserService userService;


    @Resource
    private RedisUtil redisUtil;


    @ApiOperation(value = "查询所有的用户")
    @GetMapping("/get_users")
    public ResultAjax getUser(){
        List<User> user = userService.list(null);
        int count = userService.count(null);
        return ResultAjax.success(user,count);
    }


    /**
     * 分页查询所有的老师
     * @return
     */
    @ApiOperation(value = "查询所有的老师")
    @ApiImplicitParam(name = "page", value = "当前页", required = true)
    @GetMapping("/get_teachers/{page}")
    public ResultAjax getTeacher(@PathVariable("page") Integer page){
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("is_teacher",1);
        Page<User> page1 = new Page<>(page,20);
        List<User> user = userService.page(page1,wrapper).getRecords();
        int count = userService.count(wrapper);
        return ResultAjax.success(user,count);
    }
    /**
     * 查询符合条件的老师
     * @return
     */
    @ApiOperation(value = "查询符合条件的老师")
    @ApiImplicitParam(name = "nickname", value = "老师昵称", required = true)
    @GetMapping("/get/{nickname}")
    public ResultAjax getTeacherByName(@PathVariable("nickname")String nickname){
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.like("nickname",nickname);
        List<User> userList = userService.list(wrapper);
        System.out.println(userList);
        return ResultAjax.success(userList);
    }


    /**
     * 申请成为老师
     * @param userId 用户ID
     * @param nickname 昵称
     * @param phone 电话
     * @param introduce 自我介绍
     * @param address 地址
     * @param certificate 心里证书的图片地址
     * @param email 邮箱
     * @return
     */
    @ApiOperation(value = "申请成为老师")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId",value = "用户ID",required = true),
            @ApiImplicitParam(name = "nickname",value = "昵称", required = true),
            @ApiImplicitParam(name = "school",value = "学校", required = true),
            @ApiImplicitParam(name = "age",value = "年龄", required = true),
            @ApiImplicitParam(name = "phone",value = "电话", required = true),
            @ApiImplicitParam(name = "content",value = "自我介绍", required = true),
            @ApiImplicitParam(name = "address",value = "地址", required = true),
            @ApiImplicitParam(name = "certificate",value = "心里证书的图片地址", required = true),
            @ApiImplicitParam(name = "email",value = "邮箱", required = true)
    })
    @PutMapping("/apply")
    public ResultAjax apply(@RequestParam("userId") String userId,
                                 @RequestParam("nickname") String nickname,
                                 @RequestParam("school") String school,
                                 @RequestParam("age") Integer age,
                                 @RequestParam("phone") String phone,
                                 @RequestParam("introduce") String introduce,
                                 @RequestParam("address") String address,
                                 @RequestParam("certificate") String certificate,
                                 @RequestParam("email") String email){

        User user = User.builder()
                .uid(userId)
                .detailedAddress(address)
                .nickname(nickname)
                .school(school)
                .age(age)
                .certificate(certificate)
                .email(email)
                .introduce(introduce)
                .phone(phone)
                .build();
        log.info("更新的内容为user = " + user);
        boolean update = userService.updateById(user);
        if (update){
            return ResultAjax.success();
        }else {
            return ResultAjax.error();
        }
    }

    /**
     *
     * @param userId
     * @param verifyCode
     * @param phone
     * @return
     */
    @ApiOperation(value = "验证电话号码")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId",value = "用户ID",required = true),
            @ApiImplicitParam(name = "verifyCode",value = "验证码", required = true),
            @ApiImplicitParam(name = "phone",value = "电话", required = true)
    })
    @PutMapping("/validate")
    public ResultAjax validate(@RequestParam("userId") String userId,
                                 @RequestParam("verifyCode") String verifyCode,
                                 @RequestParam("phone") String phone
                                 ){
        String code = (String) redisUtil.get(phone);
        if (code.equals(verifyCode)){
            User user = User.builder()
                    .uid(userId)
                    .isTeacher(true)
                    .build();
            boolean update = userService.updateById(user);
            if (update){
                return ResultAjax.success();
            }else {
                return ResultAjax.error("网络异常！");
            }
        }else {
            return ResultAjax.error("验证码不相等！");
        }
    }
}

