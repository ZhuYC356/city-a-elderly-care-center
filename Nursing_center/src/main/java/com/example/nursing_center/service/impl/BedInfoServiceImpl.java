package com.example.nursing_center.service.impl;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.BedInfo;
import com.example.nursing_center.mapper.BedInfoMapper;
import com.example.nursing_center.pojo.ElderlyInfo;
import com.example.nursing_center.service.IBedInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 存储床位基本信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class BedInfoServiceImpl extends ServiceImpl<BedInfoMapper, BedInfo> implements IBedInfoService {
    @Resource
    private BedInfoMapper bedInfoMapper;
    @Override
    public Result add(BedInfo bedInfo) {
        return Result.success(bedInfoMapper.add(bedInfo));
    }

    @Override
    public Result getAll() {
        return Result.success(bedInfoMapper.getAll());
    }
}
