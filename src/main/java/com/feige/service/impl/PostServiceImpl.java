package com.feige.service.impl;

import com.feige.pojo.Post;
import com.feige.dao.PostMapper;
import com.feige.service.PostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author feige
 * @since 2020-05-11
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {

}
