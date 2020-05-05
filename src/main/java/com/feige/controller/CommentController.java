package com.feige.controller;


import com.feige.core.ResultAjax;
import com.feige.pojo.Comment;
import com.feige.pojo.CommentAndReplies;
import com.feige.service.CommentService;
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
 * @since 2020-04-18
 */
@Api(tags = "评论的增删改查接口")
@RestController
@RequestMapping("/api/comment")
public class CommentController {

    @Resource
    private CommentService commentService;

    @ApiOperation(value = "查询评论")
    @ApiImplicitParam(name = "dynamicId", value = "动态ID",required = true)
    @GetMapping("/get/{dynamicId}")
    public ResultAjax getComment(@PathVariable("dynamicId") String dynamic){
        List<CommentAndReplies> comments = commentService.getComments(dynamic);
        //System.out.println(comments);
        return ResultAjax.success(comments);
    }
    @ApiOperation(value = "增加一条评论")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "avatar",value = "头像"),
            @ApiImplicitParam(name = "dynamicId",value = "评论动态的ID"),
            @ApiImplicitParam(name = "parentId",value = "父评论",required = false),
            @ApiImplicitParam(name = "nickname",value = "用户昵称"),
            @ApiImplicitParam(name = "content",value = "评论内容"),
            @ApiImplicitParam(name = "toNickname",value = "被回复对象",required = false),
            @ApiImplicitParam(name = "userId",value = "评论对象的ID")
    })
    @PostMapping("/add")
    public ResultAjax addComment(String avatar, String dynamicId,String parentId, String nickname, String content, String toNickname,String userId){
        if ("null".equals(parentId)){
            parentId = null;
        }
        Comment comment = Comment.builder()
                .avatar(avatar)
                .dynamicId(dynamicId)
                .content(content)
                .nickname(nickname)
                .toNickname(toNickname)
                .parentId(parentId)
                .userId(userId)
                .build();
        //System.out.println(comment);
        boolean save = commentService.save(comment);
        if (save){
            return ResultAjax.success();
        }else {
            return ResultAjax.error();
        }
    }
}

