package com.example.nursing_center.controller.Result;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author 王谨琦
 * @date 2024年12月28日 11:44
 */
public class CareProjectForElderly {

    /**
     * 护理项目的名称
     */
    private String projectName;

    /**
     * 护理项目的描述
     */
    private String description;

    /**
     * 护理项目的服务状态（1:到期，0: 欠费，2:数量正常，3: 未到期）
     */
    private String careStatus;

    /**
     *护理项目的到期时间
     */
    private LocalDateTime careEndTime;

    /**
     * 护理项目的价格
     */
    private BigDecimal price;
}
