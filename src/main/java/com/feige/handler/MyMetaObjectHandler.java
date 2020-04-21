package com.feige.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

@Slf4j
@Component // 一定不要忘记把处理器加到IOC容器中！
public class MyMetaObjectHandler implements MetaObjectHandler {

    //插入时的填充策略
    @Override
    public void insertFill(MetaObject metaObject) {


        log.info("start fill id = {}",IdWorker.getIdStr());
        //自动生成策略无法生成字符串，给用填充
        this.setFieldValByName("id",IdWorker.getIdStr(),metaObject);
        this.setFieldValByName("gmtCreate",new Date(),metaObject);
        this.setFieldValByName("gmtModified",new Date(),metaObject);
        this.setFieldValByName("isDelete",false,metaObject);
        this.setFieldValByName("signFlag",false,metaObject);
    }
    //更新时的填充策略
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update date");
        this.setFieldValByName("gmtModified",new Date(),metaObject);
    }
}