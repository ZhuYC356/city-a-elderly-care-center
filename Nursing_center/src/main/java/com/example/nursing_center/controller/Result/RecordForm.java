package com.example.nursing_center.controller.Result;

import lombok.Data;

/**
 * 护理记录表单字段
 * @version 1.0
 * @Author: 张璇
 * @DateTime: 2024/12/27 11:14
 **/
@Data
public class RecordForm {
    Integer elderlyId;
    String name;
    String idNumber;
    String projectName;
    Integer nurseLevel;
    String nurseName;
    String careStatus;
}
