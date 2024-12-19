package com.example.nursing_center.service.impl;

import com.example.nursing_center.pojo.CareRecord;
import com.example.nursing_center.mapper.CareRecordMapper;
import com.example.nursing_center.service.ICareRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 存储老人的护理记录信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class CareRecordServiceImpl extends ServiceImpl<CareRecordMapper, CareRecord> implements ICareRecordService {

}
