package com.example.nursing_center.controller;

import cn.hutool.core.date.DateTime;
import com.example.nursing_center.common.enums.ResultCodeEnum;
import com.example.nursing_center.controller.Result.Login;
import com.example.nursing_center.service.IAdminService;
import com.example.nursing_center.util.MD5Util;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.Admin;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
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
    public Result register(@RequestBody Admin admin) {
        String encry = MD5Util.encrypt(admin.getPassword());
        admin.setPassword(encry);
        Integer result = adminService.register(admin);
        return result == 1 ? Result.success() : Result.error();
    }

    @PostMapping("/login")
    public Result login(@RequestBody Login login) {
        login.setPassword(MD5Util.encrypt(login.getPassword()));
        System.out.println(login.getPassword());
        List<Admin> list = adminService.Login(login);
        if (!list.isEmpty()) {
            Admin admin = list.get(0);
            admin.setDatetime(new DateTime());
            return Result.success(admin);
        }else {
            return Result.error(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
    }

    @GetMapping("/getAll")
    public Result getAll() {
        System.out.println("______________________________________________" + adminService.gatAll());
        return Result.success(adminService.gatAll());
    }

    @PostMapping("/add")
    public Result add(@RequestBody Admin admin) {
        System.out.println(admin + "___________________________________-");
        return adminService.add(admin);
    }

    @GetMapping("/deleteById/{id}")
    public Result deleteById(@PathVariable("id") Integer id) {
        return adminService.removeById(id) ? Result.success() : Result.error();
    }
    @GetMapping("/getById/{id}")
    public Result getById(@PathVariable Integer id) {
        return Result.success(adminService.getById(id));
    }
    @PostMapping("/update")
    public Result update(@RequestBody Admin admin) {
        return adminService.updateById(admin) ? Result.success() : Result.error();
    }
}
