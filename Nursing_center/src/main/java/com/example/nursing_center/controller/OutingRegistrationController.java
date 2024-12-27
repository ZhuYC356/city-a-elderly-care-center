package com.example.nursing_center.controller;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.pojo.OutingRegistration;
import com.example.nursing_center.service.IOutingRegistrationService;
import com.example.nursing_center.util.ExcelUtils;
import io.swagger.annotations.ApiOperation;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
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
     * 根据outingID数组返回对应数据
     */
    @GetMapping("/getByIds")
    public List<OutingRegistration> getByIds(@RequestParam List<Integer> outingIds) {
        return iOutingRegistrationService.listByIds(outingIds);
    }


    /*
     * 导出所有数据为Excel
     */
    @GetMapping("/export")
    @ApiOperation(value = "按对象导出（基础）", produces = "application/octet-stream")
    public void export(HttpServletResponse response) throws IOException {
        List<OutingRegistration> list = iOutingRegistrationService.list();
        ExcelUtils.export(response, "outings registration", list, OutingRegistration.class);
    }

    /*
     * 导出根据outingID数组对应数据为Excel
     */
    @GetMapping("/exportSelected")
    @ApiOperation(value = "按对象导出（基础）", produces = "application/octet-stream")
    public void exportSelected(HttpServletResponse response, @RequestParam List<Integer> outingIds) throws IOException {
        List<OutingRegistration> list = iOutingRegistrationService.listByIds(outingIds);
        ExcelUtils.export(response, "outings registration", list, OutingRegistration.class);
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
    @GetMapping("/delete")
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

    /**
     * 添加数据
     * @param info
     * @return
     */
    @PostMapping("/addInfo")
    public Result addInfo(@RequestBody Info info) {
        System.out.println(info);
        return iOutingRegistrationService.addInfo(info);
    }

}
