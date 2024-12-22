package com.example.nursing_center.mapper;

import com.example.nursing_center.pojo.OutingRegistration;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 存储老人外出登记信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface OutingRegistrationMapper extends BaseMapper<OutingRegistration> {

    List<OutingRegistration> getByCondition(String name, Integer bedNumber, LocalDateTime checkInTime);
}
