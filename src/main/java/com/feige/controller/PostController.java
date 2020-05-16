package com.feige.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.feige.core.ResultAjax;
import com.feige.pojo.Post;
import com.feige.service.PostService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author feige
 * @since 2020-05-11
 */
@Api(tags = "推文的增删改查接口")
@RestController
@RequestMapping("/api/post")
public class PostController {

    @Resource
    private PostService postService;

    @ApiOperation(value = "分页查询推文")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "page",value = "当前页",required = true),
            @ApiImplicitParam(name = "limit",value = "每页条数")
    })
    @GetMapping("/get")
    public ResultAjax getPost(@RequestParam("page")Integer page ,@RequestParam(value = "limit",defaultValue = "5")Integer limit){
        Page<Post> postPage = new Page<>(page,limit);
        QueryWrapper<Post> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("gmt_create");
        List<Post> records = postService.page(postPage, wrapper).getRecords();
        int count = postService.count(wrapper);
        return ResultAjax.success(records,count);
    }

    @ApiOperation(value = "增加推文")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "category",value = "分类"),
            @ApiImplicitParam(name = "title",value = "标题"),
            @ApiImplicitParam(name = "content",value = "内容"),
            @ApiImplicitParam(name = "author",value = "作者")
    })
    @PostMapping("/add")
    public ResultAjax addPost(@RequestParam("category")String category ,
                              @RequestParam("title")String title ,
                              @RequestParam("imgAddr")String imgAddr ,
                              @RequestParam("content")String content ,
                              @RequestParam("author")String author
                              ){
        Post post = Post.builder()
                .author(author)
                .category(category)
                .content(content)
                .title(title)
                .imgAddr(imgAddr)
                .build();
        boolean add = postService.save(post);
        if (add){
            return ResultAjax.success();
        }else {
            return ResultAjax.error();
        }
    }
    @ApiOperation(value = "更新推文")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "推文ID"),
            @ApiImplicitParam(name = "category",value = "分类"),
            @ApiImplicitParam(name = "title",value = "标题"),
            @ApiImplicitParam(name = "content",value = "内容"),
            @ApiImplicitParam(name = "imgAddr",value = "文章图片"),
            @ApiImplicitParam(name = "good",value = "点赞量"),
            @ApiImplicitParam(name = "view",value = "浏览量"),
            @ApiImplicitParam(name = "author",value = "作者")
    })
    @PutMapping("/update/{id}")
    public ResultAjax updatePost(
                                @PathVariable("id") String id,
                                @RequestParam(value = "category",required = false)String category ,
                                @RequestParam(value = "title",required = false)String title ,
                                @RequestParam(value = "content",required = false)String content ,
                                @RequestParam(value = "imgAddr", required = false)String imgAddr ,
                                @RequestParam(value = "good", required = false)Integer good ,
                                @RequestParam(value = "view", required = false)Integer view ,
                                @RequestParam(value = "author",required = false)String author
    ){
        Post post = Post.builder()
                .id(id)
                .author(author)
                .category(category)
                .content(content)
                .title(title)
                .imgAddr(imgAddr)
                .good(good)
                .view(good)
                .build();
        boolean update = postService.updateById(post);
        if (update){
            return ResultAjax.success();
        }else {
            return ResultAjax.error();
        }
    }
    @ApiOperation(value = "通过ID删除推文")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "推文ID"),
    })
    @DeleteMapping("/delete/{id}")
    public ResultAjax updatePost( @PathVariable("id") String id){

        boolean remove = postService.removeById(id);
        if (remove){
            return ResultAjax.success();
        }else {
            return ResultAjax.error();
        }
    }
    @ApiOperation(value = "通过ID查询推文")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id",value = "文章ID"),
    })
    @GetMapping("/getPost/{id}")
    public ResultAjax getPostById(@PathVariable("id") String id){
        Post post = postService.getById(id);
        return ResultAjax.success(post);
    }
}

