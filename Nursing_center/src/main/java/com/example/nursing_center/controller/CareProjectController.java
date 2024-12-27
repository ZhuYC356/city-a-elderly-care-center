package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.pojo.CareProject;
import com.example.nursing_center.service.impl.CareProjectServiceImpl;
import jakarta.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 存储护理项目信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/care-project")
public class CareProjectController {
    @Resource
    private CareProjectServiceImpl careProjectService;

    @GetMapping("/getData")
    public Result getData() {
        return careProjectService.getData();
    }

    @PostMapping("/myListPage")
    public Result myListPage(@RequestBody Form form) {
        return careProjectService.myListPage(form);
    }

    @PostMapping("/select")
    public Result select(@RequestBody Form form) {
        System.out.println(form);
        return careProjectService.select(form);
    }

    @GetMapping("/changeActive/{isActive}/{projectId}")
    public Result changeActive(@PathVariable("isActive") Boolean isActive, @PathVariable("projectId") Integer projectId) {
        System.out.println(isActive);
        System.out.println(projectId);
        return careProjectService.changeActive(isActive, projectId);
    }

    @PostMapping("/addProject")
    public Result addProject(@RequestBody CareProject careProject) {
        System.out.println(careProject);
        return Result.success();
    }

}
