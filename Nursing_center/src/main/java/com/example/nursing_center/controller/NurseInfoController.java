package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.NurseInfo;
import com.example.nursing_center.common.ResultGeneric;
import com.example.nursing_center.controller.Result.AssignNurse;
import com.example.nursing_center.service.INurseInfoService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
    @PostMapping("/add")
    public Result addInfo(@RequestBody NurseInfo nurseInfo) {
        System.out.println("__________________________"+nurseInfo+"__________________");
//        return Result.success();
        return nurseInfoService.addInfo(nurseInfo);
    }
    @GetMapping("/getById/{nurseId}")
    public Result getById(@PathVariable("nurseId") Integer nurseId) {
        return nurseInfoService.getAllById(nurseId);
    }

    @GetMapping("/getAllNurses")
    public ResultGeneric<List<AssignNurse>> getAllNurses(@RequestParam(value = "nurseName", required = false) String nurseName) {
        return nurseInfoService.getAllNurses(nurseName);
    }
    @PostMapping("/update")
    public Result update(@RequestBody NurseInfo nurseInfo) {
        System.out.println("_______________________________"+nurseInfo+"______________________");
//        return Result.success();
        return nurseInfoService.updateInfo(nurseInfo);
    }

}
