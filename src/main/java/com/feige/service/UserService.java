package com.feige.service;

import com.feige.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
public interface UserService extends IService<User> {
    List<User> getUser();
    int getCount();
}
