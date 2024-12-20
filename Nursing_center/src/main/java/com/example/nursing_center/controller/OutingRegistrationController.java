package com.example.nursing_center.controller;


import com.example.nursing_center.mapper.OutingRegistrationMapper;
import com.example.nursing_center.pojo.OutingRegistration;
import com.example.nursing_center.service.IOutingRegistrationService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 存储老人外出登记信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/outing-registration")
@CrossOrigin(origins = "http://localhost:8080/out_office_registration")
public class OutingRegistrationController {
    @Resource
    private IOutingRegistrationService iOutingRegistrationService;

    /*
     * 获取所有数据
     */
    @GetMapping("/getAll")
    public List<OutingRegistration> getAll() {
        return iOutingRegistrationService.list();
    }
    /*
     * 添加数据
     */

    @PostMapping("/add")
    public boolean add(@RequestBody OutingRegistration outingRegistration) {
        return iOutingRegistrationService.save(outingRegistration);
    }
    /*
     * 修改数据
     */
    @PostMapping("/update")
    public boolean update(@RequestBody OutingRegistration outingRegistration) {
        return iOutingRegistrationService.updateById(outingRegistration);
    }


}
