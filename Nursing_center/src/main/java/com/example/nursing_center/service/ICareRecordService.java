package com.example.nursing_center.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.nursing_center.controller.Result.RecordForm;
import com.example.nursing_center.pojo.CareRecord;

import java.util.List;

/**
 * <p>
 * 存储老人的护理记录信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface ICareRecordService extends IService<CareRecord> {

    List<RecordForm> getRecord();

    List<RecordForm> select(String elderlyName, String projectName);

    List<RecordForm> getRecordById(Integer elderlyId);

    String removeRecord(Integer elderlyId);
}
