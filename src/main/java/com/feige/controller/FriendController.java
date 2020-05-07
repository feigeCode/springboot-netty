package com.feige.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.feige.core.ResultAjax;
import com.feige.pojo.Friend;
import com.feige.pojo.User;
import com.feige.service.FriendService;
import com.feige.utils.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
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

    @ApiOperation(value = "添加朋友")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "myId", value = "用户ID", required = true),
            @ApiImplicitParam(name = "friendId", value = "朋友ID", required = true)
    })
    @PostMapping("/add")
    public ResultAjax addFriend(@RequestParam("myId") String myId, @RequestParam("friendId") String friendId){
        QueryWrapper<Friend> wrapper = new QueryWrapper<>();
        wrapper.eq("my_id",myId).eq("teacher_id",friendId);
        Friend friend = friendService.getOne(wrapper);
        System.out.println(friend);
        if (StringUtils.isNull(friend)){
            List<Friend> friends = new ArrayList<>();
            friends.add(new Friend(null,myId,friendId));
            friends.add(new Friend(null,friendId,myId));
            //System.out.println(friends);
            boolean batch = friendService.saveBatch(friends);
            if (batch){
                return ResultAjax.success();
            }else {
                return ResultAjax.error();
            }
        }else {
            return ResultAjax.error();
        }
    }

    /**
     * 删除朋友
     * @param friendId
     * @param myId
     * @return
     */
    @ApiOperation(value = "删除朋友")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "myId", value = "用户ID", required = true),
            @ApiImplicitParam(name = "friendId", value = "朋友ID", required = true)
    })
    @DeleteMapping("/delete/{friendId}/{myId}")
    public ResultAjax delete(@PathVariable("friendId") String friendId,@PathVariable("myId") String myId){
        QueryWrapper<Friend> wrapper = new QueryWrapper<>();
        wrapper.nested(i -> i.eq("teacher_id",friendId).eq("my_id",myId))
                .or(i -> i.eq("teacher_id",myId).eq("my_id",friendId));
        boolean remove = friendService.remove(wrapper);
        if (remove){
            return ResultAjax.success();
        }else {
            return ResultAjax.error();
        }

    }


}

