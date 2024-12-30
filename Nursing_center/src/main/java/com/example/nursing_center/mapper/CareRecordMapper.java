package com.example.nursing_center.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.nursing_center.controller.Result.RecordForm;
import com.example.nursing_center.controller.Result.ServiceConcern;
import com.example.nursing_center.pojo.CareRecord;

import java.util.List;

/**
 * <p>
 * 存储老人的护理记录信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface CareRecordMapper extends BaseMapper<CareRecord> {

    List<RecordForm> getRecord();

    List<RecordForm> select(String name, String projectName);



    String getCareStatus(Integer elderlyId, Integer projectId);


    List<ServiceConcern> getAllElderlyProjects();

    List<RecordForm> getRecordById(Integer elderlyId, Integer projectId);

    int updateCareStatus(Integer elderlyId, Integer projectId, Integer careStatus);

}
