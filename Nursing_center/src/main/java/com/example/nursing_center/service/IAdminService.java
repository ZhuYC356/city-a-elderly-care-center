package com.example.nursing_center.service;

import com.example.nursing_center.controller.Result.Login;
import com.example.nursing_center.pojo.Admin;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 管理员 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface IAdminService extends IService<Admin> {
    Integer register(Admin admin);

    List<Admin> Login(Login login);

}
