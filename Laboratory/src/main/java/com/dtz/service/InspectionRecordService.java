package com.dtz.service;

import com.dtz.pojo.InspectionRecord;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dtz.pojo.Laboratory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
* @author Administrator
* @description 针对表【inspection_record(巡查记录表)】的数据库操作Service
* @createDate 2024-06-19 02:13:20
*/
public interface InspectionRecordService extends IService<InspectionRecord> {

    List<InspectionRecord> listAll(Integer userId);
    List<InspectionRecord> listli();
    InspectionRecord  updateStatus(int id, int status);
}
