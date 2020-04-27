package com.feige.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.feige.pojo.Friend;
import com.feige.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author feige
 * @since 2020-04-22
 */
@Mapper
@Repository
public interface FriendMapper extends BaseMapper<Friend> {
    List<User> getFriend(String myId);
}
