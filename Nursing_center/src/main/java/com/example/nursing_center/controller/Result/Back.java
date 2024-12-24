package com.example.nursing_center.controller.Result;

import lombok.Data;

import java.util.Date;

/**
 * @version 1.0
 * @Author: 张璇
 * @DateTime: 2024/12/20 20:05
 **/
@Data
public class Back {
    /**
     * 前端查询的字段
     */
    String name;
    String bedId;
    Date checkInDate;
}
