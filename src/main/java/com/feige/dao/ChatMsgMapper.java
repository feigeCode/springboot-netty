package com.feige.dao;

import com.feige.pojo.ChatMsg;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
@Mapper
@Repository
public interface ChatMsgMapper extends BaseMapper<ChatMsg> {
    int batchUpdateChatMsg(List<String> list);
}
