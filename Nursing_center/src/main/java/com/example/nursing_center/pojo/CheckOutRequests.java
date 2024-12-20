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

    /**
     * 退住请求的唯一标识符
     */
    @TableId(value = "request_id", type = IdType.AUTO)
    private Integer requestId;

    /**
     * 客户的唯一ID（例如，老年人的ID）
     */
    private String elderlyId;

    /**
     * 外联床位id
     */
    private String bedId;

    /**
     * 客户的联系电话
     */
    private String phoneNumber;

    /**
     * 住所地址（可能不是必需的，取决于您的设计）
     */
    private String propertyAddress;

    /**
     * 入住日期
     */
    private LocalDate checkInDate;

    /**
     * 计划退住日期（实际退住日期可能有所不同）
     */
    private LocalDate checkOutDate;

    /**
     * 退住原因（可选的详细描述）
     */
    private String checkoutReason;

    /**
     * 退住类型：1-正常退住, 2-死亡退住, 3-保留床位（注意：这里我修改了原始设计中的值以避免重复，因为您原始设计中死亡退住和保留床位都是2）
     */
    private Integer checkoutType;

    /**
     * 审核状态：1-未审核, 2-通过, 3-不通过
     */
    private Integer approvalStatus;

    /**
     * 审批时间（仅当审核通过时设置）
     */
    private LocalDateTime approvalTime;

    /**
     * 审批人（仅当审核通过时设置）
     */
    private String approvalPerson;

    /**
     * 记录创建时间
     */
    private LocalDateTime createdAt;

    /**
     * 记录最后更新时间
     */
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
    public String getBedId() {
        return bedId;
    }

    public void setBedId(String bedId) {
        this.bedId = bedId;
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
            ", bedId=" + bedId +
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
