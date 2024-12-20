package com.example.nursing_center.controller.Result;

import lombok.Data;

/**
 * @version 1.0
 * @Author: 张璇
 * @DateTime: 2024/12/20 21:04
 **/
@Data
public class BackForm {
    String elderlyId;
    String name;
    String checkInDate;
    String checkOutDate;
    String bedId;
    String checkoutType;
    String approvalStatus;
    String approvalPerson;
    String approvalTime;
}
