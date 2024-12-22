package com.example.nursing_center.common.enums;

import java.util.Objects;

/**
 * @author 王谨琦
 * @date 2024年12月22日 17:33
 */
public class BedStatusCount {

    /**
     * 床位状态
     */
    private String bedStatus;

    /**
     * 床位状态对应的数量
     */
    private Integer count;

    @Override
    public String toString() {
        return "BedStatusCount{" +
                "bedStatus='" + bedStatus + '\'' +
                ", count=" + count +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BedStatusCount that = (BedStatusCount) o;
        return Objects.equals(bedStatus, that.bedStatus) && Objects.equals(count, that.count);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bedStatus, count);
    }

    public String getBedStatus() {
        return bedStatus;
    }

    public void setBedStatus(String bedStatus) {
        this.bedStatus = bedStatus;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
