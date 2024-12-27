package com.example.nursing_center.controller;


import com.example.nursing_center.common.Result;
import com.example.nursing_center.controller.request.Info;
import com.example.nursing_center.pojo.ElderlyInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 存储老人详细信息 前端控制器
 * </p>
 *
 * @author 第六组
 * @since 2024-12-19
 */
@RestController
@RequestMapping("/elderly-info")
public class ElderlyInfoController {
    @Resource
    private com.example.nursing_center.service.IElderlyInfoService elderlyInfoService;
    @GetMapping("/getAll")
    public Result getAll(){
        return elderlyInfoService.getAll();
    }
    @PostMapping("/add")
    public Result add(@RequestBody Info info){
        System.out.println(info+"121222222222222222222222222222222222222");
        return elderlyInfoService.add(info);
    }
    @GetMapping("/getById/{id}")
    public Result getById(@PathVariable Integer id){
        System.out.println("++++++++++++++++++++++++++++"+id+"__________________________");
        return elderlyInfoService.getAllById(id);
    }
    @PostMapping("/selectByFrom")
    public Result selectByFrom(@RequestBody ElderlyInfo elderlyInfo){
        return elderlyInfoService.selectByFrom(elderlyInfo);
    }
    @PostMapping("/updateById")
    public Result updateById(@RequestBody Info info){
        System.out.println(info);
        return elderlyInfoService.updateAllById(info);
    }
    @GetMapping("/getElderlyInfoByRoomAndBed/{floorNumber}/{roomNumber}/{bedNumber}")
    public Result getElderlyInfoByRoomAndBed(@PathVariable Integer floorNumber,@PathVariable String roomNumber,@PathVariable String bedNumber){
        System.out.println("________________"+roomNumber+"_______________");
        return elderlyInfoService.getElderlyInfoByRoomAndBed(roomNumber,bedNumber,floorNumber);
    }
    @GetMapping("/getElderlyInfoByIdNumber/{idNumber}")
    public Result getElderlyInfoByIdNumber(@PathVariable String idNumber){
        return elderlyInfoService.getElderlyInfoByIdNumber(idNumber);
    }
}
