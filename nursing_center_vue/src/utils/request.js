import axios from 'axios'
import router from "@/router";
const time = 30 * 60 * 1000
// 获取当前时间
function getCurrentTime() {
    const now = new Date();
    return now;
}

// 判断两个时间是否相差30分钟
function isWithin30Minutes(time1, time2) {
    return Math.abs(time1 - time2) <= time;
}

function pan() {
    let user = JSON.parse(localStorage.getItem("nursing_center_user"))
    if (user === null) {
        router.push('/login')
    } else {
        const currentTime = getCurrentTime();
        const storedTimeString = localStorage.getItem("time"); // 替换为实际存储的时间字符串
        const storedTime = parseInt(storedTimeString, 10);
        if (isWithin30Minutes(currentTime, storedTime)) {
            console.log("当前时间和存储的时间相差小于30分钟");
        } else {
            console.log("当前时间和存储的时间相差超过30分钟");
            router.push('/login')
        }
    }
}

// 创建可一个新的axios对象
const request = axios.create({
    baseURL: process.env.VUE_APP_BASEURL,   // 后端的接口地址  ip:port
    timeout: 30000                          // 30s请求超时
})

// request 拦截器
// 可以自请求发送前对请求做一些处理
// 比如统一加token，对请求参数统一加密
request.interceptors.request.use(config => {
    config.headers['Content-Type'] = 'application/json;charset=utf-8';        // 设置请求头格式
    // let user = JSON.parse(localStorage.getItem("xm-user") || '{}')  // 获取缓存的用户信息
    // config.headers['token'] = user.token  // 设置请求头
    pan()
    return config
}, error => {
    console.error('request error: ' + error) // for debug
    return Promise.reject(error)
});

// response 拦截器
// 可以在接口响应后统一处理结果
request.interceptors.response.use(
    response => {
        let res = response.data;
        pan()
        // 兼容服务端返回的字符串数据
        if (typeof res === 'string') {
            res = res ? JSON.parse(res) : res
        }
        return res;
    },
    error => {
        console.error('response error: ' + error) // for debug
        return Promise.reject(error)
    }
)


export default request