<template>
  <div>
    <!--      根据名字查询-->
    <div style="margin-left: 10px">
      <el-input
          v-model="name"
          placeholder="请填写需查询的护工姓名"
          clearable
          prefix-icon="el-icon-search"
          style="width: 250px;"
      >
      </el-input>
    </div>


    <!--      表格：展示健康管家信息-->
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

        <el-table-column type="expand">
          <template slot-scope="props">
            <el-card shadow="never" v-show="props.row.elderlyList.length==0" class="expanded_table">
              暂无负责老人！！！
            </el-card>
            <el-form label-position="left" inline class="demo-table-expand">
              <div class="expanded_table">

                <el-table
                    :data="props.row.elderlyList"
                    style="width: 100%; margin:auto;text-align: center;"
                    cell-style="text-align: center;"
                    :stripe="true"
                    :header-cell-style="{ background: '#f3f6fd', color: '#555' ,textAlign: 'center'}"
                    v-show="props.row.elderlyList.length!=0"
                >
                  <el-table-column property="elderlyId" label="老人ID号"/>
                  <el-table-column property="elderlyName" label="老人姓名"/>
                  <el-table-column property="gender" label="老人性别"/>
                  <el-table-column property="age" label="老人年龄"/>
                  <el-table-column property="contactInfo" label="联系方式"/>
                  <el-table-column fixed="right" label="Operations" min-width="120">
                    <template #default="scope">
                      <!--              todo 点击事件-->
                      <el-button link type="success" size="small" plain @click="handleClick(scope.$index, scope.row)">
                        <span style="font-weight: bolder">详 情</span>
                      </el-button>
                      <el-button link type="primary" size="small" plain
                                 @click="elderlyhandleClick(scope.$index, scope.row)"><span
                          style="font-weight: bolder">移 除</span>
                      </el-button>
                    </template>
                  </el-table-column>
                </el-table>
              </div>
            </el-form>
          </template>
        </el-table-column>
        <el-table-column property="nurseId" label="护士ID号"/>
        <el-table-column property="nurseName" label="护士姓名"/>
        <el-table-column property="gender" label="护工性别"/>
        <el-table-column property="contactInfo" label="联系方式"/>
        <el-table-column property="nurseLevel" label="护理等级"/>
        <el-table-column property="serviceEvaluation" label="服务评价"/>
        <el-table-column property="elderlyList.length" label="负责老人个数"/>
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
            :total="nurseData.length"
            style="margin-top: 10px;text-align: center;"
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
    this.getNursingInfo();
  },
  computed: {
    filterTableData: function () {
      // 将 name 的值转换为小写，方便进行大小写不敏感的比较
      let nameValue = this.name.toLowerCase();

      // 使用 filter 函数过滤 nurseData 数组
      return this.nurseData.filter(function (data) {
        // 如果 nameValue 为空，或者当前项的 name 包含 searchValue，则返回 true
        return !nameValue || data.nurseName.toLowerCase().includes(nameValue);
      });
    }
  },
  data() {
    return {
      name: "",

      // 表格、弹窗设置
      formLabelWidth: '140px',
      currentPage: 0,
      pageSize: 0,

      // 表格字段
      nurseData: [],
      nurseForm: {
        "nurseId": null,
        "nurseName": null,
        "gender": null,
        "age": null,
        "contactInfo": null,
        "workExperience": null,
        "nurseLevel": null,
        "serviceEvaluation": null,
        "elderlyList": []
      },
      // elderlyData: [],
      // elderForm: {
      //   "elderlyId": null,
      //   "elderlyName": null,
      //   "age": null,
      //   "gender": null,
      //   "contactInfo": null,
      //   "medicalHistory": null,
      //   "nurseId": null,
      //   "nurseName": null,
      //   "nurseLevel": null,
      //   "checkInTime": null,
      //   "checkOutTime": null,
      //   "physicalCondition": null
      // },

      // todo 弹窗开关控制
      // dialogTableVisible: false,
    };
  },
  methods: {
    getNursingInfo() {
      axios
          .get("http://127.0.0.1:9090/nurse-info/getAllNurses")
          .then((res) => {
            console.log("返回护工数据");
            console.log(res.data.data);
            this.nurseData = res.data.data;
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
.demo-table-expand {
  font-size: 0;
}

.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}

.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}

.expanded_table {
  margin-left: 150px;
  margin-right: 150px
}
</style>