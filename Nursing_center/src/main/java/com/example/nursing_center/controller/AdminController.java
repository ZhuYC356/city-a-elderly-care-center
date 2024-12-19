package com.example.nursing_center.controller;

import com.example.nursing_center.controller.Result.Login;
import com.example.nursing_center.service.IAdminService;
import com.example.nursing_center.util.MD5Util;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.Admin;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 管理员 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private IAdminService adminService;
    @PostMapping("/register")
    public Result register(@RequestBody Admin admin){
        String encry= MD5Util.encrypt(admin.getPassword());
        admin.setPassword(encry);
        Integer result =adminService.register(admin);
        return result==1? Result.success():Result.error();
    }
    @PostMapping("/login")
    public Result login(@RequestBody Login login){
        login.setPassword(MD5Util.encrypt(login.getPassword()));
        System.out.println(login.getPassword());
        List<Admin> list=adminService.Login(login);
        return list.isEmpty()==false? Result.success():Result.error();
    }

}
