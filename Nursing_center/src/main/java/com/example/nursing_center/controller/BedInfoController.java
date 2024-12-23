package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;

import com.example.nursing_center.common.SelectBedInfoResult;

import com.example.nursing_center.common.enums.BedStatusCount;
import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.controller.Result.ManagerElder;
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
     *
     * @param bedInfo bed_number,bed_type,bed_status,floor_number,room_number,floor
     * @return
     */
    @PostMapping("/add")
    public Result add(@RequestBody BedInfo bedInfo) {
        return bedInfoService.add(bedInfo);
    }

    @GetMapping("getAll")
    public Result getAll() {
        return bedInfoService.getAll();
    }

    @PostMapping("/select")
    public Result select(@RequestBody Form form) {
        System.out.println(form);
        return bedInfoService.select(form);
    }

    @PostMapping("/addBed")
    public Result addBed(@RequestBody BedInfo bedInfo) {
        System.out.println(bedInfo);
        return bedInfoService.addBed(bedInfo);
    }

    @PostMapping("/updateBed")
    public Result updateBed(@RequestBody ManagerElder managerElder) {
        System.out.println(managerElder);
        return Result.success(bedInfoService.updateBed(managerElder));
    }

    /**
     * 测试床位信息是否能返回
     * 方便后面对床位的 房间号、状态、床位号 进行查询
     *
     * @return 所有的床位信息
     */
    @GetMapping("/getAllBedInfo")
    public List<BedInfo> getAllBedInfo() {
        return bedInfoService.list();
    }

    /**
     * 通过“楼层”查询“房间号、床位号、床位状态”
     * 暂时是通过2楼查
     *
     * @return
     */
    @GetMapping("/selectBedInfoByFloor")
    public List<SelectBedInfoResult> selectBedInfoByFloor(Integer floor) {
        return bedInfoService.selectBedInfoByFloor(floor);
    }


    /**
     * 通过楼层查询对应的数据，然后统计床位状态的数量
     *
     * @param floor
     * @return
     */
    @GetMapping("/getBedStatusCount")
    public List<BedStatusCount> getBedStatusCount(Integer floor) {
        return bedInfoService.getBedStatusCount(floor);
    }
    /**
     * 查询所有楼层
     */
    @GetMapping("/getBedByAllFloor")
    public Result getBedByAllFloor(){
        return bedInfoService.getBedByAllFloor();
    }
    @GetMapping("/getAllRoomByFloorNumber/{floorNumber}")
    public Result getAllRoomByFloorNumber(@PathVariable("floorNumber") Integer floorNumber){
        return bedInfoService.getAllRoomByFloor(floorNumber);
    }

}
