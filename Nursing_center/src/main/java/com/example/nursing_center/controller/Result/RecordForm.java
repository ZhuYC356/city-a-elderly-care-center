package com.example.nursing_center.controller.Result;

import lombok.Data;

/**
 * 护理记录表单字段
 * @version 1.0
 * @Author: 张璇
 * @DateTime: 2024/12/27 11:14
 **/
@Data
public class RecordForm {
    Integer elderlyId;
    String name;
    String idNumber;
    String projectName;
    Integer nurseLevel;

    public Integer getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(Integer elderlyId) {
        this.elderlyId = elderlyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Integer getNurseLevel() {
        return nurseLevel;
    }

    public void setNurseLevel(Integer nurseLevel) {
        this.nurseLevel = nurseLevel;
    }

    public String getNurseName() {
        return nurseName;
    }

    public void setNurseName(String nurseName) {
        this.nurseName = nurseName;
    }

    public String getCareStatus() {
        return careStatus;
    }

    public void setCareStatus(String careStatus) {
        this.careStatus = careStatus;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    String nurseName;
    String careStatus;
    String description;
    Integer projectId;


}
