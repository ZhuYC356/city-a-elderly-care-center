<template>
  <div>
    <el-card>
      <h2>患者查看</h2>
      <br>
      <hr>
      <br>
      <Clock/>
    </el-card>
    <el-card style="margin-top: 10px">
      <div slot="header" class="clearfix" style="width: 100%">
        <el-card shadow="never">{{ employee.realname }}医生,您今日已接诊人数: {{ patientNum }}人</el-card>
        <el-card style="margin-top: 10px" shadow="never">{{ employee.realname }}医生,您今日未诊疗人数: {{
            noPatientNum
          }}人
        </el-card>
      </div>
      <div>
      </div>
    </el-card>
    <el-card style="margin-top: 10px">

      <el-table :data="patientTable" style="width: 100%">
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
                <div>年龄: {{ scope.row.age }}</div>
                <div>住址: {{ scope.row.homeAddress }}</div>
              </template>
              <template #reference>
                <el-tag>{{ scope.row.realName }}</el-tag>
              </template>
            </el-popover>
          </template>
        </el-table-column>

        <el-table-column label="身份证号" width="180">
          <template #default="scope">
            <div style="display: flex; align-items: center">
              <el-icon>
                <timer/>
              </el-icon>
              <span style="margin-left: 10px">{{ scope.row.cardNumber }}</span>
            </div>
          </template>
        </el-table-column>

        <el-table-column label="操作">
          <template #default="scope">
            <el-button size="small" @click="info(scope.$index, scope.row)">
              查看详情
            </el-button>
            <el-button
                size="small"
                type="danger"
                @click="select(scope.$index, scope.row)"
            >
              叫号
            </el-button>
          </template>
        </el-table-column>

      </el-table>
    </el-card>
    <Foot/>
  </div>
</template>
<script>
import Clock from "@/components/Clock.vue";

export default {
  name: "叫号页面",
  components: {
    Clock
  },
  methods: {
    onSubmit() {
      console.log('submit!');
    },
    info(index, row) {
      // 传回的是索引和数据
      console.log(row)
      alert(index, row.name)
    },
    select(index, row) {
      alert("叫号：" + index, row)
      localStorage.setItem('patient', JSON.stringify(row));
      this.$request.post('/register/updateStatus', row).then(res => {
        console.log("病人看诊状态更新成功")
      })
      this.$router.push('/diagnosis')
    },
    add() {
      alert("新增")
    },
  },
  created() {
    this.employee = JSON.parse(localStorage.getItem('user'))
    console.log(this.employee)
    this.$request.post('/register/getPatientList', this.employee).then(res => {
      if (res.code === '200') {
        console.log(res.data)
        this.patientTable = res.data
        this.noPatientNum = res.data.length
      } else {
        this.$message.error(res.msg)
      }
    })
  },
  data() {
    return {
      employee: {},
      patientNum: 12,
      noPatientNum: 12,
      patientTable: [],
    }
  },
}
</script>
<style scoped>

</style>