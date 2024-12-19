package com.example.nursing_center;

import cn.hutool.json.JSONUtil;
import com.example.nursing_center.pojo.BedElderlyAssociation;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.time.LocalDateTime;

@SpringBootTest
class NursingCenterApplicationTests {

    @Test
    void contextLoads() {
        BedElderlyAssociation user=new BedElderlyAssociation();
        user.setAssociationId(1);
        user.setBedId(1);
        user.setElderlyId(1);
        String str= JSONUtil.toJsonStr(user);
        System.out.println(str);
    }

}
