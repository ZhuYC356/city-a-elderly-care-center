package com.example.nursing_center.service.impl;

import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.Result.Money;
import com.example.nursing_center.pojo.Financial;
import com.example.nursing_center.mapper.FinancialMapper;
import com.example.nursing_center.service.IFinancialService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    @Override
    public List<Money> getAll() {
//        return financialMapper.getAll();
        System.out.println(financialMapper.getAll());
        List<Financial> financials= financialMapper.getAll();
        List <Money> monies=null;

        for(int i=1;i<=12;i++){
            Money money=new Money();
            money.setMonth(String.valueOf(i-1));

        }
        return null;
    }

}
