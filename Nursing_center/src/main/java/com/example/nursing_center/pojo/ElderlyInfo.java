package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 存储老人详细信息
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@TableName("elderly_info")
public class ElderlyInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 老人唯一标识符
     */
    @TableId(value = "elderly_id", type = IdType.AUTO)
    private Integer elderlyId;

    /**
     * 老人姓名
     */
    private String name;

    /**
     * 老人性别（M/F）
     */
    private String gender;

    /**
     * 老人年龄
     */
    private Integer age;

    /**
     * 老人身份证号
     */
    private String idNumber;

    /**
     * 自理能力等级，1 不自理，2 部分自理，3 自行disabled
     */
    private Integer selfCareStatus;

    /**
     * 老人家庭住址
     */
    private String homeAddress;

    /**
     * 老人联系方式
     */
    private String contactInfo;

    /**
     * 家属联系方式
     */
    private String familyContactInfo;

    /**
     * 老人照片
     */
    private String photo;

    /**
     * 病史记录
     */
    private String medicalHistory;

    /**
     * 过敏史记录
     */
    private String allergyHistory;

    /**
     * 身体状况描述
     */
    private String physicalCondition;

    /**
     * 关联床位信息表的外键
     */
    private Integer bedId;

    /**
     * 关联护工信息表的外键
     */
    private Integer nurseId;

    /**
     * 入住时间
     */
    private LocalDateTime checkInTime;

    /**
     * 离开时间
     */
    private LocalDateTime checkOutTime;

    /**
     * 护理等级 1 最高级 ，2 高级，3 中级，4 低级
     */
    private Integer nurseLevel;

    /**
     * 入住状态,用于删除,1 已入住，0 已离开
     */
    private String status;

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
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }
    public Integer getSelfCareStatus() {
        return selfCareStatus;
    }

    public void setSelfCareStatus(Integer selfCareStatus) {
        this.selfCareStatus = selfCareStatus;
    }
    public String getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }
    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }
    public String getFamilyContactInfo() {
        return familyContactInfo;
    }

    public void setFamilyContactInfo(String familyContactInfo) {
        this.familyContactInfo = familyContactInfo;
    }
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    public String getMedicalHistory() {
        return medicalHistory;
    }

    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }
    public String getAllergyHistory() {
        return allergyHistory;
    }

    public void setAllergyHistory(String allergyHistory) {
        this.allergyHistory = allergyHistory;
    }
    public String getPhysicalCondition() {
        return physicalCondition;
    }

    public void setPhysicalCondition(String physicalCondition) {
        this.physicalCondition = physicalCondition;
    }
    public Integer getBedId() {
        return bedId;
    }

    public void setBedId(Integer bedId) {
        this.bedId = bedId;
    }
    public Integer getNurseId() {
        return nurseId;
    }

    public void setNurseId(Integer nurseId) {
        this.nurseId = nurseId;
    }
    public LocalDateTime getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(LocalDateTime checkInTime) {
        this.checkInTime = checkInTime;
    }
    public LocalDateTime getCheckOutTime() {
        return checkOutTime;
    }

    public void setCheckOutTime(LocalDateTime checkOutTime) {
        this.checkOutTime = checkOutTime;
    }
    public Integer getNurseLevel() {
        return nurseLevel;
    }

    public void setNurseLevel(Integer nurseLevel) {
        this.nurseLevel = nurseLevel;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ElderlyInfo{" +
            "elderlyId=" + elderlyId +
            ", name=" + name +
            ", gender=" + gender +
            ", age=" + age +
            ", idNumber=" + idNumber +
            ", selfCareStatus=" + selfCareStatus +
            ", homeAddress=" + homeAddress +
            ", contactInfo=" + contactInfo +
            ", familyContactInfo=" + familyContactInfo +
            ", photo=" + photo +
            ", medicalHistory=" + medicalHistory +
            ", allergyHistory=" + allergyHistory +
            ", physicalCondition=" + physicalCondition +
            ", bedId=" + bedId +
            ", nurseId=" + nurseId +
            ", checkInTime=" + checkInTime +
            ", checkOutTime=" + checkOutTime +
            ", nurseLevel=" + nurseLevel +
            ", status=" + status +
        "}";
    }
}
