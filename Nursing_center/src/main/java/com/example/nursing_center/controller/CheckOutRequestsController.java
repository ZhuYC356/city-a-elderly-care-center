package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Back;
import com.example.nursing_center.controller.Result.BackForm;
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
     * 获取所有表单数据
     * @return
     */
    @GetMapping("/gainAll")
    public List<BackForm> gainAll(){
        return checkOutRequestsService.gainAll();
    }

    /**
     * 同意审批
     * @param approvalData 审批数据
     * @return 处理结果
     */
    @PostMapping("/agree")
    public Result agree(@RequestBody BackForm approvalData) {
        return checkOutRequestsService.agree(approvalData);
    }

    /**
     * 撤销审批
     * @param approvalData 审批数据
     * @return 处理结果
     */
    @PostMapping("/revoke")
    public Result revoke(@RequestBody BackForm approvalData) {
        return checkOutRequestsService.revoke(approvalData);
    }

    /**
     * 根据条件模糊查询
     * @param form 查询条件
     * @return 符合条件的请求列表
     */
    @PostMapping("/select")
    public List<BackForm> select(@RequestBody Back form) {
        return checkOutRequestsService.select(form);
    }


}
