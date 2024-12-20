package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Back;
import com.example.nursing_center.pojo.CheckOutRequests;
import com.example.nursing_center.service.ICheckOutRequestsService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

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
    private ICheckOutRequestsService checkOutRequestsService;

    /**
     * 获取所有
     * @return
     */
    @GetMapping("list")
    public List<CheckOutRequests> list(){
        return checkOutRequestsService.list();
    }

    @PostMapping ("select")
    public Result select(@RequestBody Back back){
        return checkOutRequestsService.select(back);
    }

}
