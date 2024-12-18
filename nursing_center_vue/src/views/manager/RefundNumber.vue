<template xmlns="http://www.w3.org/1999/html">
  <div>
    <el-card>
      <h2>现场退号</h2>
      <br>
      <hr>
      <br>
      <Clock/>
      <br>
    </el-card>
    <el-card style="margin-top: 10px">
      <span style="font-size: 17px">精准查询</span>
      <div style="margin-top: 10px">
        <el-form :inline="true" :model="formInline" class="demo-form-inline">
          <el-form-item label="病历号:">
            <el-input v-model="formInline.caseNumber" placeholder="病历号" clearable/>
          </el-form-item>
          <el-form-item label="身份证号:">
            <el-input v-model="formInline.cardNumber" placeholder="身份证号" clearable/>
          </el-form-item>
          <el-button type="primary" @click="exactSelect">精准查询</el-button>
          <el-button type="primary" @click="reset">重置</el-button>
        </el-form>
      </div>
      <span style="font-size: 17px">模糊查询</span>

      <div style="margin-top: 10px">
        <el-form :inline="true" :model="formInline" class="demo-form-inline">
          <el-form-item label="姓名:">
            <el-input v-model="formInline.realName" placeholder="姓名：" clearable/>
          </el-form-item>
          <el-form-item label="年龄:">
            <el-input v-model="formInline.age" placeholder="年龄：" clearable/>
          </el-form-item>
          <el-button type="primary" @click="bulkSelect">模糊查询</el-button>
        </el-form>
      </div>
    </el-card>
    <el-card style="margin-top: 10px">
      <el-table
          :data="registerList"
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
            <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
              编辑
            </el-button>
            <el-button
                size="small"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)"
            >
              退号
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>
<script>
import Clock from "../../components/Clock";

export default {
  name: "退号",
  data() {
    return {
      formInline: {
        caseNumber: '',
        realName: '',
        gender: '',
        cardNumber: '',
        birthDate: '',
        age: '',
        address: '',
        visitDate: '',
        noon: '',
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
      registerList: []
    }
  },
  methods: {
    reset() {
      this.$router.go(0)
    },
    exactSelect() {
      if (this.formInline.cardNumber !== '') {
        this.$request.post('/register/selectByCardNumber', this.formInline).then(res => {
          if (res.code === '200') {
            this.registerList = res.data
            this.$message.success('查询成功')
          } else {
            this.$message.error(res.msg)
          }
        })
      } else if (this.formInline.caseNumber !== '') {
        this.$request.post('/register/selectByCaseNumber', this.formInline).then(res => {
          if (res.code === '200') {
            this.registerList = res.data
            this.$message.success('查询成功')
          } else {
            this.$message.error(res.msg)
          }
        })
      } else {
        this.$message.error('请输入身份证号或病历号')
      }
    },
    bulkSelect() {
      if (this.formInline.age !== '') {
        this.$request.post('/register/selectByAge', this.formInline).then(res => {
          if (res.code === '200') {
            this.registerList = res.data
            this.$message.success('查询成功')
          } else {
            this.$message.error(res.msg)
          }
        })
      } else if (this.formInline.realName !== '') {
        this.$request.post('/register/selectByRealName', this.formInline).then(res => {
          if (res.code === '200') {
            this.registerList = res.data
            this.$message.success('查询成功')
          } else {
            this.$message.error(res.msg)
          }
        })
      } else {
        this.$message.error('请输入姓名或者年龄')
      }

    },
    handleEdit() {
      alert("编辑")
    },
    handleDelete(index, row) {
      this.$confirm('您确定退号吗？', '确认退号', {type: "warning"}).then(response => {
        this.$request.delete('/register/delete/' + row.id).then(res => {
          if (res.code === '200') {   // 表示操作成功
            this.$message.success('退号成功！')
            this.$router.go(0)
          } else {
            this.$message.error(res.msg)  // 弹出错误的信息
          }
        })
      }).catch(() => {
        this.$message.info('已取消')
      })
    }
  },
  created() {
    this.$request.get('/register/getAll').then(res => {
      if (res.code === '200') {
        this.registerList = res.data
        console.log(res.data)
      } else {
        this.$message.error(res.msg)
      }
    })
  },
  components: {
    Clock
  }
}
</script>
<style scoped>

</style>