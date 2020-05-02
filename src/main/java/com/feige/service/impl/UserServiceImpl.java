package com.feige.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.feige.dao.UserMapper;
import com.feige.pojo.User;
import com.feige.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public List<User> getUser() {
        return userMapper.selectList(null);
    }

    @Override
    public int getCount() {
        return userMapper.selectCount(null);
    }

    @Override
    public List<User> getTeacher() {
        return userMapper.getTeacher();
    }

    @Override
    public User getUserById(String id) {
        return userMapper.getUserById(id);
    }
}
