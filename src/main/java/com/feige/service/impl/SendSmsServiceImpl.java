package com.feige.service.impl;

import com.alibaba.fastjson.JSONException;
import com.feige.service.SendSmsService;
import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import com.github.qcloudsms.httpclient.HTTPException;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class SendSmsServiceImpl implements SendSmsService {
    @Override
    public boolean sendSms(String phone, String code) {
        // 短信应用 SDK AppID
        int appid = 1400369431; // SDK AppID 以1400开头
        // 短信应用 SDK AppKey
        String appKey = "795fa204c0eca37bd009c0b20317f901";
        // 短信模板 ID，需要在短信应用中申请
        int templateId = 605232;
        // 签名
        String smsSign = "胡飞兴趣爱好分享";
        try {
            String[] params = {code,"5"};
            SmsSingleSender sSender = new SmsSingleSender(appid, appKey);
            SmsSingleSenderResult result = sSender.sendWithParam("86", phone,
                    templateId, params, smsSign, "", "");
            System.out.println(result);
        } catch (HTTPException | JSONException | IOException e) {
            // HTTP 响应码错误
            e.printStackTrace();
            return false;
        } // JSON 解析错误
        // 网络 IO 错误
        return true;
    }

}
