package com.example.nursing_center.controller.Result;

import java.util.List;
import java.util.Objects;

/**
 * @author 王谨琦
 * @date 2024年12月28日 11:39
 */
public class ServiceConcern {

    /**
     * 老人的名字
     */
    private String name;

    /**
     * 老人的性别
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
     * 护工的名字
     */
    private String nurseName;

    /**
     * 当前老人的护理项目列表
     */
    private List<CareProjectForElderly> careProjectForElderlyList;

    @Override
    public String toString() {
        return "ServiceConcern{" +
                "name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                ", idNumber='" + idNumber + '\'' +
                ", nurseName='" + nurseName + '\'' +
                ", careProjectForElderlyList=" + careProjectForElderlyList +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ServiceConcern that = (ServiceConcern) o;
        return Objects.equals(name, that.name) && Objects.equals(gender, that.gender) && Objects.equals(age, that.age) && Objects.equals(idNumber, that.idNumber) && Objects.equals(nurseName, that.nurseName) && Objects.equals(careProjectForElderlyList, that.careProjectForElderlyList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, gender, age, idNumber, nurseName, careProjectForElderlyList);
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

    public String getNurseName() {
        return nurseName;
    }

    public void setNurseName(String nurseName) {
        this.nurseName = nurseName;
    }

    public List<CareProjectForElderly> getCareProjectForElderlyList() {
        return careProjectForElderlyList;
    }

    public void setCareProjectForElderlyList(List<CareProjectForElderly> careProjectForElderlyList) {
        this.careProjectForElderlyList = careProjectForElderlyList;
    }
}
