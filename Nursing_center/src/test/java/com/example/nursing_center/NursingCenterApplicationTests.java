package com.example.nursing_center;

import cn.hutool.core.date.DateTime;
import cn.hutool.json.JSONUtil;
import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Login;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.mapper.BedInfoMapper;
import com.example.nursing_center.pojo.BedElderlyAssociation;
import com.example.nursing_center.pojo.ElderlyInfo;
import com.example.nursing_center.pojo.NurseInfo;
import com.example.nursing_center.service.IElderlyInfoService;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.util.List;

@SpringBootTest
class NursingCenterApplicationTests {
    @Resource
    private IElderlyInfoService elderlyInfoService;
    @Resource
    private BedInfoMapper bedInfoMapper;

    @Test
    void contextLoads() {
        BedElderlyAssociation user = new BedElderlyAssociation();
        user.setAssociationId(1);
        user.setBedId(1);
        user.setElderlyId(1);
        String str = JSONUtil.toJsonStr(user);
        System.out.println(str);
    }


    @Test
    void back_add() {
        ElderlyInfo user = new ElderlyInfo();
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
        String str = JSONUtil.toJsonStr(user);
        System.out.println(str);
    }

    @Test
    public void test1() {
        Info info = new Info();
        info.setName("小明");
        info.setGender("M");
        info.setAge(89);
        info.setIdNumber("111111111111111111");
        info.setSelfCareStatus(1);
        info.setFamilyContactInfo("123456789");
        info.setBedNumber("1");
        info.setPhysicalCondition("1");
        info.setFloorNumber(1);
        info.setRoomNumber("1");
        String str = JSONUtil.toJsonStr(info);
        System.out.println(str);
    }

    @Test
    public void test2() {
        Info info = new Info();
        info.setElderlyId(13);
        info.setBedId(1);
        info.setPhoneNumber("18337049186");
        info.setCheckoutReason("出去玩");
        info.setCheckoutType(1);
        String str = JSONUtil.toJsonStr(info);
        System.out.println(str);
    }

    @Test
    public void test3() {
        Info info = new Info();
        info.setElderlyId(13);
        info.setOutingReason("1212");
        info.setPurpose("1212");
        info.setAccompanyingPerson("1212");
        info.setContactInfo("1212");
        info.setRemarks("1212");
        info.setOutingDate(DateTime.now());
        info.setDestination("12122");
        String str = JSONUtil.toJsonStr(info);
        System.out.println(str);
    }
    @Test
    public void test4() {
        NurseInfo nurseInfo = new NurseInfo();
        nurseInfo.setNurseId(1);
        nurseInfo.setName("小明");
        nurseInfo.setGender("M");
        nurseInfo.setAge(10);
        nurseInfo.setContactInfo("123456789");
        nurseInfo.setWorkExperience("123456789");
        nurseInfo.setProfessionalCertificate("123456789");
        nurseInfo.setIdNumber("123456789");
        nurseInfo.setServiceEvaluation("123456789");
        nurseInfo.setNurseLevel(1);
        System.out.println(JSONUtil.toJsonStr(nurseInfo));
    }
    @Test
    public void test5() {
        Login  login = new Login();
        login.setUsername("admin");
        login.setPassword("123456");
        System.out.println(JSONUtil.toJsonStr(login));
    }

}
