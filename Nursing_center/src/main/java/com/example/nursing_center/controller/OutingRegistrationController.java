package com.example.nursing_center.controller;


import com.example.nursing_center.mapper.OutingRegistrationMapper;
import com.example.nursing_center.pojo.OutingRegistration;
import com.example.nursing_center.service.IOutingRegistrationService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
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
     * 删除数据
     */
    @DeleteMapping("/delete")
    public boolean delete(@RequestParam Integer id) {
        return iOutingRegistrationService.removeById(id);
    }

    /*
     * 修改数据
     */
    @PostMapping("/update")
    public boolean update(@RequestBody OutingRegistration outingRegistration) {
        return iOutingRegistrationService.updateById(outingRegistration);
    }

    /*
     * 根据id查询数据
     */
    @GetMapping("/getById")
    public OutingRegistration getById(@RequestParam Integer id) {
        return iOutingRegistrationService.getById(id);
    }

    /*
     * 根据条件查询数据
     * 多表联查，可以根据老人姓名或老人床位号或入住日期查询
     */
    @GetMapping("/getByCondition")
    public List<OutingRegistration> getByCondition(@RequestParam(required = false) String name, @RequestParam(required = false) Integer bedNumber, @RequestParam(required = false) LocalDateTime checkInTime) {
        return iOutingRegistrationService.getByCondition(name, bedNumber, checkInTime);
    }


}
