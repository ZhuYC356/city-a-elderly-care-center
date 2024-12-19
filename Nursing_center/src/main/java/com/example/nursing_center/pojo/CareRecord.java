package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * <p>
 * 存储老人的护理记录信息
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@TableName("care_record")
public class CareRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 护理记录的唯一标识符
     */
    @TableId(value = "care_record_id", type = IdType.AUTO)
    private Integer careRecordId;

    /**
     * 与该护理记录关联的老人ID，外键关联到老人表
     */
    private Integer elderlyId;

    /**
     * 与该护理记录关联的护理项目ID，外键关联到护理项目表
     */
    private Integer careProjectId;

    /**
     * 护理发生的日期
     */
    private LocalDate careDate;

    /**
     * 护理的类型或名称
     */
    private String careType;

    /**
     * 护理的持续时间
     */
    private LocalTime careDuration;

    /**
     * 执行护理的护理人员的ID，外键关联到护理人员表
     */
    private Integer caregiverId;

    /**
     * 老人护理时的体温记录
     */
    private BigDecimal temperature;

    /**
     * 老人护理时的血压记录
     */
    private String bloodPressure;

    /**
     * 老人护理时的血糖记录
     */
    private BigDecimal bloodSugar;

    /**
     * 其他需要记录的生命体征信息
     */
    private String otherSigns;

    /**
     * 护理过程中的备注信息或特殊事件记录
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

    public Integer getCareRecordId() {
        return careRecordId;
    }

    public void setCareRecordId(Integer careRecordId) {
        this.careRecordId = careRecordId;
    }
    public Integer getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(Integer elderlyId) {
        this.elderlyId = elderlyId;
    }
    public Integer getCareProjectId() {
        return careProjectId;
    }

    public void setCareProjectId(Integer careProjectId) {
        this.careProjectId = careProjectId;
    }
    public LocalDate getCareDate() {
        return careDate;
    }

    public void setCareDate(LocalDate careDate) {
        this.careDate = careDate;
    }
    public String getCareType() {
        return careType;
    }

    public void setCareType(String careType) {
        this.careType = careType;
    }
    public LocalTime getCareDuration() {
        return careDuration;
    }

    public void setCareDuration(LocalTime careDuration) {
        this.careDuration = careDuration;
    }
    public Integer getCaregiverId() {
        return caregiverId;
    }

    public void setCaregiverId(Integer caregiverId) {
        this.caregiverId = caregiverId;
    }
    public BigDecimal getTemperature() {
        return temperature;
    }

    public void setTemperature(BigDecimal temperature) {
        this.temperature = temperature;
    }
    public String getBloodPressure() {
        return bloodPressure;
    }

    public void setBloodPressure(String bloodPressure) {
        this.bloodPressure = bloodPressure;
    }
    public BigDecimal getBloodSugar() {
        return bloodSugar;
    }

    public void setBloodSugar(BigDecimal bloodSugar) {
        this.bloodSugar = bloodSugar;
    }
    public String getOtherSigns() {
        return otherSigns;
    }

    public void setOtherSigns(String otherSigns) {
        this.otherSigns = otherSigns;
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
        return "CareRecord{" +
            "careRecordId=" + careRecordId +
            ", elderlyId=" + elderlyId +
            ", careProjectId=" + careProjectId +
            ", careDate=" + careDate +
            ", careType=" + careType +
            ", careDuration=" + careDuration +
            ", caregiverId=" + caregiverId +
            ", temperature=" + temperature +
            ", bloodPressure=" + bloodPressure +
            ", bloodSugar=" + bloodSugar +
            ", otherSigns=" + otherSigns +
            ", remarks=" + remarks +
            ", createdAt=" + createdAt +
            ", updatedAt=" + updatedAt +
            ", status=" + status +
        "}";
    }
}
