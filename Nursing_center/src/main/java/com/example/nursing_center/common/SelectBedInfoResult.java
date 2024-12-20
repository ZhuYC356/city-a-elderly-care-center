package com.example.nursing_center.common;

import java.util.Objects;

/**
 *
 * 存储查询到的 床位号、房间号、床位状态
 *
 * @author 王谨琦
 * @date 2024年12月20日 16:56
 */
public class SelectBedInfoResult {

    /**
     * 床位状态
     */
    private String bedStatus;

    /**
     * 房间号
     */
    private String roomNumber;

    /**
     * 床位号
     */
    private String bedNumber;

    @Override
    public String
    toString() {
        return "SelectBedInfoResult{" +
                "bedStatus='" + bedStatus + '\'' +
                ", roomNumber='" + roomNumber + '\'' +
                ", bedNumber='" + bedNumber + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SelectBedInfoResult that = (SelectBedInfoResult) o;
        return Objects.equals(bedStatus, that.bedStatus) && Objects.equals(roomNumber, that.roomNumber) && Objects.equals(bedNumber, that.bedNumber);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bedStatus, roomNumber, bedNumber);
    }

    public String getBedStatus() {
        return bedStatus;
    }

    public void setBedStatus(String bedStatus) {
        this.bedStatus = bedStatus;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getBedNumber() {
        return bedNumber;
    }

    public void setBedNumber(String bedNumber) {
        this.bedNumber = bedNumber;
    }
}
