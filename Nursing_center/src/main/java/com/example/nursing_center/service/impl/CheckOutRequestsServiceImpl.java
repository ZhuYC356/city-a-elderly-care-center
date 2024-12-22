package com.example.nursing_center.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Back;
import com.example.nursing_center.controller.Result.BackForm;
import com.example.nursing_center.mapper.CheckOutRequestsMapper;
import com.example.nursing_center.pojo.CheckOutRequests;
import com.example.nursing_center.service.ICheckOutRequestsService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-20
 */
@Service
public class CheckOutRequestsServiceImpl extends ServiceImpl<CheckOutRequestsMapper, CheckOutRequests> implements ICheckOutRequestsService {

    @Resource
    private CheckOutRequestsMapper checkOutRequestsMapper;

    @Override
    public Result select(Back back) {
        if(back.getName()!=null&&back.getBedId()!=null&&back.getCheckInDate()!=null){
            return Result.success(checkOutRequestsMapper.selectAll());
        }
        else if(back.getName()!=null&&back.getBedId()==null&&back.getCheckInDate()==null){
            return Result.success(checkOutRequestsMapper.selectName(back));
        }
        else if(back.getName()==null&&back.getBedId()!=null&&back.getCheckInDate()==null){
            return Result.success(checkOutRequestsMapper.selectBedId(back));
        }
        else if(back.getName()==null&&back.getBedId()==null&&back.getCheckInDate()!=null){
            return Result.success(checkOutRequestsMapper.selectDate(back));
        }
        else{
            return Result.success(checkOutRequestsMapper.getAll());
        }
    }




    @Override
    public List<BackForm> gainAll() {
        return checkOutRequestsMapper.gainAll();
    }

    @Override
    public Result agree() {
        return null;
    }

    @Override
    public Result add(BackForm backForm) {
        return null;
    }

    @Override
    public Result approveCheckOutRequest(BackForm backForm) {
        // 检查审批人和审批时间是否存在
        if (backForm.getApprovalPerson() == null || backForm.getApprovalTime() == null) {
            throw new IllegalArgumentException("审批人和审批时间不能为空");
        }

        // 更新审批状态为通过 (2)，并设置审批人和审批时间
        checkOutRequestsMapper.updateApprovalStatus(
                backForm.getElderlyId(),
                2, // 审批通过
                backForm.getApprovalPerson(),
                backForm.getApprovalTime()
        );
        return Result.success();
    }

    @Override
    public Result revokeCheckOutRequest(BackForm backForm) {
        // 检查撤销人和撤销时间是否存在
        if (backForm.getApprovalPerson() == null || backForm.getApprovalTime() == null) {
            throw new IllegalArgumentException("撤销人和撤销时间不能为空");
        }

        // 更新审批状态为撤销 (3)，并设置撤销人和撤销时间
        checkOutRequestsMapper.updateApprovalStatus(
                backForm.getElderlyId(),
                3, // 审批撤销
                backForm.getApprovalPerson(),
                backForm.getApprovalTime()
        );
        return Result.success();
    }


}
