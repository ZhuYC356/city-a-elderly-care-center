package com.example.nursing_center.controller.Result;

import com.example.nursing_center.pojo.ElderlyInfo;

import java.util.List;

/**
 * @Author: 竹永灿 224804356
 * @Description: 设置服务对象的返回对象，查询护工信息
 * @version: 1.0
 * @DateTime: 2024/12/27 10:08
 **/
public class AssignNurse {
    private int nurseId;               // 护工id
    private String nurseName;          // 护工姓名
    private String gender;             // 护工性别（M/F）
    private int age;                   // 护工年龄
    private String contactInfo;        // 护工联系方式
    private String workExperience;     // 护工工作经验
    private int nurseLevel;            // 护工护理等级
    private String serviceEvaluation;  // 护工服务评价
    private List<ElderlyInfo> elderlyList; // 当前管家的服务客户列表

    public int getNurseId() {
        return nurseId;
    }

    public void setNurseId(int nurseId) {
        this.nurseId = nurseId;
    }

    public String getNurseName() {
        return nurseName;
    }

    public void setNurseName(String nurseName) {
        this.nurseName = nurseName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(String workExperience) {
        this.workExperience = workExperience;
    }

    public int getNurseLevel() {
        return nurseLevel;
    }

    public void setNurseLevel(int nurseLevel) {
        this.nurseLevel = nurseLevel;
    }

    public String getServiceEvaluation() {
        return serviceEvaluation;
    }

    public void setServiceEvaluation(String serviceEvaluation) {
        this.serviceEvaluation = serviceEvaluation;
    }

    public List<ElderlyInfo> getElderlyList() {
        return elderlyList;
    }

    public void setElderlyList(List<ElderlyInfo> elderlyList) {
        this.elderlyList = elderlyList;
    }
}
