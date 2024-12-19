package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * <p>
 * 存储老人与护理项目的关联信息
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@TableName("elderly_care_project")
public class ElderlyCareProject implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 关联唯一标识符
     */
    @TableId(value = "association_id", type = IdType.AUTO)
    private Integer associationId;

    /**
     * 老人唯一标识符，外键指向elderly表
     */
    private Integer elderlyId;

    /**
     * 护理项目唯一标识符，外键指向care_project表
     */
    private Integer projectId;

    /**
     * 开始日期
     */
    private LocalDate startDate;

    /**
     * 结束日期（如果项目仍在进行中，则为NULL）
     */
    private LocalDate endDate;

    /**
     * 备注
     */
    private String remarks;

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

    public Integer getAssociationId() {
        return associationId;
    }

    public void setAssociationId(Integer associationId) {
        this.associationId = associationId;
    }
    public Integer getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(Integer elderlyId) {
        this.elderlyId = elderlyId;
    }
    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }
    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }
    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
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
        return "ElderlyCareProject{" +
            "associationId=" + associationId +
            ", elderlyId=" + elderlyId +
            ", projectId=" + projectId +
            ", startDate=" + startDate +
            ", endDate=" + endDate +
            ", remarks=" + remarks +
            ", createdAt=" + createdAt +
            ", updatedAt=" + updatedAt +
            ", status=" + status +
        "}";
    }
}
