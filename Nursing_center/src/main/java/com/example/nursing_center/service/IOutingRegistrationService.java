package com.example.nursing_center.service;

import com.example.nursing_center.pojo.OutingRegistration;
import com.baomidou.mybatisplus.extension.service.IService;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 存储老人外出登记信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface IOutingRegistrationService extends IService<OutingRegistration> {

    List<OutingRegistration> getByCondition(String name, Integer bedNumber, LocalDateTime checkInTime);
}
