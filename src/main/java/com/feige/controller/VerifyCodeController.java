package com.feige.controller;

import com.feige.core.ResultAjax;
import com.feige.service.SendSmsService;
import com.feige.utils.RedisUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.UUID;


/**
 * 腾讯云短信服务发送验证码
 */
@Api(tags = "腾讯云短信验证码")
@RestController
@RequestMapping("/api")
public class VerifyCodeController {


    @Resource
    private SendSmsService sendSmsService;

    @Resource
    private RedisUtil redisUtil;


    @ApiOperation(value = "发送验证码")
    @ApiImplicitParam(name = "phone", value = "电话号码", required = true)
    @GetMapping("/verify_code/{phone}")
    public ResultAjax getVerifyCode(@PathVariable("phone") String phone){
        boolean key = redisUtil.hasKey(phone);
        if (key){
            return ResultAjax.success("验证码还未过期!");
        }
        String code = UUID.randomUUID().toString().substring(0, 6);
        boolean sms = sendSmsService.sendSms(phone,code);
        if (sms){
            boolean set = redisUtil.set(phone, code, 5*60);
            return ResultAjax.success("发送成功");
        }else {
            return ResultAjax.error("发送失败");
        }
    }
}
