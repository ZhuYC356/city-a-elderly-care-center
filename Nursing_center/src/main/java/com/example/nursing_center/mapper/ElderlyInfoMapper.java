package com.example.nursing_center.mapper;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.AssignElderly;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.pojo.ElderlyInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 存储老人详细信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface ElderlyInfoMapper extends BaseMapper<ElderlyInfo> {


    List<Info> getAll();

    Integer add(Info info);

    List<Info> selectByFrom(ElderlyInfo elderlyInfo);

    Info getElderlyInfoByRoomAndBed(String roomNumber, String bedNumber, Integer floorNumber);

    ElderlyInfo getElderlyInfoByIdNumber(String idNumber);

    Info getAllById(Integer id);

//    Integer updateAllById(Info info);

    // 获取所有老人信息
    List<AssignElderly> findAllElderly();

    // 获取没有护工的老人信息，支持模糊查询
    List<AssignElderly> findElderlyWithoutNurse(@Param("elderlyName") String elderlyName);

    // 更新老人的护工信息
    void updateNurseForElderly(@Param("elderlyId") int elderlyId, @Param("nurseId") int nurseId);

    // 移除老人的护工信息
    void removeNurseFromElderly(@Param("elderlyId") int elderlyId);

    Integer updateAllById(Info info);
}
