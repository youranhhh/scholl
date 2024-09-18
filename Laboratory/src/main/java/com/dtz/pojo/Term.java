package com.dtz.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName term
 */
@TableName(value ="term")
@Data
public class Term implements Serializable {
    /**
     * 
     */
    private Integer Id;

    /**
     * 
     */
    private String termName;

    /**
     * 
     */
    private Integer recordId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}