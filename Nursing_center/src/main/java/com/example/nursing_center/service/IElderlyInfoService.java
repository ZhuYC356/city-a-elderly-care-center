package com.example.nursing_center.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.pojo.ElderlyInfo;

/**
 * <p>
 * 存储老人详细信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface IElderlyInfoService extends IService<ElderlyInfo> {


    Result getAll();

    Result add(Info info);

    Result selectByFrom(ElderlyInfo elderlyInfo);

    Result updateAllById(Info info);

    Result getElderlyInfoByRoomAndBed(String roomNumber, String bedNumber, Integer floorNumber);

    Result getElderlyInfoByIdNumber(String idNumber);

    Result getAllById(Integer id);
}
