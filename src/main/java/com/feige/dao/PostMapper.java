package com.feige.dao;

import com.feige.pojo.Post;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author feige
 * @since 2020-05-11
 */
@Mapper
@Repository
public interface PostMapper extends BaseMapper<Post> {

}
