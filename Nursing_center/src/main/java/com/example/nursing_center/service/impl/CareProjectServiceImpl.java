package com.example.nursing_center.service.impl;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.pojo.CareProject;
import com.example.nursing_center.mapper.CareProjectMapper;
import com.example.nursing_center.service.ICareProjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 存储护理项目信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class CareProjectServiceImpl extends ServiceImpl<CareProjectMapper, CareProject> implements ICareProjectService {
    @Resource
    private CareProjectMapper careProjectMapper;

    @Override
    public Result getData() {
        return Result.success(careProjectMapper.getData());
    }

    @Override
    public Result myListPage(Form form) {
        form.setPageNum((form.getPageNum() - 1) * form.getPageSize());
        return Result.success(careProjectMapper.myListPage(form));
    }

    @Override
    public Result select(Form form) {
        form.setPageNum((form.getPageNum() - 1) * form.getPageSize());
        return Result.success(careProjectMapper.select(form));
    }
    int active=0;
    @Override
    public Result changeActive(Boolean isActive, Integer projectId) {
        if(isActive){
            active=1;
        }
        else{
            active=0;
        }
        System.out.println(active);
        return Result.success(careProjectMapper.changeActive(active,projectId));
    }

    @Override
    public Result addProject(CareProject careProject) {
        return Result.success(careProjectMapper.addProject(careProject));
    }


    @Override
    public Result deleteProject(int projectId) {
        return Result.success(careProjectMapper.deleteProject(projectId));
    }

    @Override
    public Result updateProject(CareProject careProject) {
        return Result.success(careProjectMapper.updateProject(careProject));
    }
}
