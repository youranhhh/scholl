package com.dtz.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 巡查记录表
 * @TableName inspection_record
 */
@TableName(value ="inspection_record")
@Data
public class InspectionRecord implements Serializable {
    /**
     * 
     */
    private Integer Id;
    private Integer status;
    /**
     * 
     */
    private Integer userId;
    private Integer termId;

    /**
     * 
     */
    private Integer laboratoryId;

    /**
     * 
     */
    private String door;

    /**
     * 
     */
    private String device;

    /**
     * 
     */
    private String fireFacilities;

    /**
     * 
     */

    private String inspectionDate;
    @TableField(exist = false)
    private Laboratory laboratory;
    @TableField(exist = false)
    private User user;
    @TableField(exist = false)
    private Term term;
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}