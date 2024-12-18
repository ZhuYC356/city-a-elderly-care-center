<template xmlns="http://www.w3.org/1999/html">
  <div>
    <el-card>
      <h2>收费</h2>
      <br>
      <hr>
      <br>
      <Clock/>
      <br>
    </el-card>
    <el-card style="margin-top: 10px">
      <span style="font-size: 17px">患者选择</span>
      <div style="margin-top: 10px">
        <el-form :inline="true" :model="patient" class="demo-form-inline">
          <el-form-item label="病历号:">
            <el-input v-model="patient.caseNumber" placeholder="病历号" clearable/>
          </el-form-item>
          <el-form-item label="身份证号:">
            <el-input v-model="patient.cardNumber" placeholder="身份证号" clearable/>
          </el-form-item>
          <el-button type="primary" @click="exactSelect">查询</el-button>
          <el-button type="primary" @click="reset">重置</el-button>
        </el-form>
      </div>
      <!--展示出所选择的挂号信息-->
      <span style="font-size: 17px">所选择的患者信息</span>
      <div style="margin-top: 10px">
        <el-table
            :data="patientList"
            style="width: 100%"
        >
          <el-table-column label="病历号" width="180">
            <template #default="scope">
              <div style="display: flex; align-items: center">
                <el-icon>
                  <timer/>
                </el-icon>
                <span style="margin-left: 10px">{{ scope.row.caseNumber }}</span>
              </div>
            </template>
          </el-table-column>

          <el-table-column label="姓名" width="180">
            <template #default="scope">
              <el-popover effect="light" trigger="hover" placement="top" width="auto">
                <template #default>
                  <div>身份证号: {{ scope.row.cardNumber }}</div>
                  <div>住址: {{ scope.row.address }}</div>
                  <div>年龄: {{ scope.row.age }}</div>
                </template>
                <template #reference>
                  <el-tag>{{ scope.row.realName }}</el-tag>
                </template>
              </el-popover>
            </template>
          </el-table-column>

          <el-table-column label="挂号科室" width="180">
            <template #default="scope">
              <div style="display: flex; align-items: center">
                <el-icon>
                  <timer/>
                </el-icon>
                <span style="margin-left: 10px">{{ scope.row.caseNumber }}</span>
              </div>
            </template>
          </el-table-column>
          <el-table-column label="状态" width="180">
            <template #default="scope">
              <div style="display: flex; align-items: center">
                <el-icon>
                  <timer/>
                </el-icon>
                <span v-if="scope.row.visitState === '1'" style="margin-left: 10px">未看诊</span>
                <span v-if="scope.row.visitState === '2'" style="margin-left: 10px">医生接诊</span>
                <span v-if="scope.row.visitState === '3'" style="margin-left: 10px">看诊完毕</span>
                <span v-if="scope.row.visitState === '4'" style="margin-left: 10px">退号</span>
              </div>
            </template>
          </el-table-column>
          <el-table-column align="right">
            <template #header>
            </template>
            <template #default="scope">
              <el-button size="small" @click="selectPriceList(scope.$index, scope.row)">
                交费
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </el-card>
    <!--    下半部分-->
    <el-card style="margin-top: 10px">
      <el-tag type="success" style="font-size: 20px;width: 500px;height: 30px;margin-top: 10px">

      <h5 style="margin-top: 5px">
        患者账单合计金额：
        {{ form.sumMoney }}元
      </h5>

    </el-tag>
    <br>
      <el-button type="primary" @click="pay">
        支付
      </el-button>
      <el-table
          :data="priceList"
          style="width: 100%;margin-top: 10px"
      >
        <el-table-column label="项目" width="180">
          <template #default="scope">
            <div style="display: flex; align-items: center">
              <el-icon>
                <timer/>
              </el-icon>
              <span style="margin-left: 10px">{{ scope.row.caseNumber }}</span>
            </div>
          </template>
        </el-table-column>

        <el-table-column label="单价" width="180">
          <template #default="scope">
            <el-popover effect="light" trigger="hover" placement="top" width="auto">
              <template #default>
                <div>身份证号: {{ scope.row.cardNumber }}</div>
              </template>
              <template #reference>
                <el-tag>{{ scope.row.realName }}</el-tag>
              </template>
            </el-popover>
          </template>
        </el-table-column>

        <el-table-column label="数量" width="180">
          <template #default="scope">
            <div style="display: flex; align-items: center">
              <el-icon>
                <timer/>
              </el-icon>
              <span style="margin-left: 10px">{{ scope.row.caseNumber }}</span>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="开设时间" width="180">
          <template #default="scope">
            <div style="display: flex; align-items: center">
              <el-icon>
                <timer/>
              </el-icon>
              <span style="margin-left: 10px">{{ scope.row.caseNumber }}</span>
            </div>
          </template>
        </el-table-column>
        <el-table-column align="right">
          <template #header>

          </template>
          <template #default="scope">

          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>
<script>
import Clock from "../../components/Clock";

export default {
  name: "收费",
  data() {
    return {
      form:{
        sumMoney: 0.00
      },
      patient: {
        caseNumber: '',
        realName: '',
        gender: '',
        cardNumber: '',
        deptmentId: '',
        employeeId: '',
        registerLevelId: '',
        settleCategoryId: '',
        isBook: false,
        registerMethod: '',
        registerMoney: '',
        number: '',
        initialAmount: '',
        usedAmount: '',
        receivableAmount: '',
        visitState: ''
      },
      payPatient: {
        caseNumber: '',
      },
      patientList: [],
      priceList: [],
    }
  },
  methods: {
    reset() {

    },
    exactSelect() {
      // 根据病历号或者身份证号进行查询病人信息
      if (this.patient.caseNumber !== '') {
        this.$request.post('/register/selectByCaseNumber', this.patient).then(res => {
          if (res.code === '200') {
            this.patientList = res.data
            this.$message.success('查询成功')
          } else {
            this.$message.error(res.msg)
          }
        })
      } else if (this.patient.cardNumber !== '') {
        this.$request.post('/register/selectByCardNumber', this.patient).then(res => {
          if (res.code === '200') {
            this.patientList = res.data
            this.$message.success('查询成功')
          } else {
            this.$message.error(res.msg)
          }
        })
      } else {
        this.$message.error('请输入病历号或者身份证号')
      }
    },
    pay() {
      // 当选择完之后，再进行收费
      // this.$request.post('/register/pay', this.payPatient).then(res => {
      //   if (res.code === '200') {
      //     this.$message.success('收费成功')
      //   } else {
      //     this.$message.error(res.msg)
      //   }
      // })
    },
    selectPriceList(index, row) {
      // 当点击收费的时候，就进行展示该病人都用了的项目
      // this.$request.post('/pay/selectPriceList', row).then(res => {
      //   if (res.code === '200') {
      //     this.priceList = res.data
      //     this.payPatient.caseNumber = row.caseNumber
      //     this.$message.success('查询成功')
      //   } else {
      //     this.$message.error(res.msg)
      //   }
      // })
    },
    handleDelete() {
      alert("删除")
    }
  },
  created() {
  },
  components: {
    Clock
  }
}
</script>
<style scoped>

</style>