package com.feige.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.feige.dao.DynamicMapper;
import com.feige.pojo.Dynamic;
import com.feige.pojo.RealDynamic;
import com.feige.service.DynamicService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
@Service
public class DynamicServiceImpl extends ServiceImpl<DynamicMapper, Dynamic> implements DynamicService {

    @Resource
    private DynamicMapper dynamicMapper;


    @Override
    public List<RealDynamic> getDynamicPage(Map<String, Object> map) {
        return dynamicMapper.getDynamicPage(map);
    }

    @Override
    public int getDynamicCount() {
        return dynamicMapper.getDynamicCount();
    }
}
