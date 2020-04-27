package com.feige.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.feige.pojo.Friend;
import com.feige.pojo.User;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author feige
 * @since 2020-04-22
 */
public interface FriendService extends IService<Friend> {
    List<User> getFriend(String myId);

}
