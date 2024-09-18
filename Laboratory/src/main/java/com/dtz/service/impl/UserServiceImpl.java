package com.dtz.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dtz.pojo.User;
import com.dtz.service.UserService;
import com.dtz.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author Administrator
* @description 针对表【user】的数据库操作Service实现
* @createDate 2024-06-19 02:13:20
*/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
        implements UserService{
    @Autowired
    private UserMapper userMapper;
    @Override
    public User getByUsername(String username) {
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(User::getUserName, username);
        return this.getOne(queryWrapper);
    }

    @Override
    public List<User> listAll() {
        return userMapper.listAll();
    }


}




