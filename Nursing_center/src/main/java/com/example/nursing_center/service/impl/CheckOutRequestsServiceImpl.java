package com.example.nursing_center.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.common.enums.ResultCodeEnum;
import com.example.nursing_center.controller.Result.BackForm;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.mapper.CheckOutRequestsMapper;
import com.example.nursing_center.pojo.CheckOutRequests;
import com.example.nursing_center.service.ICheckOutRequestsService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
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
    public List<BackForm> gainAll() {
        return checkOutRequestsMapper.gainAll();
    }



    @Override
    public Result revoke(BackForm approvalData) {
        int result = checkOutRequestsMapper.updateApprovalStatusToRevoke(approvalData);
        if (result > 0) {
            return Result.success("撤销成功");
        }
        return Result.failure("撤销失败");
    }


    @Override
    public List<BackForm> select(String name, Integer bedId, LocalDateTime checkInDate) {
        return checkOutRequestsMapper.select(name, bedId, checkInDate);
    }

    @Override
    public Result agree(BackForm backForm) {
        return Result.success(checkOutRequestsMapper.updateApprovalStatus(backForm));
    }

    @Override
    public Result add(Info info) {
        if (checkOutRequestsMapper.selectByIdCount(info.getElderlyId())!=0){
            return Result.error(ResultCodeEnum.APPLY_OUT_SIGN_ERROR);
        }
        return Result.success(checkOutRequestsMapper.add(info));
    }
}
