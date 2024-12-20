package com.example.nursing_center.controller.request;


import lombok.Data;

/**
 * @author : 冯子达
 * @version 1.0
 * @description :
 * @createDate : 2024/12/20 15:25
 */
@Data
public class Info {
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
}

