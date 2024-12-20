<script setup>
import {reactive, ref,onMounted} from 'vue'
import request from "@/utils/request";
const form = reactive({
  name: '',
  bedNumber: '',
  date: ''
})
const addForm = reactive({
  name: '',
  bedNumber: '',
  date: '',
  gender: '',
})
const onSubmit = () => {
  alert('提交')
}
const clearAll = () => {
  form.name = ''
  form.bedNumber = ''
  form.date = ''
}
const tableData = ref("")
// 获取数据
const getData = () => {
  request.get("check-out-requests/list").then(res => {
    console.log(res)
    tableData.value=res
  })

}
onMounted(() => {
  getData()
})
const handleClick = () => {
  alert('点击了详情')
}
const update = () => {
  alert('点击了修改')
}
const currentPage4 = ref(5)
const pageSize4 = ref(100)
const size = ref('large')
const background = ref(true)
const disabled = ref(false)
const handleSizeChange = () => {
  console.log();
}
const handleCurrentChange = () => {
  console.log();
}
const drawer = ref(false)
const toggle = () => {
  drawer.value = !drawer.value
}
const submit=() => {
  alert('提交')
}
</script>

<template>
  <div>
    <el-card style="height: 630px">
      <div>
        <hr style="margin: 10px">
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>
        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">退住登记审核</span>
        <hr style="margin: 10px">
      </div>
      <div style="margin-top: 15px;margin-left: 10px">
        <el-form :inline="true" :model="form">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.name" placeholder="请填写老人姓名" clearable>
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 15px">
            <el-button type="primary" @click="onSubmit"><span style="font-weight: bolder">搜 索</span></el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="danger" @click="clearAll"><span style="font-weight: bolder">清 空</span></el-button>
          </el-form-item>
        </el-form>
      </div>
      <div>
        <el-button type="primary" style="margin-left: 10px" @click="toggle"><span
            style="font-weight: bolder">生成审批信息报告</span></el-button>
        <el-drawer title="I am the title" :with-header="false" :visible.sync="drawer">
          <div style="margin: 15px">
            <span style="font-weight: bolder;font-size: 15px">添加床位</span>
            <el-form :model="addForm" label-width="auto" style="max-width: 600px">
              <el-form-item label="姓名" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-user" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>

              <el-form-item label="性别" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-toilet-paper" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>
              <el-form-item style="margin-right: 20px;" label="出生日期">
                <el-date-picker
                    v-model="form.date"
                    type="date"
                    placeholder="请选择入住日期"
                    clearable
                    style="width: 300px"
                />
              </el-form-item>
              <el-form-item label="监护人电话" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-phone" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>
              <el-form-item label="楼号" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-s-home" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>
              <el-form-item label="房间号" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-film" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>
              <el-form-item label="床位号" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>
              <el-button link type="success" size="small" @click="submit" style="margin-left: 20px">
                <span style="font-weight: bolder">提 交</span>
              </el-button>
            </el-form>
          </div>
          <div>



          </div>
        </el-drawer>
      </div>
      <div style="margin-top: 5px">
        <el-table :data="tableData" style="width: 100%;" height="390" :stripe="true"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}">
          <el-table-column type="selection" width="55"/>
          <el-table-column property="elderlyId" label="ID" width="80"/>
          <el-table-column property="name" label="姓名" width="120"/>
<!--          <el-table-column label="出生日期" width="120">
            <template #default="scope">{{ scope.row.date }}</template>
          </el-table-column>-->
          <el-table-column property="checkOutDate" label="退住日期" width="120"/>
<!--          <el-table-column property="roomNumber" label="房间号" width="80"/>-->
          <el-table-column property="bedId" label="床位号" width="80"/>
          <el-table-column property="checkoutType" label="退住类型" width="120"/>
          <el-table-column property="checkoutType" label="审核状态" width="120"/>
          <el-table-column property="approvalPerson" label="审批人" width="120"/>
          <el-table-column property="approvalTime" label="审批时间" width="120"/>
          <el-table-column fixed="right" label="Operations" min-width="120">
            <template #default>
              <el-button link type="success" size="small" @click="handleClick">
                <span style="font-weight: bolder">同意申请</span>
              </el-button>
              <el-button link type="primary" size="small" @click="update"><span style="font-weight: bolder">撤销申请</span>
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <div style="margin-top: 10px">
          <el-pagination
              v-model:current-page="currentPage4"
              v-model:page-size="pageSize4"
              :page-sizes="[100, 200, 300, 400]"
              :size="size"
              :disabled="disabled"
              :background="background"
              layout="total, sizes, prev, pager, next, jumper"
              :total="400"
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
          />
        </div>
      </div>
    </el-card>
  </div>
</template>



<style scoped>

</style>