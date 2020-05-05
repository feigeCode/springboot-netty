package com.feige.controller;

import com.feige.core.ResultAjax;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Api(tags = "图片上传接口")
@RestController
@RequestMapping("/api")
public class UploadController {

    @ApiOperation("上传图片")
    @RequestMapping("/upload")
    public ResultAjax upload(HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String user = request.getParameter("user");
        System.out.println(user);
        if(!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String path;
            String type;
            assert fileName != null;
            type = fileName.contains(".") ? fileName.substring(fileName.lastIndexOf(".") + 1) : null;
            if (type != null) {
                if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())) {
                    // 项目在容器中实际发布运行的根路径
                    //String realPath = request.getSession().getServletContext().getRealPath("/");
                    // 自定义的文件名称
                    String trueFileName = System.currentTimeMillis() + fileName;
                    // 设置存放图片文件的路径
                    path =   "E:\\project\\java-project\\java-project\\base\\springboot-netty\\src\\main\\java\\com\\feige\\uploads\\" + trueFileName;
                    System.out.println(path);
                    file.transferTo(new File(path));
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
