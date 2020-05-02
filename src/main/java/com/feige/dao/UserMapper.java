package com.feige.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
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
 * @since 2020-04-18
 */
@Mapper
@Repository
public interface UserMapper extends BaseMapper<User> {
    List<User> getTeacher();
    User getUserById(String id);
}
