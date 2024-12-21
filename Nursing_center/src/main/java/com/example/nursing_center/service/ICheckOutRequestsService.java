package com.example.nursing_center.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Back;
import com.example.nursing_center.controller.Result.BackForm;
import com.example.nursing_center.pojo.CheckOutRequests;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-20
 */
public interface ICheckOutRequestsService extends IService<CheckOutRequests> {

    Result select(Back back);

    Result add(CheckOutRequests checkOutRequests);

    List<BackForm> gainAll();
}
