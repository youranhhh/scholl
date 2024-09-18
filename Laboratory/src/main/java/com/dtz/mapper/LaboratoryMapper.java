package com.dtz.mapper;

import com.dtz.pojo.Laboratory;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dtz.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
* @author Administrator
* @description 针对表【laboratory】的数据库操作Mapper
* @createDate 2024-06-19 02:13:20
* @Entity com.dtz.pojo.Laboratory
*/
@Mapper
public interface LaboratoryMapper extends BaseMapper<Laboratory> {
    List<Laboratory> listAll();

}




