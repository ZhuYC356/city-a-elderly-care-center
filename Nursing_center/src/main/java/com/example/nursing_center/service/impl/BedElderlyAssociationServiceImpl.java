package com.example.nursing_center.service.impl;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.BedElderlyAssociation;
import com.example.nursing_center.mapper.BedElderlyAssociationMapper;
import com.example.nursing_center.service.IBedElderlyAssociationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 存储疗养院床位与老人之间的关联信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class BedElderlyAssociationServiceImpl extends ServiceImpl<BedElderlyAssociationMapper, BedElderlyAssociation> implements IBedElderlyAssociationService {

    @Resource
    private BedElderlyAssociationMapper bedElderlyAssociationMapper;
    @Override
    public Result add(BedElderlyAssociation bedElderlyAssociation) {
        return Result.success(bedElderlyAssociationMapper.add(bedElderlyAssociation));
    }

    @Override
    public Result edit(BedElderlyAssociation bedElderlyAssociation) {
        return Result.success(bedElderlyAssociationMapper.updateById(bedElderlyAssociation));
    }
}
