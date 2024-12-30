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
    public List<RecordForm> getRecordById(Integer elderlyId, Integer projectId) {
        return careRecordMapper.getRecordById(elderlyId,projectId);
    }

   /* @Override
    public String removeRecord(Integer elderlyId, Integer projectId) {
        String status = careRecordMapper.getCareStatus(elderlyId,projectId);
        if ("1".equals(status)) {
            careRecordMapper.deleteByElderlyId(elderlyId,projectId);

            return "记录已成功移除";
        } else {
            return "只能移除护理状态为1的记录";
        }
    }*/
    @Override
    public String removeRecord(Integer elderlyId, Integer projectId) throws Exception {
        // 查询当前记录的护理状态
        String careStatus = careRecordMapper.getCareStatus(elderlyId, projectId);

        // 判断是否为护理状态 "1"
        if ("1".equals(careStatus)) {
            System.out.println("正在执行逻辑删除...");
            // 如果状态是 1，执行逻辑删除（更新 careStatus 为 0）
            int updateCount = careRecordMapper.updateCareStatus(elderlyId, projectId, 0);
            if (updateCount > 0) {
                return "记录已成功移除（逻辑删除）";
            } else {
                throw new Exception("更新护理状态失败");
            }
        } else {
            throw new Exception("只能移除护理状态为1的记录");
        }
    }



    @Override
    public List<ServiceConcern> getAllElderlyProjects() {
        return careRecordMapper.getAllElderlyProjects();
    }


}
