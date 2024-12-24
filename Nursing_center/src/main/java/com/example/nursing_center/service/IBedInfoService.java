package com.example.nursing_center.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.common.SelectBedInfoResult;
import com.example.nursing_center.common.enums.BedStatusCount;
import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.controller.Result.ManagerElder;
import com.example.nursing_center.pojo.BedInfo;

import java.util.List;

/**
 * <p>
 * 存储床位基本信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface IBedInfoService extends IService<BedInfo> {

    Result  add(BedInfo bedInfo);

    Result getAll();

    Result select(Form form);

    List<SelectBedInfoResult> selectBedInfoByFloor(Integer floor);
    Result addBed(BedInfo bedInfo);
    Result updateBed(ManagerElder managerElder);

    List<BedStatusCount> getBedStatusCount(Integer floor);

    Result getBedByAllFloor();

    Result getAllRoomByFloor(Integer floorNumber,Integer sing);

    Result getAllBedByRoom(Integer roomNumber,Integer sing);

    Result getAllRoom();

    Result getAllBed();
}
