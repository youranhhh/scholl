package com.dtz.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dtz.pojo.Laboratory;
import com.dtz.pojo.User;
import com.dtz.service.LaboratoryService;
import com.dtz.mapper.LaboratoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author Administrator
* @description 针对表【laboratory】的数据库操作Service实现
* @createDate 2024-06-19 02:13:20
*/
@Service
public class LaboratoryServiceImpl extends ServiceImpl<LaboratoryMapper, Laboratory>
    implements LaboratoryService{
    @Autowired
    private LaboratoryMapper laboratoryMapper;
    @Override
    public List<Laboratory> listAll() {
        return laboratoryMapper.listAll();
    }

}




