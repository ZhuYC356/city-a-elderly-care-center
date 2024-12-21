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
    public Result add(CheckOutRequests checkOutRequests) {
        return Result.success();
    }

    @Override
    public List<BackForm> gainAll() {
        return checkOutRequestsMapper.gainAll();
    }


}
