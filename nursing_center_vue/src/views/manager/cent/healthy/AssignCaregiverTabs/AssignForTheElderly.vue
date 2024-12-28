<template>
  <div>
    <!--      搜索栏-->
    <div style="margin-left: 10px;">
      <el-input
          v-model="name"
          placeholder="请填写需查询的老人姓名"
          clearable
          prefix-icon="el-icon-search"
          style="width: 250px;margin-right: 50px"
      >
      </el-input>
      未分配管家
      <el-switch
          v-model="nurseIsNull"
          active-color="#13ce66">
      </el-switch>
    </div>

    <!--      表格：展示老人信息，可以选有无管家-->
    <div style="margin-top: 10px">
      <el-table
          :data="filterTableData"
          style="width: 100%; margin:auto;text-align: center;"
          cell-style="text-align: center;"
          height="270"
          :stripe="true"
          v-loading="loading"
          :header-cell-style="{ background: '#f3f6fd', color: '#555' ,textAlign: 'center'}"
      >
        <el-table-column type="selection" width="55"/>
        <el-table-column property="elderlyId" label="老人ID号"/>
        <el-table-column property="elderlyName" label="老人姓名"/>
        <el-table-column property="nurseId" label="护士ID号"/>
        <el-table-column property="nurseName" label="护士姓名"/>
        <el-table-column property="contactInfo" label="老人联系方式"/>
        <el-table-column property="physicalCondition" label="身体状况描述"/>
        <el-table-column fixed="right" label="Operations" min-width="150px">
          <template #default="scope">
            <!--              todo 点击事件-->
            <el-button link type="success" size="small" plain @click="handleClick(scope.$index, scope.row)">
              <span style="font-weight: bolder">详 情</span>
            </el-button>
            <el-button link type="primary" size="small" plain @click="handleClick(scope.$index, scope.row)"><span
                style="font-weight: bolder">修 改</span>
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <div style="margin-top: 10px; text-align: center;">
        <el-pagination
            v-model:current-page="currentPage"
            v-model:page-size="pageSize"
            :page-sizes="[5, 10, 20, 50]"
            :size="size"
            :disabled="disabled"
            background=true
            layout="total, sizes, prev, pager, next, jumper"
            :total="elderlyData.length"
        />
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  name: "out-office-registration",
  mounted() {
    this.getElderlyInfo();
  },
  computed: {
    filterTableData: function () {
      let nameValue = this.name.toLowerCase();

      let filteredData = this.elderlyData;
      if (this.nurseIsNull) {
        filteredData = filteredData.filter(function (data) {
          return data.nurseId == 0;
        });
      }

      if (nameValue) {
        filteredData = filteredData.filter(function (data) {
          return data.elderlyName.toLowerCase().includes(nameValue);
        });
      }
      return filteredData;
    }
  },
  watch: {
    nurseIsNull(newVal) {
      // 当 nurseIsNull 变化时，重新过滤数据
      this.filterTableData;  // 会触发 computed 属性的 getter
    }
  },
  data() {
    return {
      name: "",
      nurseIsNull: false,

      // 表格、弹窗设置
      // formLabelWidth: '140px',
      // currentPage: 0,
      // pageSize: 0,

      // 表格字段
      elderlyData: [],
      elderForm: {
        "elderlyId": null,
        "elderlyName": null,
        "age": null,
        "gender": null,
        "contactInfo": null,
        "medicalHistory": null,
        "nurseId": null,
        "nurseName": null,
        "nurseLevel": null,
        "checkInTime": null,
        "checkOutTime": null,
        "physicalCondition": null
      },

      // todo 弹窗开关控制
      // dialogTableVisible: false,
    };
  },
  methods: {
    getElderlyInfo() {
      axios
          .get("http://127.0.0.1:9090/elderly-info/getAllElderly")
          .then((res) => {
            console.log(res.data.data);
            this.elderlyData = res.data.data;
            this.filteredData = this.elderlyData;
          })
          .catch((err) => {
            console.error(err);
          });

    },

    handleClick(index) {
      let itemData = this.tableData[index];
      this.dialogTableVisible = true;
      this.elderForm = itemData;
    },
    dialogFormSubmit() {
      this.dialogTableVisible = false;
      axios.post('http://localhost:9090/outing-registration/update', this.elderForm)
          .then((response) => {
            this.$message({
              showClose: true,
              message: '恭喜你，提交成功',
              type: 'success'
            });
            console.log(response);
          })
          .catch((error) => {
            this.$message({
              showClose: true,
              message: '糟糕！提交失败',
              type: 'error'
            });
            console.log(error);
          });
    },

  },
};
</script>

<style scoped>
table td {
  text-align: center;
}
</style>