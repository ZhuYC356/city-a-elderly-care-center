package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Money;
import com.example.nursing_center.service.impl.FinancialServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 存储老人项目的财务信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/financial")
public class FinancialController {
    @Resource
    private FinancialServiceImpl financialService;
    @GetMapping("/getAll")
    public List<Money> getAll(){
        return financialService.getAll();
    }
}
