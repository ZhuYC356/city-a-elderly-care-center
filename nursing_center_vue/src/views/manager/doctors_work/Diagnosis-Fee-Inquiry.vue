<template>
  <div>
    <hr/>
    <el-tag type="success" style="font-size: 20px;width: 500px;height: 30px;margin-top: 10px">

      <h5 style="margin-top: 5px">
        患者账单合计金额：
        {{ form.sumMoney }}元
      </h5>

    </el-tag>
    <br>
<!--    表格-->
    <el-table :data="feeInquiryList" style="width: 100%">
      <el-table-column label="#" width="100">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.index }}</span>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="名称" width="150">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.name }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="内容" width="150">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.desc }}</span>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="规格" width="150">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.specification }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="数量" width="150">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.count }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="单价" width="150">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.price }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="金额" width="150">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.money }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="收费状态" width="150">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.status }}</span>
          </div>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination background layout="prev, pager, next" :total="1000" />
  </div>
</template>
<script>
export default {
  name: "费用查询",
  data() {
    return {
      form: {
        sumMoney: 360.00
      },
      feeInquiryList: [
        {
          name: 'CT检查',
          desc: '执行CT检查',
          specification: '1次',
          count: '10',
          price: '200.00',
          money: '200.00',
          status: '已经使用'
        },
        {
          name: 'CT检查',
          desc: '执行CT检查',
          specification: '1次',
          count: '10',
          price: '200.00',
          money: '200.00',
          status: '已经使用'
        },
        {
          name: 'CT检查',
          desc: '执行CT检查',
          specification: '1次',
          count: '10',
          price: '200.00',
          money: '200.00',
          status: '已经使用'
        },
        {
          name: 'CT检查',
          desc: '执行CT检查',
          specification: '1次',
          count: '10',
          price: '200.00',
          money: '200.00',
          status: '已经使用'
        },
        {
          name: 'CT检查',
          desc: '执行CT检查',
          specification: '1次',
          count: '10',
          price: '200.00',
          money: '200.00',
          status: '已经使用'
        },
      ]
    }
  }
}
</script>
<style scoped>

</style>