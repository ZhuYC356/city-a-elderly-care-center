package com.example.nursing_center.service.impl;

import com.example.nursing_center.pojo.Admin;
import com.example.nursing_center.mapper.AdminMapper;
import com.example.nursing_center.service.IAdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 管理员 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {

}
