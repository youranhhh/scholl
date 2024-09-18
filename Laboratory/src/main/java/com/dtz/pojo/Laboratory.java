package com.dtz.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName laboratory
 */
@TableName(value ="laboratory")
@Data
public class Laboratory implements Serializable {
    /**
     * 
     */
    private Integer Id;

    /**
     * 
     */
    private Integer userId;

    /**
     * 
     */
    private String laboratoryName;

    /**
     * 
     */
    private String laboratoryLocation;

    /**
     * 
     */
    private Integer collegeId;
    @TableField(exist = false)
    private College college;
    @TableField(exist = false)
    private User user;
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}