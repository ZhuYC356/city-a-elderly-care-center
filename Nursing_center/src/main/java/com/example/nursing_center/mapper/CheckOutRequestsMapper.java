package com.example.nursing_center.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
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


    List<BackForm> gainAll();

    int updateApprovalStatusToRevoke(BackForm approvalData);

    List<BackForm> select(String name, Integer bedId, String checkInDate);

    Integer updateApprovalStatus(BackForm backForm);


}
