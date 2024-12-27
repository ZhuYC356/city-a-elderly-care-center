package com.example.nursing_center.controller.Result;

/**
 * @Author: 竹永灿 224804356
 * @Description: 设置服务对象的返回对象，查询老人信息
 * @version: 1.0
 * @DateTime: 2024/12/27 10:06
 **/
public class AssignElderly {
    private int elderlyId;             // 老人id
    private String elderlyName;        // 老人姓名
    private int age;                   // 老人年龄
    private String gender;             // 老人性别（M/F）
    private String contactInfo;        // 老人联系方式
    private String medicalHistory;     // 老人病史记录
    private int nurseId;               // 关联护工id
    private String nurseName;          // 关联护工姓名
    private int nurseLevel;            // 护工护理等级
    private String checkInTime;        // 入住时间
    private String checkOutTime;       // 离开时间
    private String physicalCondition;  // 老人身体状况描述

    public AssignElderly() {
    }

    public AssignElderly(int elderlyId, String elderlyName, int age, String gender, String contactInfo, String medicalHistory, int nurseId, String nurseName, int nurseLevel, String checkInTime, String checkOutTime, String physicalCondition) {
        this.elderlyId = elderlyId;
        this.elderlyName = elderlyName;
        this.age = age;
        this.gender = gender;
        this.contactInfo = contactInfo;
        this.medicalHistory = medicalHistory;
        this.nurseId = nurseId;
        this.nurseName = nurseName;
        this.nurseLevel = nurseLevel;
        this.checkInTime = checkInTime;
        this.checkOutTime = checkOutTime;
        this.physicalCondition = physicalCondition;
    }

    public int getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(int elderlyId) {
        this.elderlyId = elderlyId;
    }

    public String getElderlyName() {
        return elderlyName;
    }

    public void setElderlyName(String elderlyName) {
        this.elderlyName = elderlyName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getMedicalHistory() {
        return medicalHistory;
    }

    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }

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

    public int getNurseLevel() {
        return nurseLevel;
    }

    public void setNurseLevel(int nurseLevel) {
        this.nurseLevel = nurseLevel;
    }

    public String getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(String checkInTime) {
        this.checkInTime = checkInTime;
    }

    public String getCheckOutTime() {
        return checkOutTime;
    }

    public void setCheckOutTime(String checkOutTime) {
        this.checkOutTime = checkOutTime;
    }

    public String getPhysicalCondition() {
        return physicalCondition;
    }

    public void setPhysicalCondition(String physicalCondition) {
        this.physicalCondition = physicalCondition;
    }
}
