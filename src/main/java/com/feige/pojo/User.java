package com.feige.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author feige
 * @since 2020-04-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="User对象", description="")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "uid", type = IdType.INPUT)
    private String uid;

    private String avatar;

    private String nickname;

    private String phone;

    private String email;

    private Boolean sex;

    private Integer age;

    private Boolean isTeacher;
    //只有是老师才会有下面
    //心里证书
    private String certificate;
    //自我介绍
    private String introduce;

    private String detailedAddress;

    private String school;

    @TableLogic
    private Boolean isDelete;

    @TableField(fill = FieldFill.INSERT)
    private String gmtCreate;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String gmtModified;
}
