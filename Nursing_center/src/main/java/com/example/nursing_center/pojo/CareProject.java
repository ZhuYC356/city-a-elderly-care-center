package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * <p>
 * 存储护理项目信息
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@TableName("care_project")
public class CareProject implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 护理项目唯一标识符
     */
    @TableId(value = "project_id", type = IdType.AUTO)
    private Integer projectId;

    /**
     * 护理项目名称
     */
    private String projectName;

    /**
     * 护理项目描述
     */
    private String description;

    /**
     * 服务时长
     */
//    @JsonFormat(timezone="GMT+8", pattern = "HH:mm:ss")
    private LocalTime serviceDuration;

    /**
     * 服务价格
     */
    private BigDecimal price;

    /**
     * 服务频率（如D表示每天，W表示每周，M表示每月等）
     */
    private String frequency;

    /**
     * 护理等级 1 最高级 ，2 高级，3 中级，4 低级
     */
    private Integer nurseLevel;

    /**
     * 是否有效（1表示有效，0表示无效）
     */
    private Boolean isActive;

    /**
     * 记录创建时间
     */
    private LocalDateTime createdAt;

    /**
     * 记录更新时间
     */
    private LocalDateTime updatedAt;

    /**
     * 状态,用于删除,1 可用，0 不可用
     */
    private String status;

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
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
    public LocalTime getServiceDuration() {
        return serviceDuration;
    }

    public void setServiceDuration(LocalTime serviceDuration) {
        this.serviceDuration = serviceDuration;
    }
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }
    public Integer getNurseLevel() {
        return nurseLevel;
    }

    public void setNurseLevel(Integer nurseLevel) {
        this.nurseLevel = nurseLevel;
    }
    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CareProject{" +
            "projectId=" + projectId +
            ", projectName=" + projectName +
            ", description=" + description +
            ", serviceDuration=" + serviceDuration +
            ", price=" + price +
            ", frequency=" + frequency +
            ", nurseLevel=" + nurseLevel +
            ", isActive=" + isActive +
            ", createdAt=" + createdAt +
            ", updatedAt=" + updatedAt +
            ", status=" + status +
        "}";
    }
}
