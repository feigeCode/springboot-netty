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
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="ChatMsg对象", description="")
@Builder
public class ChatMsg implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.INPUT)
    private String id;

    private String senderId;

    private String receiverId;

    private String msg;

    private Boolean signFlag;

    @TableLogic
    private Boolean isDelete;

    @TableField(fill = FieldFill.INSERT)
    private String gmtCreate;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String gmtModified;


}
