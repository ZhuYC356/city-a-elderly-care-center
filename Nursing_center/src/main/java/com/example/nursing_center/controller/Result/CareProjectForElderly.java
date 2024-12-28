package com.example.nursing_center.controller.Result;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.Objects;

/**
 * @author 王谨琦
 * @date 2024年12月28日 11:44
 */
public class CareProjectForElderly {

    /**
     * 护理项目的名称
     */
    private String projectName;

    /**
     * 护理项目的描述
     */
    private String description;

    /**
     * 护理项目的服务状态（1:到期，0: 欠费，2:数量正常，3: 未到期）
     */
    private String careStatus;

    /**
     *护理项目的到期时间
     */
    private LocalTime careEndTime;

    /**
     * 护理项目的价格
     */
    private BigDecimal price;

    @Override
    public String toString() {
        return "CareProjectForElderly{" +
                "projectName='" + projectName + '\'' +
                ", description='" + description + '\'' +
                ", careStatus='" + careStatus + '\'' +
                ", careEndTime=" + careEndTime +
                ", price=" + price +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CareProjectForElderly that = (CareProjectForElderly) o;
        return Objects.equals(projectName, that.projectName) && Objects.equals(description, that.description) && Objects.equals(careStatus, that.careStatus) && Objects.equals(careEndTime, that.careEndTime) && Objects.equals(price, that.price);
    }

    @Override
    public int hashCode() {
        return Objects.hash(projectName, description, careStatus, careEndTime, price);
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCareStatus() {
        return careStatus;
    }

    public void setCareStatus(String careStatus) {
        this.careStatus = careStatus;
    }

    public LocalTime getCareEndTime() {
        return careEndTime;
    }

    public void setCareEndTime(LocalTime careEndTime) {
        this.careEndTime = careEndTime;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
