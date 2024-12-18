<template>
  <div>
    <el-card>
      <h2>现场挂号</h2>
      <br>
      <hr>
      <br>
      <Clock/>
      <br>
      <!--      <h3 style="margin-bottom: 10px">你好! {{ employee.realName || "医生"}} 你当前已用号额: {{ formInline.usedAmount }}个</h3>-->
      <div style="margin-top: 10px">
        <el-button type="primary" @click="add">挂号</el-button>
        <el-button type="info" @click="reset">重置</el-button>
      </div>

    </el-card>
    <el-card style="margin-top: 10px">
      <div slot="header" class="clearfix">
        <span style="font-size: 17px">基本信息</span>
      </div>
      <el-form :inline="true" :model="formInline" class="demo-form-inline">
<!--        <el-form-item label="病历号:">-->
<!--          <el-input v-model="formInline.caseNumber" placeholder="病历号" clearable/>-->
<!--        </el-form-item>-->

        <el-form-item label="姓名:">
          <el-input v-model="formInline.realName" placeholder="姓名" clearable/>
        </el-form-item>

        <el-form-item label="性别:">
          <el-select
              v-model="formInline.gender"
              placeholder="性别"
              clearable
          >
            <el-option label="男" value="男"/>
            <el-option label="女" value="女"/>
          </el-select>
        </el-form-item>
        <el-form-item label="出生日期:">
          <el-date-picker
              v-model="formInline.birthdate"
              type="date"
              placeholder="出生日期"
              clearable
          />
        </el-form-item>
        <el-form-item label="家庭住址:">
          <el-input v-model="formInline.homeAddress" placeholder="家庭住址" clearable/>
        </el-form-item>
        <el-form-item label="身份证号:">
          <el-input v-model="formInline.cardNumber" placeholder="身份证号" clearable/>
        </el-form-item>
      </el-form>
    </el-card>
    <el-card style="margin-top: 10px">
      <div slot="header" class="clearfix">
        <span style="font-size: 17px">挂号信息</span>
      </div>
      <el-form :inline="true" :model="formInline" class="demo-form-inline">

        <el-form-item label="结算类型:">
          <el-select
              v-model="formInline.settleCategoryId"
              placeholder="医保或者自费"
              clearable
          >
            <el-option label="自费" value="0"/>
            <el-option label="医保" value="1"/>
          </el-select>
        </el-form-item>
        <el-form-item label="看诊日期:">
          <el-date-picker
              v-model="formInline.visitDate"
              type="date"
              placeholder="选择看诊日期"
              clearable
          />
        </el-form-item>
        <el-form-item label="午别:">
          <el-select
              v-model="formInline.noon"
              placeholder="00:00-12.00 上午 12.01-23.59 下午"
              clearable
          >
            <el-option label="上午" value="0"/>
            <el-option label="下午" value="1"/>
          </el-select>
        </el-form-item>
        <el-form-item label="挂号科室:">
          <el-select
              v-model="formInline.deptmentId"
              placeholder="挂号科室"
              clearable
          >
            <el-option v-for="item in deptmentList" :key="item.id" :label="item.deptName"
                       :value="item.id"/>
          </el-select>
        </el-form-item>
        <el-form-item label="号别:">
          <el-select
              v-model="formInline.number"
              placeholder="号别"
              clearable
          >
            <el-option label="1" value="1"/>
            <el-option label="2" value="2"/>
            <el-option label="2" value="2"/>
          </el-select>
        </el-form-item>
        <el-form-item label="看诊医生:">
          <el-select
              v-model="formInline.employeeId"
              placeholder="看诊医生"
              clearable
          >
            <el-option v-for="item in employeeList" :key="item.id" :label="item.realname"
                       :value="item.id"/>
          </el-select>
        </el-form-item>
        <el-form-item label="应收金额:">
          <el-input v-model="formInline.registerMoney" placeholder="应收金额" clearable/>
        </el-form-item>
        <br>
        <el-form-item label="是否需要病历本？" prop="sing">
          <el-switch v-model="formInline.isBook"/>
        </el-form-item>
        <el-form-item label="结算方式:" v-if="formInline.settleCategoryId==='0'">
          <el-select
              v-model="formInline.registerMethod"
              placeholder="选择结算类型"
              clearable
          >
            <el-option label="现金" value="1"/>
            <el-option label="微信" value="2"/>
            <el-option label="支付宝" value="3"/>
          </el-select>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>
<script>
import Clock from "../../components/Clock";

export default {
  name: "Registered",
  data() {
    return {
      rules: {
        caseNumber: [
          {required: true, message: '病历号不能为空', trigger: 'blur'}
        ],
      },
      employee: {
        employeeId: '',
        realName: '',
      },
      formInline: {
        // 病历号
        caseNumber: '',

        // 真实姓名
        realName: '',

        // 性别
        gender: '',

        // 身份证号
        cardNumber: '',

        // 出生日期
        birthdate: '',

        // 年龄
        age: '',

        // 家庭住址
        homeAddress: '',

        // 就诊日期
        visitDate: '',

        // 午别
        noon: '',

        // 挂号科室id
        deptmentId: '',

        // 看诊医生
        employeeId: '',

        // 挂号级别
        registerLevelId: '0',

        // 结算类型
        settleCategoryId: '',

        // 是否需要病历本
        isBook: false,

        // 收费方式
        registerMethod: '',

        // 挂号金额
        registerMoney: '',

        // 号别
        number: '',

        // // 初始金额
        // initialAmount: '',

        // 已用号额
        usedAmount: 10,


        // 挂号状态
        visitState: 1,
      },
      deptmentList: [],
      employeeList: [],
    };
  },
  methods: {
    reset() {
      this.formInline.caseNumber = ''
      this.formInline.realName = ''
      this.formInline.gender = ''
      this.formInline.cardNumber = ''
      this.formInline.birthDate = ''
      this.formInline.age = ''
      this.formInline.address = ''
      this.formInline.visitDate = ''
      this.formInline.noon = ''
      this.formInline.deptmentId = ''
      this.formInline.employeeId = ''
      this.formInline.registerLevelId = ''
      this.formInline.settleCategoryId = ''
      this.formInline.isBook = false
      this.formInline.registerMethod = ''
      this.formInline.registerMoney = ''
      this.formInline.number = ''
      this.formInline.initialAmount = ''
      this.formInline.usedAmount = ''
      this.formInline.receivableAmount = ''
      this.formInline.visitState = ''
    },
    judgement() {
      if (this.formInline.birthdate === '') {
        this.$message.error('请输入出生日期')
        return false
      }
      return true
    },
    add() {
      // 计算年龄
      if (!this.judgement()) {
        return
      }
      this.formInline.age = new Date().getFullYear() - this.formInline.birthdate.getFullYear()
      // this.formInline.age = new Date().getFullYear() - this.formInline.birthdate.getFullYear()
      if (this.formInline.isBook) {
        this.formInline.isBook = 1
      } else {
        this.formInline.isBook = 0
      }
      // 判断是否满足条件

      //   发送请求
      this.$request.post('/register/add', this.formInline).then(res => {
        if (res.code === '200') {
          this.$message.success('挂号成功')
          // this.reset()
        } else {
          this.$message.error(res.msg)
        }
      })
    },
  },
  created() {
    this.$request.get('/department/getAll', {}).then(res => {
      this.deptmentList = res.data
      console.log(res.data)
    })
    this.$request.get('/employee/getAll', {}).then(res => {
      this.employeeList = res.data
      console.log(res.data)
    })
  },
  components: {
    Clock,
  }
};
</script>
<style scoped>

</style>