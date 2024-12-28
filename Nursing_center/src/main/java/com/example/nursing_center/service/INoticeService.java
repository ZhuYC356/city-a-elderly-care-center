package com.example.nursing_center.service;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.Notice;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 公告信息表 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface INoticeService extends IService<Notice> {

    Result gatAll();
}
