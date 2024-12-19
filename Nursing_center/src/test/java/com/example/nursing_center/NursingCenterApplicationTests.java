package com.example.nursing_center;

import cn.hutool.json.JSONUtil;
import com.example.nursing_center.pojo.BedElderlyAssociation;
import com.example.nursing_center.pojo.ElderlyInfo;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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


    @Test
    void back_add() {
        ElderlyInfo user=new ElderlyInfo();
        user.setElderlyId(1);
        user.setName("小明");
        user.setGender("男");
        user.setAge(89);
        /*user.setIdNumber("111111111111111111");
        user.setSelfCareStatus(1);*/
        user.setHomeAddress("Beijing");
        user.setContactInfo("123456789");
        user.setCheckInTime(LocalDateTime.now());
        user.setCheckOutTime(LocalDateTime.now());
        List<ElderlyInfo> list=new ArrayList<>();
        list.add(user);
        String str= JSONUtil.toJsonStr(list);

        System.out.println(str);
    }

}
