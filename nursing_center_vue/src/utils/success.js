import {Notification} from "element-ui";
const complete=() =>{
    Notification.success({
        title: 'success',
        message: '操作成功',
        type: 'success'
    });
}
const fail=() =>{
    Notification.error({
        title: 'error',
        message: '执行失败',
        type: 'error'
    });
}
export function success(){
    return complete();
}
export function error(){
    return fail();
}



