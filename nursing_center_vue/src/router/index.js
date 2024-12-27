import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

// 解决导航栏或者底部导航tabBar中的vue-router在3.0版本以上频繁点击菜单报错的问题。
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push (location) {
  return originalPush.call(this, location).catch(err => err)
}

const routes = [
  {
    path: '/',
    name: 'Manager',
    component: () => import('../views/Manager.vue'),
    redirect: '/home',  // 重定向到主页
    children: [
      { path: '403', name: 'NoAuth', meta: { name: '无权限' }, component: () => import('../views/manager/403') },
      { path: 'home', name: 'Home', meta: { name: '系统首页' }, component: () => import('../views/manager/Home') },
      { path: 'admin', name: 'Admin', meta: { name: '管理员信息' }, component: () => import('../views/manager/Admin') },
      { path: 'adminPerson', name: 'AdminPerson', meta: { name: '个人信息' }, component: () => import('../views/manager/AdminPerson') },
      { path: 'password', name: 'Password', meta: { name: '修改密码' }, component: () => import('../views/manager/Password') },
      { path: 'notice', name: 'Notice', meta: { name: '公告信息' }, component: () => import('../views/manager/Notice') },
      { path: 'registered', name: 'Registered', meta: { name: '挂号信息' }, component: () => import('../views/manager/Registered') },
      { path: 'patientViewing', name: 'PatientViewing', meta: { name: '患者查看' }, component: () => import('../views/manager/doctors_work/PatientViewing') },
      { path: 'refundNumber', name: 'RefundNumber', meta: { name: '退号' }, component: () => import('../views/manager/RefundNumber') },
      { path: 'toll', name: 'Toll', meta: { name: '收费' }, component: () => import('../views/manager/Toll') },
      { path: 'refunds', name: 'Refunds', meta: { name: '退费' }, component: () => import('../views/manager/Refunds') },
      { path: 'queryExpenseRecor', name: 'QueryExpenseRecor', meta: { name: '费用记录查询' }, component: () => import('../views/manager/QueryExpenseRecor') },
      { path: 'bunk', name: 'Bunk', meta: { name: '床位信息' }, component: () => import('../views/manager/cent/Bunk.vue') },
      { path: 'bunk_manager', name: 'Bunk_manager', meta: { name: '床位管理' }, component: () => import('../views/manager/cent/Bunk_manager.vue') },
      { path: 'check_in', name: 'Check_in', meta: { name: '入住登记' }, component: () => import('../views/manager/cent/Check_in.vue') },
      { path: 'check_out_registration', name: 'Check_out_registration', meta: { name: '退住登记' }, component: () => import('../views/manager/cent/Check_out_registration.vue') },
      { path: 'out_office_registration', name: 'Out_office_registration', meta: { name: '外出登记' }, component: () => import('../views/manager/cent/Out_office_registration.vue') },
      { path: 'nursing_programs_Manager', name: 'Nursing_programs_Manager', meta: { name: '护理项目管理' }, component: () => import('../views/manager/cent/Nursing_programs_Manager.vue') },
      { path: 'nursing_programs_history', name: 'Nursing_programs_history', meta: { name: '护理记录' }, component: () => import('../views/manager/cent/Nursing_programs_history.vue') },
      { path: 'user_management', name: 'User_management', meta: { name: '用户管理' }, component: () => import('../views/manager/cent/User_management.vue') },
      { path: 'service_Concern', name: 'Service_Concern', meta: { name: '服务关注' }, component: () => import('../views/manager/cent/healthy/Service_Concern.vue') },
      { path: 'assign_caregiver', name: 'Assign_caregiver', meta: { name: '为老人分配护工' }, component: () => import('../views/manager/cent/healthy/Assign_caregiver.vue') },
      { path: 'financial_management', name: 'Financial_management', meta: { name: '财务管理' }, component: () => import('../views/manager/cent/Financial_management.vue') },
      { path: 'administrator_information', name: 'Administrator_information', meta: { name: '管理员信息' }, component: () => import('../views/manager/cent/Administrator_information.vue') },
      {
        path: 'diagnosis',
        name: 'Diagnosis',
        meta: { name: '医生诊疗' },
        component: () => import('../views/manager/doctors_work/Diagnosis.vue') ,
        children: [
          { path: 'diagnosis-MedicalRecord', name: 'Diagnosis-MedicalRecord', meta: { name: '病案首页' }, component: () => import('../views/manager/doctors_work/Diagnosis-MedicalRecord.vue') },
          { path: 'diagnosis-Check-The-Application', name: 'Diagnosis-Check-The-Application', meta: { name: '检查申请' }, component: () => import('../views/manager/doctors_work/Diagnosis-Check-The-Application.vue') },
          { path: 'diagnosis-Check-The-Results', name: 'Diagnosis-Check-The-Results', meta: { name: '检查结果' }, component: () => import('../views/manager/doctors_work/Diagnosis-Check-The-Results.vue') },
        ]
      },
    ]
  },
  {
    path: '/front',
    name: 'Front',
    component: () => import('../views/Front.vue'),
    children: [
      { path: 'home', name: 'Home', meta: { name: '系统首页' }, component: () => import('../views/front/Home') },
      { path: 'person', name: 'Person', meta: { name: '个人信息' }, component: () => import('../views/front/Person') },
    ]
  },
  { path: '/login', name: 'Login', meta: { name: '登录' }, component: () => import('../views/Login.vue') },
  { path: '/register', name: 'Register', meta: { name: '注册' }, component: () => import('../views/Register.vue') },
  { path: '*', name: 'NotFound', meta: { name: '无法访问' }, component: () => import('../views/404.vue') },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
