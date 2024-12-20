package com.example.nursing_center.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.nursing_center.controller.Result.Back;
import com.example.nursing_center.pojo.CheckOutRequests;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-20
 */
public interface CheckOutRequestsMapper extends BaseMapper<CheckOutRequests> {


    Object selectAll(Back back);

    Object selectName(Back back);

    Object selectBedId(Back back);

    Object selectDate(Back back);

    Object getAll();
}
