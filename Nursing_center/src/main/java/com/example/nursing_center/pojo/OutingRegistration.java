package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * <p>
 * 存储老人外出登记信息
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@TableName("outing_registration")
public class OutingRegistration implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 外出记录的唯一标识符
     */
    @TableId(value = "outing_id", type = IdType.AUTO)
    private Integer outingId;

    /**
     * 外出老人的唯一标识符，外键关联到老人表
     */
    private Integer elderlyId;

    /**
     * 外出的日期
     */
    private LocalDate outingDate;

    /**
     * 外出的具体时间
     */
    private LocalTime outingTime;

    /**
     * 外出的目的地描述
     */
    private String destination;

    /**
     * 外出的目的或活动描述
     */
    private String purpose;

    /**
     * 陪同老人的人员姓名或身份描述
     */
    private String accompanyingPerson;

    /**
     * 外出时可用于联系的电话号码
     */
    private String contactInfo;

    /**
     * 其他需要记录的备注信息
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

    /**
     * 审核状态，默认为0（未审核） 1表示已审核，-1表示审核未通过
     */
    private Integer reviewStatus;

    /**
     * 状态,用于删除,1 可用，0 不可用
     */
    private String status;

    public Integer getOutingId() {
        return outingId;
    }

    public void setOutingId(Integer outingId) {
        this.outingId = outingId;
    }
    public Integer getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(Integer elderlyId) {
        this.elderlyId = elderlyId;
    }
    public LocalDate getOutingDate() {
        return outingDate;
    }

    public void setOutingDate(LocalDate outingDate) {
        this.outingDate = outingDate;
    }
    public LocalTime getOutingTime() {
        return outingTime;
    }

    public void setOutingTime(LocalTime outingTime) {
        this.outingTime = outingTime;
    }
    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }
    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }
    public String getAccompanyingPerson() {
        return accompanyingPerson;
    }

    public void setAccompanyingPerson(String accompanyingPerson) {
        this.accompanyingPerson = accompanyingPerson;
    }
    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
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
    public Integer getReviewStatus() {
        return reviewStatus;
    }

    public void setReviewStatus(Integer reviewStatus) {
        this.reviewStatus = reviewStatus;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OutingRegistration{" +
            "outingId=" + outingId +
            ", elderlyId=" + elderlyId +
            ", outingDate=" + outingDate +
            ", outingTime=" + outingTime +
            ", destination=" + destination +
            ", purpose=" + purpose +
            ", accompanyingPerson=" + accompanyingPerson +
            ", contactInfo=" + contactInfo +
            ", remarks=" + remarks +
            ", createdAt=" + createdAt +
            ", updatedAt=" + updatedAt +
            ", reviewStatus=" + reviewStatus +
            ", status=" + status +
        "}";
    }
}
