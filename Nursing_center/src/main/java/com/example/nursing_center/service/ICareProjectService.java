package com.example.nursing_center.service;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.pojo.CareProject;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 存储护理项目信息 服务类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface ICareProjectService extends IService<CareProject> {

    Result getData();

    Result myListPage(Form form);

    Result select(Form form);

    Result changeActive(Boolean isActive, Integer projectId);

    Result addProject(CareProject careProject);

    Result deleteProject(int projectId);

    Result updateProject(CareProject careProject);

    Result getLength();

    List<CareProject> getProjectName();
}
