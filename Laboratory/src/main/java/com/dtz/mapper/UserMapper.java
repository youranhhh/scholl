package com.dtz.mapper;

import com.dtz.pojo.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
* @author Administrator
* @description 针对表【user】的数据库操作Mapper
* @createDate 2024-06-19 02:13:20
* @Entity com.dtz.pojo.User
*/
@Mapper
public interface UserMapper extends BaseMapper<User> {
    List<User> listAll();
}




