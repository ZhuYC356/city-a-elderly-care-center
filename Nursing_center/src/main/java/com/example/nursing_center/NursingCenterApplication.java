package com.example.nursing_center;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

/**
 * @author 第六组
 */
@SpringBootApplication
@MapperScan("com.example.nursing_center.mapper")
@EnableCaching
public class NursingCenterApplication {

    public static void main(String[] args) {
        SpringApplication.run(NursingCenterApplication.class, args);
        System.out.println("启动成功!!!!!!!!");
    }

}
