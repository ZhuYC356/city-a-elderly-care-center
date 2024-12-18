<template>
  <div class="container">
    <div style="width: 400px; padding: 30px; background-color: white; border-radius: 5px;">
      <div style="text-align: center; font-size: 20px; margin-bottom: 20px; color: #333">欢迎使用东软云医院</div>
      <el-form :model="form" ref="formRef">
        <el-form-item prop="realname">
          <el-input prefix-icon="el-icon-user" placeholder="请输入账号" v-model="form.realname"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input prefix-icon="el-icon-lock" placeholder="请输入密码" show-password
                    v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button style="width: 100%; background-color: #333; border-color: #333; color: white" @click="login">
            登录
          </el-button>
        </el-form-item>
        <div style="display: flex; align-items: center">
          <div style="flex: 1"></div>
          <div style="flex: 1; text-align: right">
            还没有账号？请 <a href="/register">注册</a>
          </div>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      form: {
        realname: '111',
        password: '111'
      },
      list: [
        {
          username: '111',
          password: '111'
        },
        {
          username: '222',
          password: '222'
        }
      ],
    }
  },
  created() {

  },
  methods: {
    login() {
      this.$request.post('/web/login', this.form).then(res => {
        if (res.code === '200') {
          this.$message.success('登录成功,正在跳转')
          this.$router.push('/')  // 跳转主页
          localStorage.setItem('user', JSON.stringify(res.data));
        } else {
          this.$message.error(res.msg)
        }
      })

    }
  }
}
</script>

<style scoped>
.container {
  height: 100vh;
  overflow: hidden;
  background-image: url("@/assets/imgs/bg2.jpg");
  background-size: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
}

a {
  color: #2a60c9;
}
</style>