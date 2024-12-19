package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * <p>
 * 存储老人项目的财务信息
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
public class Financial implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 财务记录的唯一标识符
     */
    @TableId(value = "financial_id", type = IdType.AUTO)
    private Integer financialId;

    /**
     * 财务记录的类型（收入、支出等）
     */
    private String type;

    /**
     * 财务记录的金额
     */
    private BigDecimal amount;

    /**
     * 财务记录发生的日期
     */
    private LocalDate date;

    /**
     * 与该财务记录关联的老人ID，外键关联到老人表
     */
    private Integer elderlyId;

    /**
     * 与该财务记录关联的护理项目ID，外键关联到护理项目表
     */
    private Integer projectId;

    /**
     * 与该财务记录关联的发票编号
     */
    private String invoiceNumber;

    /**
     * 发票的日期
     */
    private LocalDate invoiceDate;

    /**
     * 付款或收款方的名称或描述
     */
    private String paymentParty;

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
     * 状态,用于删除,1 可用，0 不可用
     */
    private Integer status;

    public Integer getFinancialId() {
        return financialId;
    }

    public void setFinancialId(Integer financialId) {
        this.financialId = financialId;
    }
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
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
    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }
    public LocalDate getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(LocalDate invoiceDate) {
        this.invoiceDate = invoiceDate;
    }
    public String getPaymentParty() {
        return paymentParty;
    }

    public void setPaymentParty(String paymentParty) {
        this.paymentParty = paymentParty;
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
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Financial{" +
            "financialId=" + financialId +
            ", type=" + type +
            ", amount=" + amount +
            ", date=" + date +
            ", elderlyId=" + elderlyId +
            ", projectId=" + projectId +
            ", invoiceNumber=" + invoiceNumber +
            ", invoiceDate=" + invoiceDate +
            ", paymentParty=" + paymentParty +
            ", remarks=" + remarks +
            ", createdAt=" + createdAt +
            ", updatedAt=" + updatedAt +
            ", status=" + status +
        "}";
    }
}
