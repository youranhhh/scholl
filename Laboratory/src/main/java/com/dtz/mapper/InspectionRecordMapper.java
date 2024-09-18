package com.dtz.mapper;

import com.dtz.pojo.InspectionRecord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dtz.pojo.Laboratory;

import java.util.List;

/**
* @author Administrator
* @description 针对表【inspection_record(巡查记录表)】的数据库操作Mapper
* @createDate 2024-06-19 02:13:20
* @Entity com.dtz.pojo.InspectionRecord
*/
public interface InspectionRecordMapper extends BaseMapper<InspectionRecord> {
    List<InspectionRecord> listAll(Integer userId);
    List<InspectionRecord> listli();
    InspectionRecord  updateStatus(int id, int status);
}




