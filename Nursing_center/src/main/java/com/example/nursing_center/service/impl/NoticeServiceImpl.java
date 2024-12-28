package com.example.nursing_center.service.impl;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.Notice;
import com.example.nursing_center.mapper.NoticeMapper;
import com.example.nursing_center.service.INoticeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 公告信息表 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements INoticeService {
    @Resource
    NoticeMapper noticeMapper;

    @Override
    public Result gatAll() {
        return Result.success(noticeMapper.gatAll());
    }
}
