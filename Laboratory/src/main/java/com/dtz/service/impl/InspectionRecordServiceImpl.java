package com.dtz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dtz.mapper.LaboratoryMapper;
import com.dtz.pojo.InspectionRecord;
import com.dtz.pojo.Laboratory;
import com.dtz.service.InspectionRecordService;
import com.dtz.mapper.InspectionRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
* @author Administrator
* @description 针对表【inspection_record(巡查记录表)】的数据库操作Service实现
* @createDate 2024-06-19 02:13:20
*/
@Service
public class InspectionRecordServiceImpl extends ServiceImpl<InspectionRecordMapper, InspectionRecord>
    implements InspectionRecordService{
    @Autowired
    private InspectionRecordMapper inspectionRecordMapper;
    @Override
    public List<InspectionRecord> listAll(Integer userId) {
        return inspectionRecordMapper.listAll(userId);
    }

    @Override
    public List<InspectionRecord> listli() {
        return inspectionRecordMapper.listli();
    }
    @Override
    public InspectionRecord updateStatus(int id, int status) {
        return inspectionRecordMapper.updateStatus(id, status);
    }

}




