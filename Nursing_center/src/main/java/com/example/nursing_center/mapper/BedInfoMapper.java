package com.example.nursing_center.mapper;

import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.controller.Result.ManagerElder;
import com.example.nursing_center.pojo.BedInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 存储床位基本信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface BedInfoMapper extends BaseMapper<BedInfo> {

    Integer add(BedInfo bedInfo);

    List<ManagerElder> getAll();

    List<ManagerElder> select(Form form);
}
