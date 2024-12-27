package com.example.nursing_center.service.impl;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.common.ResultGeneric;
import com.example.nursing_center.controller.Result.AssignNurse;
import com.example.nursing_center.pojo.NurseInfo;
import com.example.nursing_center.mapper.NurseInfoMapper;
import com.example.nursing_center.service.INurseInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 存储护工基本信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class NurseInfoServiceImpl extends ServiceImpl<NurseInfoMapper, NurseInfo> implements INurseInfoService {
    @Resource
    NurseInfoMapper nurseInfoMapper;
    @Override
    public Result getAll() {
        return Result.success(nurseInfoMapper.getAll());
    }


    @Override
    public ResultGeneric<List<AssignNurse>> getAllNurses(String nurseName) {
        List<AssignNurse> nurses = nurseInfoMapper.findAllNurses(nurseName);
        return new ResultGeneric<>(nurses);
    }
}
