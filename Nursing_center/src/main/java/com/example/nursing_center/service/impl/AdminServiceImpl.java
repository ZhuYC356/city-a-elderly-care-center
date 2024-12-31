package com.example.nursing_center.service.impl;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.common.enums.ResultCodeEnum;
import com.example.nursing_center.controller.Result.Login;
import com.example.nursing_center.pojo.Admin;
import com.example.nursing_center.mapper.AdminMapper;
import com.example.nursing_center.service.IAdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.nursing_center.util.AccountGenerator;
import com.example.nursing_center.util.MD5Util;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

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
    @Resource
    private AdminMapper adminMapper;
    @Override
    public Integer register(Admin admin) {
        return adminMapper.register(admin);
    }

    @Override
    public List<Admin> Login(Login login) {
        return adminMapper.Login(login);
    }

    @Override
    public Result add(Admin admin) {
//        UUID生成账户号
        admin.setUsername(AccountGenerator.generateAccount());
        if (adminMapper.selectByIdCount(admin.getUsername())!=0){
//            return Result.error(ResultCodeEnum.USER_EXIST_ERROR);
            admin.setUsername(AccountGenerator.generateAccount());
        }
        admin.setPassword(MD5Util.encrypt(admin.getPassword()));
        admin.setRole("ADMIN");
        return Result.success(adminMapper.add(admin));
    }

    @Override
    public List<Admin> gatAll() {
        return adminMapper.getAll();
    }
}
