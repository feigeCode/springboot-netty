package com.feige.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.feige.pojo.Dynamic;
import com.feige.pojo.RealDynamic;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
public interface DynamicService extends IService<Dynamic> {
    List<RealDynamic> getDynamicPage(Map<String,Object> map);
    int getDynamicCount();
}
