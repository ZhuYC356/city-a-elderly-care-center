package com.example.nursing_center.service.impl;

import cn.hutool.core.date.DateTime;
import com.example.nursing_center.controller.Result.Money;
import com.example.nursing_center.controller.Result.ProjectRate;
import com.example.nursing_center.pojo.CareProject;
import com.example.nursing_center.pojo.Financial;
import com.example.nursing_center.mapper.FinancialMapper;
import com.example.nursing_center.service.ICareProjectService;
import com.example.nursing_center.service.IFinancialService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 存储老人项目的财务信息 服务实现类
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@Service
public class FinancialServiceImpl extends ServiceImpl<FinancialMapper, Financial> implements IFinancialService {

    @Resource
    private FinancialMapper financialMapper;
    @Resource
    private ICareProjectService ICareProjectService;
    @Override
    public List<Money> getAll() {
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);

        System.out.println(financialMapper.getAll());
        List<Financial> financials= financialMapper.getAll();
        List <Money> monies =new ArrayList<>(12);
        for(int i = 0;i<12;i++){
            Money money=new Money();
            money.setMonth(String.valueOf(i+1));
            money.setGetMoney(BigDecimal.valueOf(0));
            money.setPayMoney(BigDecimal.valueOf(0));
            monies.add(i,money);
        }
        BigDecimal sumGet[]= new BigDecimal[12];
        BigDecimal sumPay[]= new BigDecimal[12];
        for (int i = 0; i < 12; i++) {
            sumGet[i] = BigDecimal.ZERO;
            sumPay[i] = BigDecimal.ZERO;
        }
        for(int j=0;j<financials.size();j++){
            System.out.println("数据年份"+financials.get(j).getDate().getYear());
            for(int i=0;i<12;i++){
                if(financials.get(j).getDate().getMonthValue()== i+1 && financials.get(j).getType().equals("收入") && financials.get(j).getDate().getYear() == year){
                    System.out.println(financials.get(j).getAmount());
                    sumGet[i]=sumGet[i].add(financials.get(j).getAmount());
                }
                else if(financials.get(j).getDate().getMonthValue()==i+1 && financials.get(j).getType().equals("支出") && financials.get(j).getDate().getYear() == year){
                    sumPay[i]=sumPay[i].add(financials.get(j).getAmount());
                }
            }

        }
       for (int i = 0; i < 12; i++){
           Money money=new Money();
           money.setMonth(String.valueOf(i+1));
           money.setGetMoney(sumGet[i]);
           money.setPayMoney(sumPay[i]);
           monies.set(i,money);
       }
        return monies;
    }

    @Override
    public List<ProjectRate> getProjectRate() {
        List<CareProject> careProjects = ICareProjectService.getProjectName();
        System.out.println(careProjects);
        List<ProjectRate> projectRates = new ArrayList<>(careProjects.size());
        int sum[]= new int[careProjects.size()];
        for(int i=0;i<sum.length;i++){
            sum[i]=0;
        }
        List<Financial> financials= financialMapper.getAll();
        for(int i=0;i<financials.size();i++){
            for(int j=0;j<sum.length;j++){
                if(financials.get(i).getProjectId()==j){
                    sum[j]++;
                }
            }
        }
        for(int i=0;i<careProjects.size();i++){
            ProjectRate projectRate = new ProjectRate();
            projectRate.setProjectId(careProjects.get(i).getProjectId());
            projectRate.setProjectName(careProjects.get(i).getProjectName());
            projectRate.setNumber(sum[i]);
            projectRates.add(projectRate);
        }

        System.out.println(projectRates);
        return projectRates;
    }


}
