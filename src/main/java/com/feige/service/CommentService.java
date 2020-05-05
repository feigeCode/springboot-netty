package com.feige.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.feige.pojo.Comment;
import com.feige.pojo.CommentAndReplies;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
public interface CommentService extends IService<Comment> {
    List<CommentAndReplies> getComments(String dynamicId);
}
