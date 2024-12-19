package com.example.nursing_center;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
@MapperScan("com.example.nursing_center.mapper")
public class NursingCenterApplication {

    public static void main(String[] args) {
        SpringApplication.run(NursingCenterApplication.class, args);
    }

}
