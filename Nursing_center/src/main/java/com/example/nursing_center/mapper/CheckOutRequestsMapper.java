package com.example.nursing_center.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Back;
import com.example.nursing_center.controller.Result.BackForm;
import com.example.nursing_center.pojo.CheckOutRequests;
import org.apache.ibatis.annotations.Param;

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




    List<BackForm> selectAll();

    List<BackForm> selectName(Back back);

    List<BackForm> selectBedId(Back back);

    List<BackForm> selectDate(Back back);

    List<BackForm> getAll();


    List<BackForm> gainAll();


    Result add();


    /**
     * 更新退住请求的审批状态
     * @param elderlyId 老人ID
     * @param approvalStatus 审批状态（2：通过，3：撤销）
     * @param approvalPerson 审批人
     * @param approvalTime 审批时间
     */
    Result updateApprovalStatus(@Param("elderlyId") String elderlyId,
                              @Param("approvalStatus") int approvalStatus,
                              @Param("approvalPerson") String approvalPerson,
                              @Param("approvalTime") String approvalTime);









}
