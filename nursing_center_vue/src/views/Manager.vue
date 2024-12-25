<template>
  <div class="manager-container">
    <!--  头部  -->
    <div class="manager-header">
      <div class="manager-header-left">
        <img src="@/assets/imgs/img.png"/>
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
<!--            <img src="@/assets/imgs/tou.jpg" alt="">-->
<!--            <img :src="'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'"/>-->
            <div>{{ '管理员' }}</div>
          </div>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item @click.native="goToPerson">个人信息</el-dropdown-item>
            <el-dropdown-item @click.native="$router.push('/password')">修改密码</el-dropdown-item>
            <el-dropdown-item @click.native="logout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>

    <!--  主体  -->
    <div class="manager-main">
      <!--  侧边栏  -->
      <div class="manager-main-left">
        <el-menu :default-openeds="['register', 'work','examine','inspection','pharmacy']" router style="border: none" :default-active="$route.path">
          <el-menu-item index="/home">
            <i class="el-icon-s-home"></i>
            <span slot="title">系统首页</span>
          </el-menu-item>
          <el-submenu index="register">
            <template slot="title">
              <i class="el-icon-menu"></i><span>客户管理</span>
            </template>
            <el-menu-item index="/check_in">居住信息管理</el-menu-item>
            <el-menu-item index="/check_out_registration">退住审核</el-menu-item>
            <el-menu-item index="/out_office_registration">外出审核</el-menu-item>
          </el-submenu>

          <el-submenu index="work">
            <template slot="title">
              <i class="el-icon-menu"></i><span>床位管理</span>
            </template>
            <el-menu-item index="/bunk">床位示意图</el-menu-item>
            <el-menu-item index="/bunk_manager">床位管理</el-menu-item>
          </el-submenu>
          <el-submenu index="examine">
            <template slot="title">
              <i class="el-icon-menu"></i><span>护理模块</span>
            </template>
            <el-menu-item index="/Nursing_programs_Manager">护理项目</el-menu-item>
            <el-menu-item index="/nursing_programs_history">护理记录</el-menu-item>
            <el-menu-item index="/Set_Elderly_Care_Programs">设置老人护理项目</el-menu-item>
          </el-submenu>
          <el-submenu index="inspection">
            <template slot="title">
              <i class="el-icon-menu"></i><span>健康管家</span>
            </template>
            <el-menu-item index="/11">设置服务对象</el-menu-item>
            <el-menu-item index="/22">服务关注</el-menu-item>
            <el-menu-item index="/44">日常护理</el-menu-item>
          </el-submenu>
          <el-submenu index="pharmacy">
            <template slot="title">
              <i class="el-icon-menu"></i><span>财务管理</span>
            </template>
            <el-menu-item index="/55">财务账单</el-menu-item>
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
    this.user = JSON.parse(localStorage.getItem('user'))
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