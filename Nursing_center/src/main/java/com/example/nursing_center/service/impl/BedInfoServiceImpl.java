package com.example.nursing_center.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.common.SelectBedInfoResult;
import com.example.nursing_center.common.enums.BedStatusCount;
import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.controller.Result.ManagerElder;
import com.example.nursing_center.mapper.BedInfoMapper;
import com.example.nursing_center.pojo.BedInfo;
import com.example.nursing_center.service.IBedInfoService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 存储床位基本信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-20
 */
@Service
public class BedInfoServiceImpl extends ServiceImpl<BedInfoMapper, BedInfo> implements IBedInfoService {
    @Resource
    private BedInfoMapper bedInfoMapper;
    @Override
    public Result addBed(BedInfo bedInfo) {
        return Result.success(bedInfoMapper.addBed(bedInfo));
    }
    @Override
    public Result add(BedInfo bedInfo) {
        return null;
    }

    @Override
    public Result getAll() {
        return Result.success(bedInfoMapper.getAll());
    }
    @Override
    public Result updateBed(ManagerElder managerElder) {
        return Result.success(bedInfoMapper.updateBed(managerElder));
    }

    @Override
    public List<BedStatusCount> getBedStatusCount(Integer floor) {
        return bedInfoMapper.getBedStatusCount(floor);
    }

    @Override
    public Result getBedByAllFloor() {
        return Result.success(bedInfoMapper.getAllFloor());
    }

    @Override
    public Result getAllRoomByFloor(Integer floorNumber,Integer sing) {
        if(sing==1){
            return Result.success(bedInfoMapper.selectAllRoomByFloor(floorNumber));
        }else {
            return Result.success(bedInfoMapper.selectAllRoomByFlooralready(floorNumber));
        }

    }

    @Override
    public Result getAllBedByRoom(Integer roomNumber,Integer sing) {
        return Result.success(bedInfoMapper.getAllBedByRoom(roomNumber));
    }


    @Override
    public Result select(Form form) {
        if(form.getName()!=null&&form.getBedNumber()!=null){
            return Result.success(bedInfoMapper.selectAll(form));
        }
        else if(form.getName()!=null&&form.getBedNumber()==null){
            return Result.success(bedInfoMapper.selectName(form));
        }
        else if(form.getName()==null&&form.getBedNumber()!=null){
            return Result.success(bedInfoMapper.selectNumber(form));
        }
        else {
            return Result.success(bedInfoMapper.getAll());
        }
    }

    @Override
    public List<SelectBedInfoResult> selectBedInfoByFloor(Integer floor) {
        return bedInfoMapper.selectBedInfoByFloor(floor);
    }
}
