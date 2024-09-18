package com.dtz.service;

import com.dtz.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author Administrator
* @description 针对表【user】的数据库操作Service
* @createDate 2024-06-19 02:13:20
*/
public interface UserService extends IService<User> {
    User getByUsername(String username);
    List<User> listAll();

}
