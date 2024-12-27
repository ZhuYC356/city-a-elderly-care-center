package com.example.nursing_center.service;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Money;
import com.example.nursing_center.pojo.Financial;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 存储老人项目的财务信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface IFinancialService extends IService<Financial> {

    List<Money> getAll();
}
