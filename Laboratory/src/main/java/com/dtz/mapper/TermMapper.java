package com.dtz.mapper;

import com.dtz.pojo.Term;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.boot.autoconfigure.domain.EntityScan;

/**
* @author Administrator
* @description 针对表【term】的数据库操作Mapper
* @createDate 2024-06-19 02:13:20
* @Entity com.dtz.pojo.Term
*/
@Mapper
@EntityScan("com.dtz.pojo.Term")
public interface TermMapper extends BaseMapper<Term> {

}




