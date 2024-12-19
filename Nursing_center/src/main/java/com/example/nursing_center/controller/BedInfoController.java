package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.BedInfo;
import com.example.nursing_center.service.IBedInfoService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
