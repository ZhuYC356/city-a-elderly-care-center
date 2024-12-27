package com.example.nursing_center.controller.Result;

import lombok.Data;

import java.math.BigDecimal;
@Data
public class Money {
    String month;
    BigDecimal getMoney;
    BigDecimal payMoney;
}
