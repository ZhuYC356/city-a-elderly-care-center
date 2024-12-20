package com.example.nursing_center.controller;


import com.example.nursing_center.mapper.OutingRegistrationMapper;
import com.example.nursing_center.pojo.OutingRegistration;
import com.example.nursing_center.service.IOutingRegistrationService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 存储老人外出登记信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/outing-registration")
public class OutingRegistrationController {
    @Resource
    private IOutingRegistrationService iOutingRegistrationService;

    @GetMapping("/getAll")
    public List<OutingRegistration> getAll(){
        return iOutingRegistrationService.list();
    }



}
