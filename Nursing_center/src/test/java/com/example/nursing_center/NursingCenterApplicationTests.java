package com.example.nursing_center;

import cn.hutool.json.JSONUtil;
import com.example.nursing_center.pojo.BedElderlyAssociation;
import com.example.nursing_center.pojo.BedInfo;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.time.LocalDateTime;

@SpringBootTest
class NursingCenterApplicationTests {

    @Test
    void contextLoads() {
        BedInfo user=new BedInfo();
        user.setBedNumber("1");
        user.setBedType("2");
        user.setBedStatus("3");
        user.setFloorNumber(4);
        user.setRoomNumber("5");
        String str= JSONUtil.toJsonStr(user);
        System.out.println(str);
    }

}
