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

    <el-table :data="tableData" stripe :border="false" style="width: 100%"
              max-height="650">
      <el-table-column type="expand">
        <template #default="props">
          <div m="4" style="width: 90%;margin: auto;">
            <h2>护理服务项目</h2>
            <el-table :data="props.row.family" :border="true"
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
import { ref } from 'vue'

const tableData = [
  {
    name: '张三',
    gender: '男',
    age: '67',
    idNumber: '410303197201104081',
    nurseName: 'CA 94114',
    family: [
      {
        projectName: '全套按摩马萨基',
        description: '从头给你按到脚',
        careStatus: '到期',
        careEndTime: '2024-12-26',
        price: '998.00',
      },
      {
        projectName: '尼哥同款鞭策套餐',
        description: '给你原汁原味的尼哥体验',
        careStatus: '欠费',
        careEndTime: '2025-01-01',
        price: '198.00',
      },
      {
        projectName: '麦小鼠电疗服务',
        description: '猛攻！',
        careStatus: '未到期',
        careEndTime: '2024-12-28',
        price: '648.00',
      },
    ],
  },
  {
    name: '张三',
    gender: '男',
    age: '67',
    idNumber: '410303197201104081',
    nurseName: 'CA 94114',
    family: [
      {
        projectName: '全套按摩马萨基',
        description: '从头给你按到脚',
        careStatus: '到期',
        careEndTime: '2024-12-26',
        price: '998.00',
      },
      {
        projectName: '尼哥同款鞭策套餐',
        description: '给你原汁原味的尼哥体验',
        careStatus: '欠费',
        careEndTime: '2025-01-01',
        price: '198.00',
      },
      {
        projectName: '麦小鼠电疗服务',
        description: '猛攻！',
        careStatus: '未到期',
        careEndTime: '2024-12-28',
        price: '648.00',
      },
    ],
  },
  {
    name: '张三',
    gender: '男',
    age: '67',
    idNumber: '410303197201104081',
    nurseName: 'CA 94114',
    family: [
      {
        projectName: '全套按摩马萨基',
        description: '从头给你按到脚',
        careStatus: '到期',
        careEndTime: '2024-12-26',
        price: '998.00',
      },
      {
        projectName: '尼哥同款鞭策套餐',
        description: '给你原汁原味的尼哥体验',
        careStatus: '欠费',
        careEndTime: '2025-01-01',
        price: '198.00',
      },
      {
        projectName: '麦小鼠电疗服务',
        description: '猛攻！',
        careStatus: '未到期',
        careEndTime: '2024-12-28',
        price: '648.00',
      },
    ],
  },
  {
    name: '张三',
    gender: '男',
    age: '67',
    idNumber: '410303197201104081',
    nurseName: 'CA 94114',
    family: [
      {
        projectName: '全套按摩马萨基',
        description: '从头给你按到脚',
        careStatus: '到期',
        careEndTime: '2024-12-26',
        price: '998.00',
      },
      {
        projectName: '尼哥同款鞭策套餐',
        description: '给你原汁原味的尼哥体验',
        careStatus: '欠费',
        careEndTime: '2025-01-01',
        price: '198.00',
      },
      {
        projectName: '麦小鼠电疗服务',
        description: '猛攻！',
        careStatus: '未到期',
        careEndTime: '2024-12-28',
        price: '648.00',
      },
    ],
  },
]

</script>