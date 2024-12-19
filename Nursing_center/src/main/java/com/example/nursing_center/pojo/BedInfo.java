package com.example.nursing_center.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

/**
 * <p>
 * 存储床位基本信息
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@TableName("bed_info")
public class BedInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 床位唯一标识符
     */
    @TableId(value = "bed_id", type = IdType.AUTO)
    private Integer bedId;

    /**
     * 床位号
     */
    private String bedNumber;

    /**
     * 床位类型
     */
    private String bedType;

    /**
     * 床位状态（O/C/R：空闲/占用/预留）
     */
    private String bedStatus;

    /**
     * 楼号
     */
    private Integer floorNumber;

    /**
     * 房间号
     */
    private String roomNumber;

    /**
     * 楼层
     */
    private Integer floor;

    /**
     * 状态,用于删除,1 可用，0 不可用
     */
    private String status;

    public Integer getBedId() {
        return bedId;
    }

    public void setBedId(Integer bedId) {
        this.bedId = bedId;
    }
    public String getBedNumber() {
        return bedNumber;
    }

    public void setBedNumber(String bedNumber) {
        this.bedNumber = bedNumber;
    }
    public String getBedType() {
        return bedType;
    }

    public void setBedType(String bedType) {
        this.bedType = bedType;
    }
    public String getBedStatus() {
        return bedStatus;
    }

    public void setBedStatus(String bedStatus) {
        this.bedStatus = bedStatus;
    }
    public Integer getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(Integer floorNumber) {
        this.floorNumber = floorNumber;
    }
    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }
    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "BedInfo{" +
            "bedId=" + bedId +
            ", bedNumber=" + bedNumber +
            ", bedType=" + bedType +
            ", bedStatus=" + bedStatus +
            ", floorNumber=" + floorNumber +
            ", roomNumber=" + roomNumber +
            ", floor=" + floor +
            ", status=" + status +
        "}";
    }
}
