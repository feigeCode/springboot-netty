package com.feige.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.feige.pojo.Dynamic;
import com.feige.pojo.RealDynamic;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
public interface DynamicMapper extends BaseMapper<Dynamic> {
    List<RealDynamic> getDynamicPage(Map<String,Object> map);
    int getDynamicCount();
}
