package com.feige.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.feige.dao.UserMapper;
import com.feige.pojo.User;
import com.feige.service.UserService;
import org.springframework.stereotype.Service;

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

}
