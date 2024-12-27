package com.example.nursing_center.mapper;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.AssignNurse;
import com.example.nursing_center.pojo.NurseInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 存储护工基本信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface NurseInfoMapper extends BaseMapper<NurseInfo> {

    List<NurseInfo> getAll();

    Integer addInfo(NurseInfo nurseInfo);

    NurseInfo getAllById(Integer nurseId);
    // 获取所有护工信息，支持模糊查询
    List<AssignNurse> findAllNurses(@Param("nurseName") String nurseName);

    // 查询特定护工（可以加入更多查询条件）
    AssignNurse findNurseById(@Param("nurseId") int nurseId);
}
