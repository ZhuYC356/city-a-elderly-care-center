package com.example.nursing_center.service;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.common.ResultGeneric;
import com.example.nursing_center.controller.Result.AssignNurse;
import com.example.nursing_center.pojo.NurseInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 存储护工基本信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface INurseInfoService extends IService<NurseInfo> {

    Result getAll();

    Result addInfo(NurseInfo nurseInfo);

    Result getAllById(Integer nurseId);
    ResultGeneric<List<AssignNurse>> getAllNurses(String nurseName);

    Result updateInfo(NurseInfo nurseInfo);
}
