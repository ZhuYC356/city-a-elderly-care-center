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
//        1.更新床位并获得床位ID
        BedInfo bedInfo=new BedInfo();
        bedInfo.setFloorNumber(info.getFloorNumber());
        bedInfo.setRoomNumber(info.getRoomNumber());
        bedInfo.setBedNumber(info.getBedNumber());
        bedInfo.setBedStatus("5");//设置状态为占用
        BedInfo newbedInfo=bedInfoMapper.selectByFRB(bedInfo);//获得床位的Id
        bedInfo.setBedId(newbedInfo.getBedId());
        bedInfoMapper.updateById(bedInfo);//更新床位已经使用

//        2.添加老人信息

        info.setBedId(bedInfo.getBedId());//用于添加老人的信息表
        elderlyInfoMapper.add(info);
        System.out.println(info);
        return Result.success(1);
    }

    @Override
    public Result selectByFrom(ElderlyInfo elderlyInfo) {
        return Result.success(elderlyInfoMapper.selectByFrom(elderlyInfo));
    }

    @Override
    public Result updateAllById(Info info) {
//        todo 添加修改
        return Result.success();
//        return Result.success(elderlyInfoMapper.updateAllById(info));
    }

    @Override
    public Result getElderlyInfoByRoomAndBed(String roomNumber, String bedNumber, Integer floorNumber) {
        return Result.success(elderlyInfoMapper.getElderlyInfoByRoomAndBed(roomNumber,bedNumber,floorNumber));
    }

    @Override
    public Result getElderlyInfoByIdNumber(String idNumber) {
        return Result.success(elderlyInfoMapper.getElderlyInfoByIdNumber(idNumber));
    }

    @Override
    public Result getAllById(Integer id) {
        return Result.success(elderlyInfoMapper.getAllById(id));
    }
}
