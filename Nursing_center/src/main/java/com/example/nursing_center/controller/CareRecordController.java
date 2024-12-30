package com.example.nursing_center.controller;


import com.example.nursing_center.controller.Result.RecordForm;
import com.example.nursing_center.controller.Result.ServiceConcern;
import com.example.nursing_center.service.ICareRecordService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 存储老人的护理记录信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/care-record")
public class CareRecordController {
    @Resource
    private ICareRecordService careRecordService;

    /**
     * 获取所有老人的护理记录
     *
     * @return
     */
    @GetMapping("/getRecord")
    public List<RecordForm> getRecord() {
        return careRecordService.getRecord();
    }

    /**
     * 根据姓名和护理项目搜索老人护理记录
     * @param name
     * @param projectName
     * @return
     */
    @GetMapping("/select")
    public List<RecordForm> select(@RequestParam(required = false) String name,
                                   @RequestParam(required = false) String projectName) {
        return careRecordService.select(name, projectName);
    }

    /**
     * 根据老人id获取老人护理记录
     * @param elderlyId
     * @return
     */
    @GetMapping("/getRecordById")
    public List<RecordForm> getRecordById(@RequestParam Integer elderlyId) {
        return careRecordService.getRecordById(elderlyId);
    }

    /**
     * 根据护理记录ID删除护理记录，仅当护理状态为1时删除
     * @param
     * @return
     */
    @DeleteMapping("/remove")
    public String removeRecord(@RequestParam Integer elderlyId) {
        return careRecordService.removeRecord(elderlyId);
    }



    @GetMapping("/getAllElderlyProjects")
    public List<ServiceConcern> getAllElderlyProjects(){
        return careRecordService.getAllElderlyProjects();
    }
}
