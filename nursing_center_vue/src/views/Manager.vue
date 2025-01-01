<template>
  <div class="manager-container">
    <!--  头部  -->
    <div class="manager-header">
      <div class="manager-header-left">
        <!--        <img src="@/assets/imgs/img.png"/>-->
        <img style="height: 50px;width: 50px" src="@/assets/imgs/1.png"/>
        <div class="title">A市疗养中心</div>
      </div>
      <div class="manager-header-center">
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item :to="{ path: $route.path }">{{ $route.meta.name }}</el-breadcrumb-item>
        </el-breadcrumb>
      </div>

      <div class="manager-header-right">
        <el-dropdown placement="bottom">
          <div class="avatar">
            <img :src="user.avatar ||'@/assets/imgs/tou.jpg'" alt="">
            <div>{{ user.name || '管理员' }}</div>
          </div>
          <el-dropdown-menu slot="dropdown">
            <!--            <el-dropdown-item @click.native="goToPerson">个人信息</el-dropdown-item>-->
            <!--            <el-dropdown-item @click.native="$router.push('/password')">修改密码</el-dropdown-item>-->
            <el-dropdown-item @click.native="logout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>

    <!--  主体  -->
    <div class="manager-main">
      <!--  侧边栏  -->
      <div class="manager-main-left">
        <!--        :default-openeds="['register', 'work','examine','inspection','pharmacy']"-->
        <el-menu router style="border: none" :default-active="$route.path">
          <el-menu-item index="/home">
            <i class="el-icon-s-home"></i>
            <span slot="title">系统首页</span>
          </el-menu-item>
          <el-submenu index="register">
            <template slot="title">
              <i class="el-icon-user-solid"></i><span>客户管理</span>
            </template>
            <el-menu-item index="/check_in">居住信息管理</el-menu-item>
            <el-menu-item index="/check_out_registration">退住审核</el-menu-item>
            <el-menu-item index="/out_office_registration">外出审核</el-menu-item>
          </el-submenu>

          <el-submenu index="work">
            <template slot="title">
              <i class="el-icon-office-building"></i><span>床位管理</span>
            </template>
            <el-menu-item index="/bunk">床位示意图</el-menu-item>
            <el-menu-item index="/bunk_manager">床位管理</el-menu-item>
          </el-submenu>
          <el-submenu index="examine">
            <template slot="title">
              <i class="el-icon-first-aid-kit"></i><span>护理模块</span>
            </template>
            <el-menu-item index="/Nursing_programs_Manager">护理项目</el-menu-item>
            <el-menu-item index="/nursing_programs_history">护理记录</el-menu-item>
          </el-submenu>
          <el-submenu index="inspection">
            <template slot="title">
              <i class="el-icon-first-aid-kit"></i><span>健康管理</span>
            </template>
            <el-menu-item index="/assign_caregiver">设置服务对象</el-menu-item>
            <el-menu-item index="/service_Concern">服务关注</el-menu-item>
          </el-submenu>
          <el-submenu index="pharmacy">
            <template slot="title">
              <i class="el-icon-menu"></i><span>财务管理</span>
            </template>
            <el-menu-item index="/Financial_management">财务账单</el-menu-item>
          </el-submenu>
          <el-submenu index="user">
            <template slot="title">
              <i class="el-icon-s-custom"></i><span>用户管理</span>
            </template>
            <el-menu-item index="/User_management">护工信息</el-menu-item>
            <el-menu-item index="/administrator_information">管理员信息</el-menu-item>
          </el-submenu>
        </el-menu>
      </div>

      <!--  数据表格  -->
      <div class="manager-main-right">
        <home></home>
        <router-view></router-view>
      </div>
    </div>

  </div>
</template>

<script>
import home from "@/views/manager/Home.vue";

export default {
  data() {
    return {
      user: {}
    }
  },
  created() {
    this.user = JSON.parse(localStorage.getItem('nursing_center_user'))
    if (this.user===null){
      this.$router.push('/login')
    }
  },
  methods: {
    updateUser() {
    },
    goToPerson() {
    },
    logout() {
      this.$router.push('/login')
    },
    components: {
      home
    }
  }
}
</script>

<style scoped>
@import "@/assets/css/manager.css";
</style>