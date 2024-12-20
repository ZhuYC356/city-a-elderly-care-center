package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.service.INurseInfoService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 存储护工基本信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/nurse-info")
public class NurseInfoController {
    @Resource
    private INurseInfoService nurseInfoService;
    @GetMapping("/getAll")
    public Result getAll() {
        return nurseInfoService.getAll();
    }

}
