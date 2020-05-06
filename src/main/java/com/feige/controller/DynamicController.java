package com.feige.controller;


import com.feige.core.ResultAjax;
import com.feige.pojo.Dynamic;
import com.feige.pojo.RealDynamic;
import com.feige.service.DynamicService;
import com.feige.utils.RedisUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
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

    @PostMapping("/add")
    public ResultAjax addDynamic(@RequestParam("userId") String userId, @RequestParam("content") String content){
        boolean key = redisUtil.hasKey(userId);
        StringBuilder imageAddr = new StringBuilder();
        if (key){
            long size = redisUtil.lGetListSize(userId);
            //从redis中获取用户上传到fastdfs的图片的地址
            List<Object> imageList = redisUtil.lGet(userId,0,size);
            //删除缓存
            redisUtil.del(userId);
            assert imageList != null;
            for (Object image : imageList) {
                StringBuilder img = new StringBuilder(image.toString());
                img.deleteCharAt(0);
                img.deleteCharAt(img.length()-1);
                imageAddr.append(img).append(",");
            }
        }
        //System.out.println(imageAddr);
        //去除最后一个逗号
        int last = imageAddr.lastIndexOf(",");
        String image = imageAddr.deleteCharAt(last).toString();

        Dynamic dynamic = Dynamic.builder()
                .userId(userId)
                .content(content)
                .image(image)
                .build();
        boolean save = dynamicService.save(dynamic);
        if (save){
            return ResultAjax.success();
        }else {
            return ResultAjax.error();
        }
    }
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

