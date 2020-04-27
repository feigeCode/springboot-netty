package com.feige.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;

@Slf4j
@Component // 一定不要忘记把处理器加到IOC容器中！
public class MyMetaObjectHandler implements MetaObjectHandler {
    static Calendar instance = Calendar.getInstance();
    static {
        TimeZone.setDefault(TimeZone.getTimeZone("GMT+8:00"));
    }
    static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //插入时的填充策略
    @Override
    public void insertFill(MetaObject metaObject) {

        log.info("start fill id = {}",IdWorker.getIdStr());
        //自动生成策略无法生成字符串，给用填充
        this.setFieldValByName("id",IdWorker.getIdStr(),metaObject);
        this.setFieldValByName("gmtCreate", dateFormat.format(instance.getTime()),metaObject);
        this.setFieldValByName("gmtModified",dateFormat.format(instance.getTime()),metaObject);
        this.setFieldValByName("isDelete",false,metaObject);
        this.setFieldValByName("signFlag",false,metaObject);
    }
    //更新时的填充策略
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update date");
        this.setFieldValByName("gmtModified",dateFormat.format(instance.getTime()),metaObject);
    }
}