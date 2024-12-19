<template>
  <div>
    <el-card>
      <div>
        <hr style="margin: 10px">
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>
        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">入住登记</span>
        <hr style="margin: 10px">
      </div>
      <!--    表格    -->
      <el-button style="margin-top: 10px" type="primary" @click="">新增入住人员</el-button>

      <div style="margin-top: 15px;margin-left: 10px">
        <el-form :inline="true" :model="form">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.name" placeholder="请填写老人姓名" clearable/>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.bedNumber" placeholder="请填写床位号" clearable/>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-date-picker
                v-model="form.date"
                type="date"
                placeholder="请选择入住日期"
                clearable
            />
          </el-form-item>
          <el-form-item style="margin-right: 15px">
            <el-button type="primary" @click="onSubmit"><span style="font-weight: bolder">搜 索</span></el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="danger" @click="clearAll"><span style="font-weight: bolder">清 空</span></el-button>
          </el-form-item>
        </el-form>
      </div>
      <div style="margin-top: 5px">
        <el-table :data="tableData" style="width: 100%;" height="365" :stripe="true"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}">
          <el-table-column type="selection" width="55"/>
          <el-table-column property="name" label="姓名" width="120"/>
          <el-table-column property="gender" label="性别" width="120"/>
          <el-table-column label="出生日期" width="120">
            <template #default="scope">{{ scope.row.date }}</template>
          </el-table-column>
          <el-table-column property="familyContactInfo" label="监护人电话" width="120"/>
          <el-table-column property="floorNumber" label="楼号" width="120"/>
          <el-table-column property="roomNumber" label="房间号" width="120"/>
          <el-table-column property="bedNumber" label="床位号" width="120"/>
          <el-table-column fixed="right" label="Operations" min-width="120">
            <template #default>
              <el-button link type="success" size="small" @click="handleClick">
                <span style="font-weight: bolder">详 情</span>
              </el-button>
              <el-button link type="primary" size="small" @click="update"><span style="font-weight: bolder">修 改</span>
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
<script>
export default {
  name: "入住登记",
  methods: {
    onSubmit() {
      console.log('submit!');
    },
    clearAll() {
      this.form.name = '';
      this.form.bedNumber = '';
      this.form.date = '';
    },
    handleClick() {
      console.log('handleClick')
    },
    update() {
      alert('修改')
    },
    handleSizeChange(val) {
      console.log(`每页 ${val} 条`);
    },
    handleCurrentChange(val) {
      console.log(`当前页: ${val}`);
    },
  },
  data() {
    return {
      form:{
        name: '',
        bedNumber: '',
        date: '',
      },
      currentPage4: 4,
      pageSize4: 100,
      size: 'mini',
      disabled: false,
      background: false,
      tableData: [
        {
          name: '张三',
          gender: '男',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '1',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        }, {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        }, {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
      ]
    }
  }
}
</script>
<style scoped>

</style>