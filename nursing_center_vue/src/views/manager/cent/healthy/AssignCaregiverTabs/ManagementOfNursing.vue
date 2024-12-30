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
          :default-sort = "{prop: 'nurseId', order: 'ascending'}"
          :header-cell-style="{ background: '#f3f6fd', color: '#555' ,textAlign: 'center'}"
      >
        <el-table-column property="nurseId" label="护工ID号" sortable/>
        <el-table-column property="nurseName" label="护工姓名" sortable/>
        <el-table-column property="gender" label="护工性别"/>
        <el-table-column property="contactInfo" label="联系方式" sortable/>
        <el-table-column property="nurseLevel" label="护理等级" sortable/>
        <el-table-column property="serviceEvaluation" label="服务评价"/>
        <el-table-column property="elderlyList.length" label="负责老人个数" min-width="110px" sortable/>
        <el-table-column fixed="right" label="负责老人" min-width="140px">
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
    <el-drawer title="负责的老人有" :visible.sync="detailsDrawerTableVisible" :before-close="detailsClose" size="530px">
      <div style="margin-top: -10px">
        <el-alert
            title="注意！选中即代表移除负责该老人，可选择多个"
            type="error" center style="margin: 10px;width: 500px">
        </el-alert>
        <el-alert
            title="该健康管家暂时没有负责的老人"
            type="info" center style="margin: 10px;width: 500px" v-show="this.elderlyData.length==0">
        </el-alert>
        <el-checkbox-group v-model="detailsElderly" size="medium">
          <el-checkbox-button v-for="elderly in elderlyData" :label="elderly" :key="elderly" style="width: 250px">
            <el-card>
              <el-descriptions :title="elderly.name" :column="1">
                <el-descriptions-item label="老人ID号">{{ elderly.elderlyId }}</el-descriptions-item>
                <el-descriptions-item label="老人姓名">{{ elderly.name }}</el-descriptions-item>
                <el-descriptions-item label="老人性别">{{ elderly.age }}</el-descriptions-item>
                <el-descriptions-item label="老人年龄">{{ elderly.gender }}</el-descriptions-item>
                <el-descriptions-item label="联系方式">{{ elderly.contactInfo }}</el-descriptions-item>
                <el-descriptions-item label="自理能力等级">
                  <el-tag v-if="elderly.selfCareStatus==1" type="danger">不自理</el-tag>
                  <el-tag v-else-if="elderly.selfCareStatus==2" type="warning">部分自理</el-tag>
                  <el-tag v-else-if="elderly.selfCareStatus==3" type="success">自行disabled</el-tag>
                </el-descriptions-item>
                <el-descriptions-item label="身体状态">
                  <el-tag type="info">{{ elderly.physicalCondition || '无' }}</el-tag>
                </el-descriptions-item>
              </el-descriptions>
            </el-card>
          </el-checkbox-button>
        </el-checkbox-group>
      </div>

    </el-drawer>
    <!--    添加老人的抽屉-->
    <el-drawer title="可添加的老人有" :visible.sync="addDrawerTableVisible" :before-close="addClose" size="530px">
      <div style="margin-top: 0px">
        <el-alert
            title="所有老人均已分配护工了"
            type="info" center style="margin: 10px;width: 500px" v-show="this.nurseIsNullElderly.length==0">
        </el-alert>

        <el-checkbox-group v-model="addElderly" size="medium">
          <el-checkbox-button v-for="elderly in nurseIsNullElderly" :label="elderly" :key="elderly"
                              style="width: 250px">
            <el-card>
              <el-descriptions :title="elderly.elderlyName" :column="1">
                <el-descriptions-item label="老人ID号">{{ elderly.elderlyId }}</el-descriptions-item>
                <el-descriptions-item label="老人姓名">{{ elderly.name }}</el-descriptions-item>
                <el-descriptions-item label="老人性别">{{ elderly.age }}</el-descriptions-item>
                <el-descriptions-item label="老人年龄">{{ elderly.gender }}</el-descriptions-item>
                <el-descriptions-item label="联系方式">{{ elderly.contactInfo }}</el-descriptions-item>
                <el-descriptions-item label="自理能力等级">
                  <el-tag v-if="elderly.selfCareStatus==1" type="danger">不自理</el-tag>
                  <el-tag v-else-if="elderly.selfCareStatus==2" type="warning">部分自理</el-tag>
                  <el-tag v-else-if="elderly.selfCareStatus==3" type="success">自行disabled</el-tag>
                </el-descriptions-item>
                <el-descriptions-item label="身体状态">
                  <el-tag type="info">{{ elderly.physicalCondition || '无' }}</el-tag>
                </el-descriptions-item>
              </el-descriptions>
            </el-card>
          </el-checkbox-button>
        </el-checkbox-group>
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
    this.getNurseIsNullElderlyInfo()
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
  // todo watch 监听器
  // 分页查询
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

      // 详情抽屉
      detailsDrawerTableVisible: false,
      detailsElderly: [],
      elderlyData: [],

      // 添加抽屉
      addDrawerTableVisible: false,
      addElderly: [],
      nurseIsNullElderly: []
    };
  },
  methods: {
    getNursingInfo() {
      axios
          .get("http://127.0.0.1:9090/nurse-info/getAllNurses")
          .then((res) => {
            // console.log("返回护工数据");
            // console.log(res.data.data);
            this.nurseData = res.data.data;
          })
          .catch((err) => {
            console.error(err);
          });
    },
    getNurseIsNullElderlyInfo() {
      axios
          .get("http://127.0.0.1:9090/elderly-info/getAllElderlyInfo")
          .then((res) => {
            this.nurseIsNullElderly = res.data;
            console.log("返回护士为空的老人数据");
            console.log(this.nurseIsNullElderly);
            this.nurseIsNullElderly = this.nurseIsNullElderly.filter(function (data) {
              return data.nurseId == 0||!data.nurseId;
            });
            console.log("返回护士为空的老人数据");
            console.log(this.nurseIsNullElderly);
          })
          .catch((err) => {
            console.error(err);
          });
    },

    detailsClick(index, row) {
      this.nurseForm = row;
      this.elderlyData = this.nurseForm.elderlyList
      // console.log("点击了row")
      // console.log(this.elderlyData)
      this.detailsDrawerTableVisible = true;
    },
    addClick(index, row) {
      this.nurseForm = row;
      this.elderlyData = this.nurseForm.elderlyList
      this.addDrawerTableVisible = true;
    },
    detailsClose(done) {
      if (this.detailsElderly.length == 0) {
        this.detailsElderly = []
        done();
      } else {
        this.$confirm('确定移除 '+this.nurseForm.nurseName+' 负责的这 '+this.detailsElderly.length+' 位老人？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let delElderForm = {};
          for(let i=0;i<this.detailsElderly.length;i++){
            delElderForm[String(this.detailsElderly[i].elderlyId)] = null;
          }
          console.log(delElderForm)
          this.drawerFormSubmit(delElderForm);
          this.detailsElderly = []
          done();
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消更改'
          });
          this.detailsElderly = []
          done();
        });
      }
    },
    addClose(done) {
      if (this.addElderly.length == 0) {
        this.addElderly = []
        done();
      } else {
        this.$confirm('确定为 '+this.nurseForm.nurseName+' 添加 '+this.addElderly.length+' 位老人？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let addEldertoNurseForm = {};
          // console.log("addElderly")
          // console.log(this.addElderly)
          for(let i=0;i<this.addElderly.length;i++){
            addEldertoNurseForm[String(this.addElderly[i].elderlyId)] = this.nurseForm.nurseId;
          }
          // console.log(addEldertoNurseForm)
          this.drawerFormSubmit(addEldertoNurseForm);
          this.addElderly = []
          done();
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消更改'
          });
          this.addElderly = []
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