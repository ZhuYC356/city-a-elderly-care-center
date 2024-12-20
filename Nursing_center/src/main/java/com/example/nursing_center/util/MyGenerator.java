package com.example.nursing_center.util;


import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;

/**
 * @author : 冯子达
 * @version 1.0
 * @description :
 * @createDate : 2024/10/18 10:59
 */

public class MyGenerator {
    //    注意这个是远程数据库连接信息，当连接的时候可能需要加上 &useSSL=false 解决报错
    private static final String URL = "jdbc:mysql://82.157.184.186:3306/nursing_center?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&serverTimezone=GMT%2B8&useSSL=false";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Feng183370@";
    private static final String PACKAGE_NAME = "com.example.nursing_center";
    private static final String OUTDIR_JAVA = "D:\\devopment_project\\java_project\\softwareconstruction\\city-a-elderly-care-center\\Nursing_center\\src\\main\\java";
    private static final String OUTDIR_XML = "D:\\devopment_project\\java_project\\softwareconstruction\\city-a-elderly-care-center\\Nursing_center\\src\\main\\resources\\mapper";
    private static final String AUTHOR_NAME = "第六组";

    /**
     * 你要生成的表名字符串数组
     */
    private static final String [] tables = {
//            "admin",
//            "bed_info",
//            "care_project",
//            "care_record",
//            "elderly_care_project",
//            "elderly_info",
//            "financial",
//            "notice",
//            "nurse_info",
//            "outing_registration",
//            "bed_elderly_association",
            "check_out_requests"
    };

    public static void main(String[] args) {
        for(int i = 0; i < tables.length; i++){
            int finalI = i;
            FastAutoGenerator.create(URL, USERNAME, PASSWORD)
                    .globalConfig(builder -> {
                        builder.author(AUTHOR_NAME) // 设置作者
                                .fileOverride() // 覆盖已生成文件
                                .outputDir(OUTDIR_JAVA) // 指定输出目录
                                .disableOpenDir();    // 禁止打开输出目录
                    })
                    .packageConfig(builder -> {
                        builder.parent(PACKAGE_NAME) // 设置包名
                                .entity("pojo")         //设置实体类包名
                                .pathInfo(Collections.singletonMap(OutputFile.mapperXml, OUTDIR_XML)); // 设置mapperXml生成路径
                    })
                    .strategyConfig(builder -> {
                        builder.addInclude(tables[finalI]) // 设置需要生成的表名
                                .controllerBuilder()   //这里写controllerBuilder，表示将开始controller配置
                                .enableRestStyle();
                    })
                    .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                    .execute();
            System.out.println("表+"+tables[i]+"生成成功");
        }
    }
}