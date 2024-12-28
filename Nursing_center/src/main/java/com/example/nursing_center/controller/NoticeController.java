package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.pojo.Notice;
import com.example.nursing_center.service.INoticeService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 公告信息表 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/notice")
public class NoticeController {
    @Resource
    private INoticeService noticeService;
    @GetMapping("/list")
    public Result list(){
        return noticeService.gatAll();
    }
    @PostMapping("/add")
    public Result add(@RequestBody Notice notice){
        return noticeService.add(notice);
    }
}
