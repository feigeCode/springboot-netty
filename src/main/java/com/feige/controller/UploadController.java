package com.feige.controller;

import com.feige.core.ResultAjax;
import com.feige.utils.RedisUtil;
import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Api(tags = "图片上传接口")
@RestController
@RequestMapping("/api")
public class UploadController {

    @Resource
    private FastFileStorageClient fastFileStorageClient;

    @Resource
    private RedisUtil redisUtil;


    @ApiOperation("上传图片")
    @RequestMapping("/upload")
    public ResultAjax upload(HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String userId = request.getParameter("userId");
        System.out.println(userId);
        if(!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String type;
            assert fileName != null;
            type = fileName.contains(".") ? fileName.substring(fileName.lastIndexOf(".") + 1) : null;
            if (type != null) {
                if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())) {
                    StorePath storePath = fastFileStorageClient.uploadFile(file.getInputStream(),file.getSize(),type,null);
                    //判断上次上传的图片地址是否删除
                    boolean key = redisUtil.hasKey(userId);
                    if (key){
                        redisUtil.del(userId);
                    }
                    boolean b = redisUtil.lSet(userId, "https://www.pyfeige.com/"+storePath.getFullPath());
                    if (!b){
                        return ResultAjax.error();
                    }
                    System.out.println(storePath.getFullPath());
                    System.out.println(storePath.getGroup());
                    System.out.println(storePath.getPath());
                }else {
                    return ResultAjax.error("文件类型不合法");
                }
            }else {
                return ResultAjax.error("文件类型不合法");
            }
        }else {
            return ResultAjax.error("文件不能为空");
        }
        return ResultAjax.success();
    }
}
