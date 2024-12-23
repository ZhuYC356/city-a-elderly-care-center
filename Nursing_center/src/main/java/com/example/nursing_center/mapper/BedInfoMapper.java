package com.example.nursing_center.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.nursing_center.common.SelectBedInfoResult;
import com.example.nursing_center.common.enums.BedStatusCount;
import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.controller.Result.ManagerElder;
import com.example.nursing_center.pojo.BedInfo;

import java.util.List;

/**
 * <p>
 * 存储床位基本信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface BedInfoMapper extends BaseMapper<BedInfo> {

    Integer add(BedInfo bedInfo);

    List<ManagerElder> getAll();

    int updateBed(ManagerElder managerElder);

    int addBed(BedInfo bedInfo);

    List<ManagerElder> selectAll(Form form);

    List<ManagerElder> selectName(Form form);

    List<ManagerElder> selectNumber(Form form);

    BedInfo selectByFRB(BedInfo bedInfo);

    List<SelectBedInfoResult> selectBedInfoByFloor(Integer floor);

    List<BedStatusCount> getBedStatusCount(Integer floor);

    List<Integer> getAllFloor();

    List<Integer> selectAllRoomByFloor(Integer floorNumber);

    List<Integer> getAllBedByRoom(Integer roomNumber);

    List<Integer> getAllRoom();

    List<Integer> getAllBed();
}
