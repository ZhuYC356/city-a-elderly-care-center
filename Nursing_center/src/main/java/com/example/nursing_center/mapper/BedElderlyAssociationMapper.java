package com.example.nursing_center.mapper;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.BedElderlyAssociation;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 存储疗养院床位与老人之间的关联信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface BedElderlyAssociationMapper extends BaseMapper<BedElderlyAssociation> {

    Integer add(BedElderlyAssociation bedElderlyAssociation);
}
