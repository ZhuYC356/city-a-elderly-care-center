package com.example.nursing_center.service.impl;

import cn.hutool.core.date.DateTime;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.pojo.OutingRegistration;
import com.example.nursing_center.mapper.OutingRegistrationMapper;
import com.example.nursing_center.service.IOutingRegistrationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 存储老人外出登记信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class OutingRegistrationServiceImpl extends ServiceImpl<OutingRegistrationMapper, OutingRegistration> implements IOutingRegistrationService {
    @Resource
    private OutingRegistrationMapper outingRegistrationMapper;

    @Override
    public List<OutingRegistration> getByCondition(String name, Integer bedNumber, LocalDateTime checkInTime) {
        return outingRegistrationMapper.getByCondition(name, bedNumber, checkInTime);
    }

    @Override
    public Result addInfo(Info info) {
        info.setOutingTime(DateTime.now());
//      todo 添加
        return Result.success(outingRegistrationMapper.addInfo(info));
//        return Result.success(1);
    }
}
