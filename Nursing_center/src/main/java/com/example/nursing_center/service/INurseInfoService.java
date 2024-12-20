package com.example.nursing_center.service;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.NurseInfo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 存储护工基本信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface INurseInfoService extends IService<NurseInfo> {

    Result getAll();
}
