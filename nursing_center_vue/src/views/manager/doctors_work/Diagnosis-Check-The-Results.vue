<template>
  <div>
    <el-form :model="form" label-width="auto" style="max-width: 95%">
      <h2 style="margin-left: 10px;margin-bottom: 10px">
        检查结果
      </h2>
      <hr/>
      <!--      表格-->
      <el-table :data="checkResults" style="width: 100%">
        <el-table-column label="分类" width="150">
          <template #default="scope">
            <el-popover effect="light" trigger="hover" placement="top" width="auto">
              <!--              <span style="color: #409EFF">{{ scope.row.name }}</span>-->
              <template #reference>
                <el-tag>{{ scope.row.type }}</el-tag>
              </template>
            </el-popover>
          </template>
        </el-table-column>

        <el-table-column label="项目名" width="150">
          <template #default="scope">
            <el-popover effect="light" trigger="hover" placement="top" width="auto">
              <template #reference>
                <el-tag>{{ scope.row.name }}</el-tag>
              </template>
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column label="执行科室" width="150">
          <template #default="scope">
            <el-popover effect="light" trigger="hover" placement="top" width="auto">
              <template #reference>
                <el-tag>{{ scope.row.departmentName }}</el-tag>
              </template>
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column label="加急" width="150">
          <template #default="scope">
            <el-popover effect="light" trigger="hover" placement="top" width="auto">
              <template #reference>
                <el-tag>{{ scope.row.urgency }}</el-tag>
              </template>
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column label="状态" width="150">
          <template #default="scope">
            <el-popover effect="light" trigger="hover" placement="top" width="auto">
              <template #reference>
                <el-tag>{{ scope.row.status }}</el-tag>
              </template>
            </el-popover>
          </template>
        </el-table-column>


        <el-table-column label="操作">
          <template #default="scope">
            <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
              查看检验结果
            </el-button>
            <el-button
                size="small"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)"
            >
              取消
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination background layout="prev, pager, next" :total="1000"/>
    </el-form>
  </div>
</template>
<script>
export default {
  name: "Diagnosis-Check-The-Application",
  data() {
    return {
      checkResults: [
        {
          type: '检验项目',
          name: '血常规',
          departmentName: '检验科',
          urgency: '加急',
          status: '未完成'
        },
        {
          type: '检验项目',
          name: '血常规',
          departmentName: '检验科',
          urgency: '加急',
          status: '未完成'
        },
        {
          type: '检验项目',
          name: '血常规',
          departmentName: '检验科',
          urgency: '加急',
          status: '未完成'
        },
      ],
    }
  },
  methods: {
    onSubmit() {
      console.log('submit!');
    },
    handleEdit(index, row) {
    },
    handleDelete(index, row) {
      alert(index, row)
    },
  },
  created() {
    // 查询后台的检查结果
  }
}
</script>
<style scoped>

</style>