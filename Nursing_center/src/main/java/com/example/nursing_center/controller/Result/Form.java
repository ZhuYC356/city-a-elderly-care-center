package com.example.nursing_center.controller.Result;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @version 1.0
 * @Author: 张璇
 * @DateTime: 2024/12/20 19:56
 **/
@Data
public class Form {
    String name;
    String  bedNumber;
    String  projectName;
    int  maxPrice;
    int  minPrice;
    int pageNum;
    int pageSize;

    String  description;
    Date serviceDurationTime;
    BigDecimal price;
    String frequency;
    int   nurseLevel;
    int length;
}
