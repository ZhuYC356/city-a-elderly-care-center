package com.example.nursing_center.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.mapper.BedInfoMapper;
import com.example.nursing_center.mapper.ElderlyInfoMapper;
import com.example.nursing_center.pojo.BedInfo;
import com.example.nursing_center.pojo.ElderlyInfo;
import com.example.nursing_center.service.IElderlyInfoService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 存储老人详细信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class ElderlyInfoServiceImpl extends ServiceImpl<ElderlyInfoMapper, ElderlyInfo> implements IElderlyInfoService {
    @Resource
    ElderlyInfoMapper elderlyInfoMapper;

    @Resource
    BedInfoMapper bedInfoMapper;

    @Override
    public Result getAll() {
        return Result.success(elderlyInfoMapper.getAll());
    }

    @Override
    public Result add(Info info) {
        BedInfo bedInfo=new BedInfo();
        bedInfo.setFloorNumber(info.getFloorNumber());
        bedInfo.setRoomNumber(info.getRoomNumber());
        bedInfo.setBedNumber(info.getBedNumber());
        bedInfo.setBedType("1");
        bedInfo.setBedStatus("O");
        bedInfoMapper.add(bedInfo);
        bedInfo=bedInfoMapper.selectByFRB(bedInfo);
        info.setBedId(bedInfo.getBedId());
        elderlyInfoMapper.add(info);
        return Result.success();
    }
}
