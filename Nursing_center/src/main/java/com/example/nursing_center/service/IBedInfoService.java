package com.example.nursing_center.service;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.BedInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.nursing_center.pojo.ElderlyInfo;

/**
 * <p>
 * 存储床位基本信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface IBedInfoService extends IService<BedInfo> {

    Result add(BedInfo bedInfo);

    Result getAll();
}
