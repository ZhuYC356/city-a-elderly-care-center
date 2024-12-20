package com.example.nursing_center.controller;


import com.example.nursing_center.pojo.CheckOutRequests;
import com.example.nursing_center.service.ICheckOutRequestsService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-20
 */
@RestController
@RequestMapping("/check-out-requests")
public class CheckOutRequestsController {

    @Resource
    private ICheckOutRequestsService iCheckOutRequestsService;

    @GetMapping("list")
    public List<CheckOutRequests> list(){
        return iCheckOutRequestsService.list();
    }
}
