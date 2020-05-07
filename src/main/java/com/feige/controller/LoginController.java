package com.feige.controller;

import com.alibaba.fastjson.JSONObject;
import com.feige.core.ResultAjax;
import com.feige.pojo.User;
import com.feige.service.UserService;
import com.feige.utils.AesCbcUtil;
import com.feige.utils.HttpRequest;
import com.feige.utils.StringUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/api/login")
public class LoginController {
    @Resource
    private UserService userService;


    @ApiOperation(value = "登录")
    @PostMapping("/post")
    public ResultAjax login(String encryptedData, String iv, String code){
        //System.out.println(encryptedData);
        //System.out.println(iv);
        //System.out.println(code);
        if(!StringUtils.isEmpty(code)){
            //小程序唯一标识   (在微信小程序管理后台获取)
            String appid = "xxxx";
            //String appid = "xxxx";
            //小程序的 app secret (在微信小程序管理后台获取)
            String secret = "xxxx";
            //String secret = "xxxx";
            //授权（必填）
            String grant_type = "authorization_code";
            // 1、向微信服务器 使用登录凭证 code 获取 session_key 和 openid
            //请求参数
            String params = "appid=" + appid + "&secret=" + secret + "&js_code=" + code + "&grant_type=" + grant_type;
            //发送请求
            String str = HttpRequest.sendGet("https://api.weixin.qq.com/sns/jscode2session", params);
            JSONObject parse = JSONObject.parseObject(str);
            //System.out.println(str);
            //System.out.println(parse);
            //获取会话密钥（session_key）
            String sessionKey = parse.get("session_key").toString();
            //用户的唯一标识（openid）
            String openid = (String) parse.get("openid");
            //System.out.println(sessionKey);
            //System.out.println(openid);
            User user1 = userService.getUserById(openid);
            if (StringUtils.isNotNull(user1)){
                return ResultAjax.success(openid);
            }
            // 2、对encryptedData加密数据进行AES解密
            try {
                String result = AesCbcUtil.decrypt(encryptedData, sessionKey, iv, "UTF-8");
                if (null != result && result.length() > 0) {
                    JSONObject userInfoJSON = JSONObject.parseObject(result);
                    //System.out.println(userInfoJSON);
                    User user = User.builder()
                            .uid(openid)
                            .nickname(userInfoJSON.get("nickName").toString())
                            .sex(Boolean.valueOf(userInfoJSON.get("gender").toString()))
                            .avatar(userInfoJSON.get("avatarUrl").toString())
                            .detailedAddress(userInfoJSON.get("province").toString() + userInfoJSON.get("city").toString())
                            .build();
                    //System.out.println(user);
                    boolean save = userService.save(user);
                    if (save){
                        return ResultAjax.success(openid);
                    }else {
                        return ResultAjax.error();
                    }
                }
                return ResultAjax.error();
            } catch (Exception e) {
                e.printStackTrace();
                return ResultAjax.error();
            }
        }else {
            return ResultAjax.error();
        }
    }
}
