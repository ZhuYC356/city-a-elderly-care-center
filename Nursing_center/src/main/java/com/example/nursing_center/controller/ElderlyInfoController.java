package com.example.nursing_center.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.common.ResultGeneric;
import com.example.nursing_center.controller.Result.AssignElderly;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.pojo.ElderlyInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Result getAll() {
        return elderlyInfoService.getAll();
    }

    @PostMapping("/add")
    public Result add(@RequestBody Info info) {
        System.out.println(info + "121222222222222222222222222222222222222");
        return elderlyInfoService.add(info);
    }

    @GetMapping("/getById/{id}")
    public Result getById(@PathVariable Integer id) {
        System.out.println("++++++++++++++++++++++++++++" + id + "__________________________");
        return elderlyInfoService.getAllById(id);
    }

    @PostMapping("/selectByFrom")
    public Result selectByFrom(@RequestBody ElderlyInfo elderlyInfo) {
        return elderlyInfoService.selectByFrom(elderlyInfo);
    }

    @PostMapping("/updateById")
    public Result updateById(@RequestBody Info info) {
        System.out.println(info);
        return elderlyInfoService.updateAllById(info);
    }

    @GetMapping("/getElderlyInfoByRoomAndBed/{floorNumber}/{roomNumber}/{bedNumber}")
    public Result getElderlyInfoByRoomAndBed(@PathVariable Integer floorNumber, @PathVariable String roomNumber, @PathVariable String bedNumber) {
        System.out.println("________________" + roomNumber + "_______________");
        return elderlyInfoService.getElderlyInfoByRoomAndBed(roomNumber, bedNumber, floorNumber);
    }

    @GetMapping("/getElderlyInfoByIdNumber/{idNumber}")
    public Result getElderlyInfoByIdNumber(@PathVariable String idNumber) {
        return elderlyInfoService.getElderlyInfoByIdNumber(idNumber);
    }

    /**
     * 返回所有老人信息
     * @return
     */
    @GetMapping("/getAllElderlyInfo")
    public List<ElderlyInfo> getAllElderlyInfo() {
        return elderlyInfoService.list();
    }

    @GetMapping("/getAllElderly")
    public ResultGeneric<List<AssignElderly>> getAllElderly() {
        return elderlyInfoService.getAllElderly();
    }

    @GetMapping("/getElderlyWithoutNurse")
    public ResultGeneric<List<AssignElderly>> getElderlyWithoutNurse(@RequestParam(value = "elderlyName", required = false) String elderlyName) {
        return elderlyInfoService.getElderlyWithoutNurse(elderlyName);
    }

    /**
     * 统计 nurseId 为空和不为空的个数
     */
    @GetMapping("/countNurseId")
    public Map<String, Integer> countNurseId() {
        // 统计 nurseId 为空的个数
        int countNurseIdIsNull = (int) elderlyInfoService.count(new QueryWrapper<ElderlyInfo>().isNull("nurse_id"));

        // 统计总数
        int totalCount = (int) elderlyInfoService.count();

        // nurseId 不为空的个数 = 总数 - nurseId 为空的个数
        int countNurseIdIsNotNull = totalCount - countNurseIdIsNull;

        // 返回统计结果
        Map<String, Integer> result = new HashMap<>();
        result.put("nurseIdIsNull", countNurseIdIsNull);
        result.put("nurseIdIsNotNull", countNurseIdIsNotNull);

        return result;
    }

    /**
     * 批量更新 nurse_id 字段
     *
     * @param updateIds key: 老人 id, value: 对应的护士 id
     * @return 更新结果
     */
    @PostMapping("/updateNurseIds")
    public Map<String, Object> updateNurseIds(@RequestBody Map<Integer, Integer> updateIds) {
        int successCount = 0;
        int failureCount = 0;

        for (Map.Entry<Integer, Integer> entry : updateIds.entrySet()) {
            Integer elderlyId = entry.getKey();
            Integer nurseId = entry.getValue();

            try {
                UpdateWrapper<ElderlyInfo> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq("elderly_id", elderlyId);  // 根据 elderlyId 更新

                // 如果 nurseId 为 null，则清空 nurseId
                if (nurseId == null) {
                    updateWrapper.set("nurse_id", null);
                } else {
                    updateWrapper.set("nurse_id", nurseId);
                }

                boolean isUpdated = elderlyInfoService.update(updateWrapper);
                if (isUpdated) {
                    successCount++;
                } else {
                    failureCount++;
                }

            } catch (Exception e) {
                failureCount++;
            }
        }

        Map<String, Object> result = new HashMap<>();
        result.put("successCount", successCount);
        result.put("failureCount", failureCount);
        result.put("total", updateIds.size());
        return result;
    }
    /**
     * 分页查询
     */
    @GetMapping("/page")
    public List<ElderlyInfo> page(@RequestParam Integer pageNum,
                       @RequestParam Integer pageSize,
                       @RequestParam(defaultValue = "") String name,
                       @RequestParam(defaultValue = "false")boolean nurseIsNull) {
        // 创建查询条件
        QueryWrapper<ElderlyInfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name", name);
        if (nurseIsNull) {
            queryWrapper.isNull("nurse_id");
        }
        queryWrapper.eq("status", 1);

        // 执行分页查询
        Page<ElderlyInfo> page = elderlyInfoService.page(new Page<>(pageNum, pageSize), queryWrapper);

        return page.getRecords();
    }
}

