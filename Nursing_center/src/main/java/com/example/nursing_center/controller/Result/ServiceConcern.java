package com.example.nursing_center.controller.Result;

import java.util.List;

/**
 * @author 王谨琦
 * @date 2024年12月28日 11:39
 */
public class ServiceConcern {

    /**
     * 老人的名字
     */
    private String name;

    /**
     * 老人的性别
     */
    private String gender;

    /**
     * 老人年龄
     */
    private Integer age;

    /**
     * 老人身份证号
     */
    private String idNumber;

    /**
     * 护工的名字
     */
    private String nurseName;

    /**
     * 当前老人的护理项目列表
     */
    private List<CareProjectForElderly> careProjectForElderlyList;
}
