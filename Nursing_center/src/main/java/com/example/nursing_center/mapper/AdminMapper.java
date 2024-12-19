package com.example.nursing_center.mapper;

import com.example.nursing_center.controller.Result.Login;
import com.example.nursing_center.pojo.Admin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 管理员 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface AdminMapper extends BaseMapper<Admin> {
    Integer register(Admin admin);

    List<Admin> Login(Login login);
}
