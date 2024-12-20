package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.request.Info;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 存储老人详细信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/elderly-info")
public class ElderlyInfoController {
    @Resource
    private com.example.nursing_center.service.IElderlyInfoService elderlyInfoService;
    @GetMapping("/getAll")
    public Result getAll(){
        return elderlyInfoService.getAll();
    }
    @PostMapping("/add")
    public Result add(@RequestBody Info info){
        System.out.println(info);
        return elderlyInfoService.add(info);
    }
    @GetMapping("/getById/{id}")
    public Result getById(@PathVariable Integer id){
        return Result.success(elderlyInfoService.getById(id));
    }
}
