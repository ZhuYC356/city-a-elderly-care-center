package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author 第六组
 * @since 2024-12-20
 */
@TableName("check_out_requests")
public class CheckOutRequests implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "request_id", type = IdType.AUTO)
    private Integer requestId;

    private String elderlyId;

    private String roomNumber;

    private Integer tenantId;

    private String phoneNumber;

    private String propertyAddress;

    private LocalDate checkInDate;

    private LocalDate checkOutDate;

    private String checkoutReason;

    /**
     * 正常退住 1, 死亡退住 2, 保留床位 2
     */
    private Integer checkoutType;

    /**
     * 审核状态 未审核 1, 通过 2, 不通过 3
     */
    private Integer approvalStatus;

    private LocalDateTime approvalTime;

    private String approvalPerson;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    public Integer getRequestId() {
        return requestId;
    }

    public void setRequestId(Integer requestId) {
        this.requestId = requestId;
    }
    public String getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(String elderlyId) {
        this.elderlyId = elderlyId;
    }
    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public String getPropertyAddress() {
        return propertyAddress;
    }

    public void setPropertyAddress(String propertyAddress) {
        this.propertyAddress = propertyAddress;
    }
    public LocalDate getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(LocalDate checkInDate) {
        this.checkInDate = checkInDate;
    }
    public LocalDate getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(LocalDate checkOutDate) {
        this.checkOutDate = checkOutDate;
    }
    public String getCheckoutReason() {
        return checkoutReason;
    }

    public void setCheckoutReason(String checkoutReason) {
        this.checkoutReason = checkoutReason;
    }
    public Integer getCheckoutType() {
        return checkoutType;
    }

    public void setCheckoutType(Integer checkoutType) {
        this.checkoutType = checkoutType;
    }
    public Integer getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(Integer approvalStatus) {
        this.approvalStatus = approvalStatus;
    }
    public LocalDateTime getApprovalTime() {
        return approvalTime;
    }

    public void setApprovalTime(LocalDateTime approvalTime) {
        this.approvalTime = approvalTime;
    }
    public String getApprovalPerson() {
        return approvalPerson;
    }

    public void setApprovalPerson(String approvalPerson) {
        this.approvalPerson = approvalPerson;
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
        return "CheckOutRequests{" +
            "requestId=" + requestId +
            ", elderlyId=" + elderlyId +
            ", roomNumber=" + roomNumber +
            ", tenantId=" + tenantId +
            ", phoneNumber=" + phoneNumber +
            ", propertyAddress=" + propertyAddress +
            ", checkInDate=" + checkInDate +
            ", checkOutDate=" + checkOutDate +
            ", checkoutReason=" + checkoutReason +
            ", checkoutType=" + checkoutType +
            ", approvalStatus=" + approvalStatus +
            ", approvalTime=" + approvalTime +
            ", approvalPerson=" + approvalPerson +
            ", createdAt=" + createdAt +
            ", updatedAt=" + updatedAt +
        "}";
    }
}
