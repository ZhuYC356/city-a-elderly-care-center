package com.example.nursing_center.controller.request;


import cn.hutool.core.date.DateTime;
import lombok.Data;

/**
 * @author : 冯子达
 * @version 1.0
 * @description :
 * @createDate : 2024/12/20 15:25
 */
@Data
public class Info {
    private int elderlyId;
    private String name;
    private String idNumber;
    private int age;
    private int nurseLevel;
    private int nurseId;
    private Integer selfCareStatus;
    private String familyContactInfo;
    private String bedNumber;
    private String physicalCondition;
    private int floorNumber;
    private String gender;
    private String roomNumber;
    private int bedId;
    private DateTime checkOutDate;
    private String checkoutReason;
    private Integer checkoutType;
    private String phoneNumber;
    private String address;
    private DateTime outingDate;
    private DateTime outingTime;
    private String purpose;
    private String accompanyingPerson;
    private String contactInfo;
    private String remarks;
    private String outingReason;
    private String destination;
}

