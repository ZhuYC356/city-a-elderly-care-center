package com.example.nursing_center.controller;

import com.example.nursing_center.common.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : 冯子达
 * @version 1.0
 * @description :
 * @createDate : 2024/12/19 15:17
 */
@RestController
@RequestMapping("/web")
public class WebController {
    @GetMapping("/test")
    public Result index(){
        return Result.success();
    }
}

