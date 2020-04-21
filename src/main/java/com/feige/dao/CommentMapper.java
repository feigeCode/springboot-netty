package com.feige.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.feige.pojo.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

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
public interface CommentMapper extends BaseMapper<Comment> {

}
