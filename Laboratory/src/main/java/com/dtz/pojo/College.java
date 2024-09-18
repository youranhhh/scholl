package com.dtz.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName college
 */
@TableName(value ="college")
@Data
public class College implements Serializable {
    /**
     * 
     */
    private Integer Id;

    /**
     * 
     */
    private String collegeName;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}