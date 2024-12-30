package com.example.nursing_center.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.nursing_center.controller.Result.RecordForm;
import com.example.nursing_center.controller.Result.ServiceConcern;
import com.example.nursing_center.mapper.CareRecordMapper;
import com.example.nursing_center.pojo.CareRecord;
import com.example.nursing_center.service.ICareRecordService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 存储老人的护理记录信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class CareRecordServiceImpl extends ServiceImpl<CareRecordMapper, CareRecord> implements ICareRecordService {

    @Resource
    private CareRecordMapper careRecordMapper;

    @Override
    public List<RecordForm> getRecord() {
        return careRecordMapper.getRecord();
    }

    @Override
    public List<RecordForm> select(String name, String projectName) {
        return careRecordMapper.select(name, projectName);
    }

    @Override
    public List<RecordForm> getRecordById(Integer elderlyId) {
        return careRecordMapper.getRecordById();
    }

    @Override
    public String removeRecord(Integer elderlyId) {
        String status = careRecordMapper.getCareStatus(elderlyId);
        if ("1".equals(status)) {
            careRecordMapper.deleteByElderlyId(elderlyId);
            return "记录已成功移除";
        } else {
            return "只能移除护理状态为1的记录";
        }
    }

    @Override
    public List<ServiceConcern> getAllElderlyProjects() {
        return careRecordMapper.getAllElderlyProjects();
    }


}
