package com.feige.controller;


import com.feige.core.ResultAjax;
import com.feige.pojo.Dynamic;
import com.feige.pojo.RealDynamic;
import com.feige.service.DynamicService;
import com.feige.utils.RedisUtil;
import com.feige.utils.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

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

    @Resource
    private RedisUtil redisUtil;

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

    @ApiOperation(value = "增加一条动态")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId",value = "用户ID",required = true),
            @ApiImplicitParam(name = "content",value = "内容", required = true),
            @ApiImplicitParam(name = "imgAddr",value = "图片地址")
    })
    @PostMapping("/add")
    public ResultAjax addDynamic(@RequestParam("userId") String userId,
                                 @RequestParam("content") String content,
                                 @RequestParam(value = "imgAddr",required = false) String imgAddr){
        //System.out.println(imgAddr);
        if (StringUtils.isEmpty(imgAddr)){
            imgAddr = null;
        }else {
            imgAddr = new StringBuilder(imgAddr).deleteCharAt(imgAddr.lastIndexOf(",")).toString();
        }
        //System.out.println(imgAddr);
        Dynamic dynamic = Dynamic.builder()
                .userId(userId)
                .content(content)
                .image(imgAddr)
                .build();
        boolean save = dynamicService.save(dynamic);
        if (save){
            return ResultAjax.success();
        }else {
            return ResultAjax.error();
        }
    }
    @ApiOperation("点赞")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "dynamicId",value = "动态的ID", required = true),
            @ApiImplicitParam(name = "good",value = "点赞数", required = true)
    })
    @PutMapping("/good")
    public ResultAjax good(@RequestParam("dynamicId") String dynamicId,@RequestParam("good") Integer good){
        Dynamic dynamic = Dynamic.builder()
                .id(dynamicId)
                .good(good)
                .build();
        boolean b = dynamicService.updateById(dynamic);
        if (b){
            return ResultAjax.success();
        }else {
            return ResultAjax.error();
        }
    }
}

