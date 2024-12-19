package com.example.nursing_center.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.BedElderlyAssociation;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;


/**
 * <p>
 * 存储疗养院床位与老人之间的关联信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/bed-elderly-association")
public class BedElderlyAssociationController {
    @Resource
    private com.example.nursing_center.service.IBedElderlyAssociationService bedElderlyAssociationService;

    /**
     * 添加
     * @param bedElderlyAssociation bed_id,elderly_id,check_in_date,bed_status,check_in_date,remarks
     * @return
     */
    @PostMapping("/add")
    public Result add(@RequestBody BedElderlyAssociation bedElderlyAssociation)
    {
        return bedElderlyAssociationService.add(bedElderlyAssociation);
    }

    /**
     * 根据ID修改
     * @param bedElderlyAssociation
     * @return
     */
    @PostMapping("/edit")
    public Result edit(@RequestBody BedElderlyAssociation bedElderlyAssociation)
    {
        return bedElderlyAssociationService.edit(bedElderlyAssociation);
    }

    /**
     * 根据ID查询
     * @param id
     * @return
     */
    @GetMapping("/selectById")
    public Result selectById(@RequestParam Integer id)
    {
        return Result.success(bedElderlyAssociationService.getById(id));
    }
    @PostMapping("/selectByName")
    public Result selectByName(@RequestBody BedElderlyAssociation bedElderlyAssociation)
    {
        return Result.success(bedElderlyAssociationService.selectByName(bedElderlyAssociation));
    }
}
