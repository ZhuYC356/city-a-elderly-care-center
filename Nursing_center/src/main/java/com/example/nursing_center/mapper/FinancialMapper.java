package com.example.nursing_center.mapper;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.ProjectRate;
import com.example.nursing_center.pojo.Financial;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 存储老人项目的财务信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface FinancialMapper extends BaseMapper<Financial> {

    List<Financial> getAll();


}
