package com.example.nursing_center.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.nursing_center.controller.Result.Back;
import com.example.nursing_center.controller.Result.BackForm;
import com.example.nursing_center.pojo.CheckOutRequests;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-20
 */
public interface CheckOutRequestsMapper extends BaseMapper<CheckOutRequests> {




    /*List<BackForm> selectAll();

    List<BackForm> selectName(Back back);

    List<BackForm> selectBedId(Back back);

    List<BackForm> selectDate(Back back);

    List<BackForm> getAll();*/

    List<BackForm> gainAll();

    int updateApprovalStatus(BackForm approvalData);
    int updateApprovalStatusToRevoke(BackForm approvalData);
    List<BackForm> selectByCriteria(Back form);








}
