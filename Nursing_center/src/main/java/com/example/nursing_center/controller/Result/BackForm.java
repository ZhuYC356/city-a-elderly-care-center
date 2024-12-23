package com.example.nursing_center.controller.Result;

import lombok.Data;

import java.util.Date;

/**
 * @version 1.0
 * @Author: 张璇
 * @DateTime: 2024/12/20 21:04
 **/
@Data
public class BackForm {
    /**
     * 前端表单的显示信息
     */
    String elderlyId;
    String name;
    String checkInDate;
    String checkOutDate;
    Integer bedId;
    String checkoutType;
    String approvalStatus;
    String approvalPerson;
    Date approvalTime;
    Integer adminId;


}
