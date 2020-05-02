package com.feige.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.feige.pojo.User;

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
    List<User> getTeacher();
    User getUserById(String id);
}
