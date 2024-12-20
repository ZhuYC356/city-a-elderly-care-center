package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;

import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.pojo.BedInfo;
import com.example.nursing_center.service.IBedInfoService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 存储床位基本信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/bed-info")
public class BedInfoController {
    @Resource
    private IBedInfoService bedInfoService;
    /**
     * 添加
     * @param bedInfo bed_number,bed_type,bed_status,floor_number,room_number,floor
     * @return
     */
    @PostMapping("/add")
    public Result add (@RequestBody BedInfo bedInfo){
        return bedInfoService.add(bedInfo);
    }
    @GetMapping("getAll")
    public Result getAll(){
        return bedInfoService.getAll();
    }
    @PostMapping("/select")
    public Result select (@RequestBody Form form){
        System.out.println(form);
        return bedInfoService.select(form);
    }
}
