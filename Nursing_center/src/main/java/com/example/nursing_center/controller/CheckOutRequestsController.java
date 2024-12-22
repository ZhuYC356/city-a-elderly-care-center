package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Back;
import com.example.nursing_center.controller.Result.BackForm;
import com.example.nursing_center.service.ICheckOutRequestsService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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
     * 添加
     *
     * @param backForm
     * @return
     */
    @PostMapping("/add")
    public Result add(@RequestBody BackForm backForm){
        return checkOutRequestsService.add(backForm);
    }

    /**
     * 查询
     * @param back
     * @return*/

    @PostMapping ("/select")
    public Result select(@RequestBody Back back){
        return checkOutRequestsService.select(back);

    }

    // 同意审批接口
    @PostMapping("/agree")
    public Map<String, Object> agreeApproval(@RequestBody BackForm backForm) {
        try {
            // 业务层处理审批逻辑
            checkOutRequestsService.approveCheckOutRequest(backForm);
            return Map.of("status", "success", "message", "审批通过");
        } catch (Exception e) {
            return Map.of("status", "error", "message", "审批失败: " + e.getMessage());
        }
    }

    // 撤销审批接口
    @PostMapping("/revoke")
    public Map<String, Object> revokeApproval(@RequestBody BackForm backForm) {
        try {
            // 业务层处理撤销逻辑
            checkOutRequestsService.revokeCheckOutRequest(backForm);
            return Map.of("status", "success", "message", "审批已撤销");
        } catch (Exception e) {
            return Map.of("status", "error", "message", "撤销失败: " + e.getMessage());
        }
    }



}
