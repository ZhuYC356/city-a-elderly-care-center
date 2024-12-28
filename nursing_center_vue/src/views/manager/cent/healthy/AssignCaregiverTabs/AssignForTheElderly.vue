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

    <!--      表格：展示老人信息，可以选无管家-->
    <div style="margin-top: 10px">
      <el-table
          :data="filterTableData"
          style="width: 100%; margin:auto;text-align: center;"
          cell-style="text-align: center;"
          :stripe="true"
          v-loading="loading"
          :header-cell-style="{ background: '#f3f6fd', color: '#555' ,textAlign: 'center'}"
      >
        <!--        <el-table-column type="selection" width="55"/>-->
        <el-table-column property="elderlyId" label="老人ID号"/>
        <el-table-column property="elderlyName" label="老人姓名"/>
        <el-table-column property="nurseId" label="护士ID号"/>
        <el-table-column property="nurseName" label="护士姓名"/>
        <el-table-column property="contactInfo" label="老人联系方式"/>
        <el-table-column property="physicalCondition" label="身体状况描述"/>
        <el-table-column fixed="right" label="更换/添加护工">
          <template #default="scope">
            <el-button link type="success" size="small" plain @click="handleClick(scope.$index, scope.row)"><span
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

    <!--    抽屉-->
    <el-drawer title="健康管家更改为" :visible.sync="drawerTableVisible" :before-close="handleClose" size="530px">
      <div style="margin-top: 0px">
        <el-radio-group v-model="radioNurse" size="medium">
          <el-radio-button v-for="nurse in nurseData" :label="nurse" :key="nurse"  style="width: 250px" >
            <el-card>
              <el-descriptions :title="nurse.name"  :column="1">
                <el-descriptions-item label="护工ID号">{{nurse.nurseId}}</el-descriptions-item>
                <el-descriptions-item label="护工姓名">{{nurse.nurseName}}</el-descriptions-item>
                <el-descriptions-item label="护工性别">{{nurse.gender}}</el-descriptions-item>
                <el-descriptions-item label="联系方式">{{nurse.contactInfo}}</el-descriptions-item>
                <el-descriptions-item label="护理等级">
                  <el-tag v-if="nurse.nurseLevel==1" type="danger">最高级</el-tag>
                  <el-tag v-else-if="nurse.nurseLevel==2" type="warning">高级</el-tag>
                  <el-tag v-else-if="nurse.nurseLevel==3" type="success">中级</el-tag>
                  <el-tag v-else-if="nurse.nurseLevel==4" type="primary">低级</el-tag>
                </el-descriptions-item>
                <el-descriptions-item label="服务评价">{{nurse.serviceEvaluation}}</el-descriptions-item>
              </el-descriptions>
            </el-card>
          </el-radio-button>
        </el-radio-group>
      </div>

    </el-drawer>
  </div>
</template>
<script>
import axios from "axios";

export default {
  name: "out-office-registration",
  mounted() {
    this.getElderlyInfo();
    this.getNurseInfo();
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
      this.filterTableData;
    }
  },
  data() {
    return {
      name: "",
      nurseIsNull: false,

      // 表格、弹窗设置
      formLabelWidth: '140px',
      currentPage: 0,
      pageSize: 0,

      // 表格字段
      elderlyData: [],
      elderForm: {
        "elderlyId": null, "nurseId": null,
        "age": null, "gender": null, "contactInfo": null, "medicalHistory": null, "elderlyName": null,
        "nurseName": null, "nurseLevel": null, "checkInTime": null, "checkOutTime": null, "physicalCondition": null
      },

      // 抽屉
      drawerTableVisible: false,
      radioNurse:{},
      nurseData : [],



    };
  },
  methods: {
    getElderlyInfo() {
      axios
          .get("http://127.0.0.1:9090/elderly-info/getAllElderly")
          .then((res) => {
            console.log(res.data.data);
            this.elderlyData = res.data.data;
          })
          .catch((err) => {
            console.error(err);
          });

    },
    getNurseInfo() {
      axios
          .get("http://127.0.0.1:9090/nurse-info/getAll")
          .then((res) => {
            console.log(res.data.data);
            this.nurseData = res.data.data;
            // console.log(this.nurseData)
          })
          .catch((err) => {
            console.error(err);
          });

    },

    handleClick(index, row) {
      this.elderForm=row;
      // console.log("点击了row")
      // console.log(this.elderForm)
      this.drawerTableVisible = true;
    },
    handleClose(done) {
      if (Object.keys(this.radioNurse).length == 0||this.elderForm.nurseId==this.radioNurse.nurseId) {
        this.radioNurse={}
        done();
      } else {
        this.$confirm('确定将 '+this.elderForm.elderlyName+" 的护工更改为 "+this.radioNurse.name+" ？", '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.drawerFormSubmit();
          this.radioNurse= {}
          done();
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消更改'
          });
          this.radioNurse= {}
          done();
        });
      }
    },
    drawerFormSubmit() {
      let updateElderForm = {
        [String(this.elderForm.elderlyId)]: this.radioNurse.nurseId,
      };
      axios.post('http://127.0.0.1:9090/elderly-info/updateNurseIds', updateElderForm)
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

  }
  ,
}
;
</script>

<style scoped>
table td {
  text-align: center;
}
</style>