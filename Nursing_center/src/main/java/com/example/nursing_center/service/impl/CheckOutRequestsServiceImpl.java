package com.example.nursing_center.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.nursing_center.common.Result;
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
    public List<BackForm> select(String name, Integer bedId, String checkInDate) {
        return checkOutRequestsMapper.select(name, bedId, checkInDate);
    }

    @Override
    public Result agree(BackForm backForm) {
        return Result.success(checkOutRequestsMapper.updateApprovalStatus(backForm));
    }




}
