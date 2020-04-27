package com.feige.service.impl;

import com.feige.pojo.Friend;
import com.feige.dao.FriendMapper;
import com.feige.pojo.User;
import com.feige.service.FriendService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author feige
 * @since 2020-04-22
 */
@Service
public class FriendServiceImpl extends ServiceImpl<FriendMapper, Friend> implements FriendService {

    @Resource
    private FriendMapper friendMapper;

    @Override
    public List<User> getFriend(String myId) {
        return friendMapper.getFriend(myId);
    }
}
