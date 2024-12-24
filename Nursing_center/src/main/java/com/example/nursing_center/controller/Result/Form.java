package com.example.nursing_center.controller.Result;

import lombok.Data;

/**
 * @version 1.0
 * @Author: 张璇
 * @DateTime: 2024/12/20 19:56
 **/
@Data
public class Form {
    String name;
    String  bedNumber;
    int pageNum;
    int pageSize;
}
