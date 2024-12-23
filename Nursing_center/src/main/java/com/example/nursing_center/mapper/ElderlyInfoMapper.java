package com.example.nursing_center.mapper;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.pojo.ElderlyInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 存储老人详细信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface ElderlyInfoMapper extends BaseMapper<ElderlyInfo> {


    List<Info> getAll();

    Integer add(Info info);

    List<Info> selectByFrom(ElderlyInfo elderlyInfo);
}
