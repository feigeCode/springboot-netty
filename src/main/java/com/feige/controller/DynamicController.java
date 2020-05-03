package com.feige.controller;


import com.feige.core.ResultAjax;
import com.feige.pojo.RealDynamic;
import com.feige.service.DynamicService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
@Api(tags = "动态的增删改查")
@RestController
@RequestMapping("/api/dynamic")
public class DynamicController {

    @Resource
    private DynamicService dynamicService;

    @ApiOperation(value = "分页查询动态")
    @ApiImplicitParam(name = "page", value = "当前页", required = true)
    @GetMapping("/get/{page}")
    public ResultAjax getDynamic(@PathVariable("page") Integer page){
        HashMap<String, Object> map = new HashMap<>();
        map.put("page",(page-1)*20);
        map.put("limit",20);
        List<RealDynamic> dynamicPage = dynamicService.getDynamicPage(map);
        int count = dynamicService.getDynamicCount();
        return ResultAjax.success(dynamicPage,count);
    }
}

