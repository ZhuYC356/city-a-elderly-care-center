<template>
  <div class="manager-container">
    <!--  头部  -->
    <div class="manager-header">
      <div class="manager-header-left">
        <img src="@/assets/imgs/img.png"/>
        <div class="title">东软云医院</div>
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
            <img :src="'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'"/>
            <div>{{ user.realname || '管理员' }}</div>
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
        <el-menu :default-openeds="['register', 'work']" router style="border: none" :default-active="$route.path">
          <el-menu-item index="/home">
            <i class="el-icon-s-home"></i>
            <span slot="title">系统首页</span>
          </el-menu-item>
          <el-submenu index="register">
            <template slot="title">
              <i class="el-icon-menu"></i><span>挂号收费</span>
            </template>
            <el-menu-item index="/registered">窗口挂号</el-menu-item>
            <el-menu-item index="/refundNumber">窗口退号</el-menu-item>
            <el-menu-item index="/toll">收费</el-menu-item>
            <el-menu-item index="/refunds">退费</el-menu-item>
            <el-menu-item index="/queryExpenseRecor">退费费用记录查询</el-menu-item>
          </el-submenu>

          <el-submenu index="work">
            <template slot="title">
              <i class="el-icon-menu"></i><span>医生工作</span>
            </template>
            <el-menu-item index="/patientViewing">患者查看</el-menu-item>
            <el-menu-item index="/diagnosis">医生诊疗</el-menu-item>
            <el-menu-item index="/7">看诊记录</el-menu-item>
          </el-submenu>
          <el-submenu index="examine">
            <template slot="title">
              <i class="el-icon-menu"></i><span>检查管理</span>
            </template>
            <el-menu-item index="/9">检查申请</el-menu-item>
            <el-menu-item index="/00">患者录入</el-menu-item>
            <el-menu-item index="/99">检查录入</el-menu-item>
            <el-menu-item index="/88">检查管理</el-menu-item>
          </el-submenu>
          <el-submenu index="inspection">
            <template slot="title">
              <i class="el-icon-menu"></i><span>检验管理</span>
            </template>
            <el-menu-item index="/11">检验申请</el-menu-item>
            <el-menu-item index="/22">患者录入</el-menu-item>
            <el-menu-item index="/44">检验录入</el-menu-item>
            <el-menu-item index="/33">检验管理</el-menu-item>
          </el-submenu>
          <el-submenu index="pharmacy">
            <template slot="title">
              <i class="el-icon-menu"></i><span>药房管理</span>
            </template>
            <el-menu-item index="/55">药房发药</el-menu-item>
            <el-menu-item index="/77">药房退药</el-menu-item>
            <el-menu-item index="/66">药库管理</el-menu-item>
            <el-menu-item index="/88">发退药记录管理</el-menu-item>
          </el-submenu>
          <el-submenu index="dispose">
            <template slot="title">
              <i class="el-icon-menu"></i><span>处置管理</span>
            </template>
            <el-menu-item index="/999">处置管理</el-menu-item>
            <el-menu-item index="/111">患者录入</el-menu-item>
            <el-menu-item index="/222">处置录入</el-menu-item>
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