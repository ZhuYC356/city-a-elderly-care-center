package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;

import com.example.nursing_center.common.SelectBedInfoResult;
import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.pojo.BedInfo;
import com.example.nursing_center.service.IBedInfoService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    /**
     * 测试床位信息是否能返回
     * 方便后面对床位的 房间号、状态、床位号 进行查询
     * @return 所有的床位信息
     */
    @GetMapping("/getAllBedInfo")
    public List<BedInfo> getAllBedInfo(){
        return bedInfoService.list();
    }

    /**
     * 通过“楼层”查询“房间号、床位号、床位状态”
     * 暂时是通过2楼查
     * @return
     */
    @GetMapping("/selectBedInfoByFloor")
    public List<SelectBedInfoResult> selectBedInfoByFloor(){
        return bedInfoService.selectBedInfoByFloor();
    }



}
