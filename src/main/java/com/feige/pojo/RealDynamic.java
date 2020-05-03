package com.feige.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="小程序端需要的Dynamic对象", description="")
@AllArgsConstructor
@NoArgsConstructor
public class RealDynamic implements Serializable {
    private static final long serialVersionUID = -5191143666297948127L;
    /*
    id:,
    avatar:'',
    nickname:'',
    content:'',
    gmtCreate:'',
    mediaList:[],
    good:0
     */
    @TableId(value = "id", type = IdType.INPUT)
    private String id;

    private String content;

    private String image;

    private String nickname;

    private String avatar;

    private String gmtCreate;

    private Integer good;
}
