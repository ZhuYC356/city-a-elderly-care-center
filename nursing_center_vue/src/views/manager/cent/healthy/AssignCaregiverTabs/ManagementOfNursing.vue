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
          :stripe="true"
          v-loading="loading"
          :header-cell-style="{ background: '#f3f6fd', color: '#555' ,textAlign: 'center'}"
      >
        <el-table-column property="nurseId" label="护工ID号"/>
        <el-table-column property="nurseName" label="护工姓名"/>
        <el-table-column property="gender" label="护工性别"/>
        <el-table-column property="contactInfo" label="联系方式"/>
        <el-table-column property="nurseLevel" label="护理等级"/>
        <el-table-column property="serviceEvaluation" label="服务评价"/>
        <el-table-column property="elderlyList.length" label="负责老人个数" min-width="100px"/>
        <el-table-column fixed="right" label="负责老人" min-width="150px">
          <template #default="scope">
            <el-button link type="success" size="small" plain @click="detailsClick(scope.$index, scope.row)">
              <span style="font-weight: bolder">详 情</span>
            </el-button>
            <el-button link type="primary" size="small" plain @click="addClick(scope.$index, scope.row)">
              <span style="font-weight: bolder">添 加</span>
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
    <!--    展示细节的抽屉-->
    <el-drawer title="负责的老人有" :visible.sync="detailsDrawerTableVisible" :before-close="detailsClose" size="600px">
      <div style="margin-top: 0px">
        <el-radio-group v-model="radioNurse" size="medium">
          <el-radio-button v-for="nurse in nurseData" :label="nurse" :key="nurse"  style="width: 270px" >
            <el-card>
              <el-descriptions :title="nurse.name"  :column="1">
                <el-descriptions-item label="老人ID号">{{nurse.nurseId}}</el-descriptions-item>
                <el-descriptions-item label="老人姓名">{{nurse.nurseName}}</el-descriptions-item>
                <el-descriptions-item label="老人性别">{{nurse.gender}}</el-descriptions-item>
                <el-descriptions-item label="老人年龄">{{nurse.gender}}</el-descriptions-item>
                <el-descriptions-item label="联系方式">{{nurse.contactInfo}}</el-descriptions-item>
                <el-descriptions-item label="自理能力等级">
                  <el-tag v-if="nurse.nurseLevel==1" type="danger">不自理</el-tag>
                  <el-tag v-else-if="nurse.nurseLevel==2" type="warning">部分自理</el-tag>
                  <el-tag v-else-if="nurse.nurseLevel==3" type="success">自行disabled</el-tag>
                </el-descriptions-item>
                <el-descriptions-item label="入住状态">
                  <el-tag v-if="nurse.nurseLevel==1" type="success">已入住</el-tag>
                  <el-tag v-else-if="nurse.nurseLevel==0" type="info">已离开</el-tag>
                </el-descriptions-item>
              </el-descriptions>
            </el-card>
          </el-radio-button>
        </el-radio-group>
      </div>

    </el-drawer>
    <!--    添加老人的抽屉-->
    <el-drawer title="可添加的老人有" :visible.sync="addDrawerTableVisible" :before-close="addClose" size="600px">
      <div style="margin-top: 0px">
        <el-radio-group v-model="radioNurse" size="medium">
          <el-radio-button v-for="nurse in nurseData" :label="nurse" :key="nurse"  style="width: 270px" >
            <el-card>
              <el-descriptions :title="nurse.name"  :column="1">
                <el-descriptions-item label="老人ID号">{{nurse.nurseId}}</el-descriptions-item>
                <el-descriptions-item label="老人姓名">{{nurse.nurseName}}</el-descriptions-item>
                <el-descriptions-item label="老人性别">{{nurse.gender}}</el-descriptions-item>
                <el-descriptions-item label="老人年龄">{{nurse.gender}}</el-descriptions-item>
                <el-descriptions-item label="联系方式">{{nurse.contactInfo}}</el-descriptions-item>
                <el-descriptions-item label="自理能力等级">
                  <el-tag v-if="nurse.nurseLevel==1" type="danger">不自理</el-tag>
                  <el-tag v-else-if="nurse.nurseLevel==2" type="warning">部分自理</el-tag>
                  <el-tag v-else-if="nurse.nurseLevel==3" type="success">自行disabled</el-tag>
                </el-descriptions-item>
                <el-descriptions-item label="入住状态">
                  <el-tag v-if="nurse.nurseLevel==1" type="success">已入住</el-tag>
                  <el-tag v-else-if="nurse.nurseLevel==0" type="info">已离开</el-tag>
                </el-descriptions-item>
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

      // 抽屉
      detailsDrawerTableVisible: false,
      addDrawerTableVisible: false,
      radioNurse:{},
      elderlyData: []
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


    detailsClick(index,row) {
      this.elderForm=row;
      // console.log("点击了row")
      // console.log(this.elderForm)
      this.drawerTableVisible = true;
    },
    addClick(index,row) {
      this.elderForm=row;
      // console.log("点击了row")
      // console.log(this.elderForm)
      this.drawerTableVisible = true;
    },
    detailsClose(done) {
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
    addClose(done) {
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

    drawerFormSubmit(submitFrom) {
      axios.post('http://127.0.0.1:9090/elderly-info/updateNurseIds', submitFrom)
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