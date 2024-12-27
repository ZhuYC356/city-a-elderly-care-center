package com.example.nursing_center.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.nursing_center.controller.Result.BackForm;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.pojo.CheckOutRequests;

import java.time.LocalDateTime;
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


    Integer updateApprovalStatus(BackForm backForm);


    List<BackForm> select(String name, Integer bedId, LocalDateTime checkInDate);

    Integer add(Info info);

    int selectByIdCount(int elderlyId);
}
