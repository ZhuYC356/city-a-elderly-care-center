package com.example.nursing_center.mapper;

import com.example.nursing_center.controller.Result.Form;
import com.example.nursing_center.pojo.CareProject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 存储护理项目信息 Mapper 接口
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public interface CareProjectMapper extends BaseMapper<CareProject> {

    int addProject(CareProject careProject);

    List<CareProject> getData();

    List<CareProject> myListPage(Form form);

    List<CareProject> select(Form form);

    int changeActive(int active, Integer projectId);

    int deleteProject(int projectId);

    int updateProject(CareProject careProject);

    int getLength();

    List<CareProject> getProjectName();
}
