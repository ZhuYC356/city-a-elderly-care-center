<template>
  <div class="card">
    <div>
      <hr style="margin: 10px">
      <el-icon>
        <Notebook/>
      </el-icon>
      <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>
      <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">服务关注</span>
      <hr style="margin: 10px">
    </div>



    <el-row :gutter="20" style="margin: 20px">
      <el-col :span="6">
        <el-input v-model="search" size="large" clearable placeholder="请输入客户姓名" prefix-icon="el-icon-search">
          <template #prepend>
            <h3 style="color: #409EFF">查询客户信息</h3>
          </template>
        </el-input>
      </el-col>
    </el-row>



    <el-table :data="filterTableData" stripe :border="false" style="width: 100%"
              max-height="600">
      <el-table-column type="expand">
        <template #default="props">
          <div m="4" style="width: 90%;margin: auto;">
            <h2>护理服务项目</h2>
            <el-table :data="props.row.careProjectForElderlyList" :border="true"
                      :row-class-name="tableRowClassName"
                      highlight-current-row>
              <el-table-column label="项目名称" prop="projectName" />
              <el-table-column label="护理项目描述" prop="description" />
              <el-table-column label="项目服务状态" prop="careStatus" />
              <el-table-column sortable label="服务到期时间" prop="careEndTime" />
              <el-table-column sortable label="价格" prop="price" />
              <el-table-column label="操作">
                <el-button style="color: #3f9dfd">续费</el-button>
                <el-button type="danger" plain>移除</el-button>
              </el-table-column>
            </el-table>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="姓名" prop="name" />
      <el-table-column label="性别" prop="gender" />
      <el-table-column label="年龄" prop="age" />
      <el-table-column label="身份证号" prop="idNumber" />
      <el-table-column label="护工名" prop="nurseName" />
      <el-table-column label="操作">
        <el-button type="success" plain>购买护理项目</el-button>
      </el-table-column>
    </el-table>

  </div>

</template>

<style>

</style>

<script setup>
import {computed, onMounted, onUnmounted, ref} from 'vue'
import axios from "axios";

const tableData = ref([]);


const getAllElderlyProjects = () => {
  // 发送 GET 请求到后端
  axios.get('http://localhost:9090/care-record/getAllElderlyProjects')
      .then(response => {
        console.log('从后端成功获取服务关注的信息:', response.data);
        tableData.value = response.data;
        console.log('打印tableData的内容:', tableData.value);
      })
      .catch(error => {
        console.error('错误:', error);
      });
}
onMounted(()=>{
  getAllElderlyProjects()
})


const search = ref('')
const filterTableData = computed(() =>
    tableData.value.filter(
        (data) =>
            !search.value ||
            data.name.toLowerCase().includes(search.value.toLowerCase())
    )
)


</script>