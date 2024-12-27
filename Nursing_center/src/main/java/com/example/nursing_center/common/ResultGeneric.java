package com.example.nursing_center.common;

import com.example.nursing_center.common.enums.ResultCodeEnum;

/**
 * @Author: 竹永灿 224804356
 * @Description: 返回结果类，支持泛型，使其可以处理任何类型的返回数据
 * @version: 1.0
 * @DateTime: 2024/12/27 10:56
 **/
public class ResultGeneric<T> {
    private String code;
    private String msg;
    private T data;  // 使用泛型类型T来表示返回的数据类型

    // 构造方法
    public ResultGeneric(T data) {  // 修改为public
        this.data = data;
    }

    public ResultGeneric() {
    }

    // 成功返回
    public static <T> ResultGeneric<T> success() {
        ResultGeneric<T> tResultGeneric = new ResultGeneric<>();
        tResultGeneric.setCode(ResultCodeEnum.SUCCESS.code);
        tResultGeneric.setMsg(ResultCodeEnum.SUCCESS.msg);
        return tResultGeneric;
    }

    public static <T> ResultGeneric<T> success(T data) {
        ResultGeneric<T> tResultGeneric = new ResultGeneric<>(data);
        tResultGeneric.setCode(ResultCodeEnum.SUCCESS.code);
        tResultGeneric.setMsg(ResultCodeEnum.SUCCESS.msg);
        return tResultGeneric;
    }

    // 错误返回
    public static <T> ResultGeneric<T> error() {
        ResultGeneric<T> tResultGeneric = new ResultGeneric<>();
        tResultGeneric.setCode(ResultCodeEnum.SYSTEM_ERROR.code);
        tResultGeneric.setMsg(ResultCodeEnum.SYSTEM_ERROR.msg);
        return tResultGeneric;
    }

    public static <T> ResultGeneric<T> error(String code, String msg) {
        ResultGeneric<T> tResultGeneric = new ResultGeneric<>();
        tResultGeneric.setCode(code);
        tResultGeneric.setMsg(msg);
        return tResultGeneric;
    }

    public static <T> ResultGeneric<T> error(ResultCodeEnum ResultCodeEnum) {
        ResultGeneric<T> tResultGeneric = new ResultGeneric<>();
        tResultGeneric.setCode(ResultCodeEnum.code);
        tResultGeneric.setMsg(ResultCodeEnum.msg);
        return tResultGeneric;
    }

    // 新增失败方法
    public static <T> ResultGeneric<T> failure(String message) {
        return error("-1", message);
    }

    // Getter 和 Setter
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
