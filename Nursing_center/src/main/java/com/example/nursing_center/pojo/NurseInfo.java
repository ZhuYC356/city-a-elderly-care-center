package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

/**
 * <p>
 * 存储护工基本信息
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@TableName("nurse_info")
public class NurseInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 护工唯一标识符
     */
    @TableId(value = "nurse_id", type = IdType.AUTO)
    private Integer nurseId;

    /**
     * 护工姓名
     */
    private String name;

    /**
     * 护工性别（M/F）
     */
    private String gender;

    /**
     * 护工年龄
     */
    private Integer age;
    /**
     * 护工身份证号
     */
    private String idNumber;
    /**
     * 护工联系方式
     */
    private String contactInfo;

    /**
     * 护工照片
     */
    private String photo;

    /**
     * 工作经验描述
     */
    private String workExperience;

    /**
     * 专业证书
     */
    private String professionalCertificate;

    /**
     * 护理等级 1 最高级 ，2 高级，3 中级，4 低级
     */
    private Integer nurseLevel;

    /**
     * 服务评价
     */
    private String serviceEvaluation;

    /**
     * 状态,用于删除,1 可用，0 不可用
     */
    private String status;

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public Integer getNurseId() {
        return nurseId;
    }

    public void setNurseId(Integer nurseId) {
        this.nurseId = nurseId;
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
    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    public String getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(String workExperience) {
        this.workExperience = workExperience;
    }
    public String getProfessionalCertificate() {
        return professionalCertificate;
    }

    public void setProfessionalCertificate(String professionalCertificate) {
        this.professionalCertificate = professionalCertificate;
    }
    public Integer getNurseLevel() {
        return nurseLevel;
    }

    public void setNurseLevel(Integer nurseLevel) {
        this.nurseLevel = nurseLevel;
    }
    public String getServiceEvaluation() {
        return serviceEvaluation;
    }

    public void setServiceEvaluation(String serviceEvaluation) {
        this.serviceEvaluation = serviceEvaluation;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "NurseInfo{" +
                "nurseId=" + nurseId +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                ", idNumber='" + idNumber + '\'' +
                ", contactInfo='" + contactInfo + '\'' +
                ", photo='" + photo + '\'' +
                ", workExperience='" + workExperience + '\'' +
                ", professionalCertificate='" + professionalCertificate + '\'' +
                ", nurseLevel=" + nurseLevel +
                ", serviceEvaluation='" + serviceEvaluation + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
