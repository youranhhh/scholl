package com.dtz.service;

import com.dtz.pojo.Laboratory;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dtz.pojo.User;

import java.util.List;

/**
* @author Administrator
* @description 针对表【laboratory】的数据库操作Service
* @createDate 2024-06-19 02:13:20
*/
public interface LaboratoryService extends IService<Laboratory> {
    List<Laboratory> listAll();

}
