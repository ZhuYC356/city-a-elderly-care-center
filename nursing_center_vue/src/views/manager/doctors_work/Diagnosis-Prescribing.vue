<template>
  <div>
    <hr/>
    <el-tag type="success" style="font-size: 20px;width: 500px;height: 30px;margin-top: 10px">

      <h5 style="margin-top: 5px">
        本项目金额合计:
        {{ form.sumMoney || 0.00 }}元
      </h5>

    </el-tag>
    <br>
    <el-button type="primary" @click="add">新增</el-button>
    <el-table :data="PrescribingList" style="width: 100%">

      <el-table-column label="药品名称" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.drugName }}</span>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="规格" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.specification }}</span>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="用法用量" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.dosage }}</span>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="单价(元)" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.price }}</span>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="数量" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">
              <span>
                <el-button type="primary" @click="addCount()">+</el-button>
              </span>
              {{ scope.row.count }}
              <span>
                <el-button type="primary" @click="subCount()">-</el-button>
              </span>
            </span>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="操作">
        <template #default="scope">
          <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
            编辑
          </el-button>
          <el-button
              size="small"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination background layout="prev, pager, next" :total="1000" />
  </div>
</template>
<script>
export default {
  name: "开设处方",

  data() {
    return {
      form: {
        sumMoney: '360.00',
      },
      PrescribingList: [
        {
          drugName: '阿司匹林',
          specification: '100mg',
          dosage: '1次/天',
          price: '20.00',
          count: 3,
        },
        {
          drugName: 'cipl',
          specification: '100mg',
          dosage: '1次/天',
          price: '20.00',
          count: 3,
        },
        {
          drugName: '阿司匹林',
          specification: '100mg',
          dosage: '1次/天',
          price: '20.00',
          count: 1,
        },
        {
          drugName: 'cipl',
          specification: '100mg',
          dosage: '1次/天',
          price: '20.00',
          count: 2,
        },
        {
          drugName: 'cipl',
          specification: '100mg',
          dosage: '1次/天',
          price: '40.00',
          count: 3,
        },
      ],
    }
  },
  methods: {
    onSubmit() {
      console.log('submit!');
    },
    handleEdit(index, row) {
      // 传回的是索引和数据
      console.log(row)
      alert(index, row.name)
    },
    handleDelete(index, row) {
      alert(index, row)
    },
    add() {
      alert("新增")
    },
    addCount() {
      alert("增加数量")
    },
    subCount() {
      alert("减少数量")
    }
  }
}
</script>
<style scoped>

</style>