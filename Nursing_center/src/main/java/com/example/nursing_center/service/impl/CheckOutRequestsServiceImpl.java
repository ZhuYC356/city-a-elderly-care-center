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


   /* @Override
    public Result select(Back back) {
        // 如果提供了姓名、老人ID和入住日期，则查询所有条件的记录
        if (back.getName() != null && back.getElderlyId() != null && back.getCheckInDate() != null) {
            return Result.success(checkOutRequestsMapper.selectAll());
        }
        // 如果只提供了老人姓名，则查询姓名匹配的记录
        else if (back.getName() != null && back.getElderlyId() == null && back.getCheckInDate() == null) {
            return Result.success(checkOutRequestsMapper.selectName(back));
        }
        // 如果只提供了老人ID，则查询ID匹配的记录
        else if (back.getName() == null && back.getElderlyId() != null && back.getCheckInDate() == null) {
            return Result.success(checkOutRequestsMapper.selectElderlyId(back));
        }
        // 如果只提供了入住日期，则查询入住日期匹配的记录
        else if (back.getName() == null && back.getElderlyId() == null && back.getCheckInDate() != null) {
            return Result.success(checkOutRequestsMapper.selectDate(back));
        }
        // 如果没有提供任何查询条件，则查询所有数据
        else {
            return Result.success(checkOutRequestsMapper.getAll());
        }
    }*/




    @Override
    public List<BackForm> gainAll() {
        return checkOutRequestsMapper.gainAll();
    }


    @Override
    public Result agree(BackForm approvalData) {
        int result = checkOutRequestsMapper.updateApprovalStatus(approvalData);
        if (result > 0) {
            return Result.success("审批通过");
        }
        return Result.failure("审批失败");
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
    public List<BackForm> select(String name, String bedId, String checkInDate) {
        return checkOutRequestsMapper.select(name, bedId, checkInDate);
    }


}
