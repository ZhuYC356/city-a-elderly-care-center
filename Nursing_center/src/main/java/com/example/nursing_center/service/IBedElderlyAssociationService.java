package com.example.nursing_center.service;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.BedElderlyAssociation;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 存储疗养院床位与老人之间的关联信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface IBedElderlyAssociationService extends IService<BedElderlyAssociation> {

    Result add(BedElderlyAssociation bedElderlyAssociation);

    Result edit(BedElderlyAssociation bedElderlyAssociation);
}
