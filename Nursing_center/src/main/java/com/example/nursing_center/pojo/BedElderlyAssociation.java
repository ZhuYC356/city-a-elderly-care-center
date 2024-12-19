package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * <p>
 * 存储疗养院床位与老人之间的关联信息
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@TableName("bed_elderly_association")
public class BedElderlyAssociation implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 关联记录的唯一标识符
     */
    @TableId(value = "association_id", type = IdType.AUTO)
    private Integer associationId;

    /**
     * 与该关联记录关联的床位ID，外键关联到床位表
     */
    private Integer bedId;

    /**
     * 与该关联记录关联的老人ID，外键关联到老人表
     */
    private Integer elderlyId;

    /**
     * 老人入住床位的日期
     */
    private LocalDate checkInDate;

    /**
     * 指示老人当前是否在床位上 0 在床 1 离床
     */
    private Integer bedStatus;

    /**
     * 如果老人离床，记录其离床的开始时间
     */
    private LocalDateTime leaveBedStartTime;

    /**
     * 如果老人返回床位，记录其返回的时间
     */
    private LocalDateTime leaveBedEndTime;

    /**
     * 关于床位与老人关联的额外信息或备注
     */
    private String remarks;

    /**
     * 记录被添加到表中的时间
     */
    private LocalDateTime createdAt;

    /**
     * 记录最后一次被修改的时间
     */
    private LocalDateTime updatedAt;

    public Integer getAssociationId() {
        return associationId;
    }

    public void setAssociationId(Integer associationId) {
        this.associationId = associationId;
    }
    public Integer getBedId() {
        return bedId;
    }

    public void setBedId(Integer bedId) {
        this.bedId = bedId;
    }
    public Integer getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(Integer elderlyId) {
        this.elderlyId = elderlyId;
    }
    public LocalDate getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(LocalDate checkInDate) {
        this.checkInDate = checkInDate;
    }
    public Integer getBedStatus() {
        return bedStatus;
    }

    public void setBedStatus(Integer bedStatus) {
        this.bedStatus = bedStatus;
    }
    public LocalDateTime getLeaveBedStartTime() {
        return leaveBedStartTime;
    }

    public void setLeaveBedStartTime(LocalDateTime leaveBedStartTime) {
        this.leaveBedStartTime = leaveBedStartTime;
    }
    public LocalDateTime getLeaveBedEndTime() {
        return leaveBedEndTime;
    }

    public void setLeaveBedEndTime(LocalDateTime leaveBedEndTime) {
        this.leaveBedEndTime = leaveBedEndTime;
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

    @Override
    public String toString() {
        return "BedElderlyAssociation{" +
            "associationId=" + associationId +
            ", bedId=" + bedId +
            ", elderlyId=" + elderlyId +
            ", checkInDate=" + checkInDate +
            ", bedStatus=" + bedStatus +
            ", leaveBedStartTime=" + leaveBedStartTime +
            ", leaveBedEndTime=" + leaveBedEndTime +
            ", remarks=" + remarks +
            ", createdAt=" + createdAt +
            ", updatedAt=" + updatedAt +
        "}";
    }
}
