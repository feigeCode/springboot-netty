package com.feige.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
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
@ApiModel(value="Dynamic对象", description="")
@Builder
public class Dynamic implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.INPUT)
    private String id;

    private String content;

    private String image;

    private Boolean isDraft;

    private Boolean isAudit;

    private String userId;

    private String school;

    @TableLogic
    private Boolean isDelete;

    @TableField(fill = FieldFill.INSERT)
    private String gmtCreate;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String gmtModified;

    private Integer forwarding;

    private Integer good;


}
