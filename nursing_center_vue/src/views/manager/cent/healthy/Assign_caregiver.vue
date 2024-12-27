<template>
  <div>
    <el-card style="height: 630px">
      <!--      上方标题-->
      <div>
        <hr style="margin: 10px"/>
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px; font-size: 20px"></i>
        <span style="margin-left: 5px; font-size: 20px; font-weight: bolder">设置服务对象</span>
        <hr style="margin: 10px"/>
      </div>

      <!--      搜索栏-->
      <div style="margin-top: 15px; margin-left: 10px">
        <el-form :inline="true" :model="form">
          <el-form-item style="margin-right: 20px">
            <el-select v-model="identity" clearable placeholder="请选择身份" @change="identityChange">
              <el-option
                  v-for="item in optionsIdentity"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-input
                v-model="name"
                placeholder="请填写查询姓名"
                clearable
            >
              <template #prefix>
                <i
                    class="el-icon-postcard"
                    style="font-size: 15px; margin-left: 3px"
                ></i>
              </template>
            </el-input>
          </el-form-item>
<!--          1时查无管家，0时查全部-->
          <el-form-item style="margin-right: 20px">
            <el-radio v-model="radioNurse" label="1" :disabled="radioNurseDisabled">无管家</el-radio>
          </el-form-item>
          <el-form-item style="margin-right: 15px">
            <el-button type="primary" @click="onSubmit"
            ><span style="font-weight: bolder">搜 索</span></el-button
            >
          </el-form-item>
          <el-form-item>
            <el-button type="danger" @click="clearAll"
            ><span style="font-weight: bolder">清 空</span></el-button
            >
          </el-form-item>
        </el-form>
      </div>

      <!--      导出excel-->
      <div>
<!--        todo 改链接-->
        <a href="http://localhost:9090/outing-registration/export" style="float: right;margin-right: 30px">
          <el-button type="primary" style="margin-left: 10px">
            <span style="font-weight: bolder">外出登记导出Excel表</span>
          </el-button>
        </a>
      </div>

      <!--      表格1，展示老人信息，可以选有无管家-->
      <div style="margin-top: 5px">
        <el-table
            :data="tableData"
            style="width: 100%; margin:auto;text-align: center;"
            cell-style="text-align: center;"
            height="270"
            :stripe="true"
            :header-cell-style="{ background: '#f3f6fd', color: '#555' ,textAlign: 'center'}"
        >
          <el-table-column type="selection" width="55"/>
          <el-table-column property="outingId" label="外出登记号" width="120"/>
          <el-table-column property="elderlyId" label="老人id号" width="120"/>
          <el-table-column property="outingDate" label="外出日期" width="120"/>
          <el-table-column property="outingTime" label="具体时间" width="120"/>
          <el-table-column property="destination" label="详细描述" width="120"/>
          <el-table-column property="purpose" label="外出目的" width="120"/>
          <el-table-column fixed="right" label="Operations" min-width="120">
            <template #default="scope">
              <el-button link type="success" size="small" plain @click="handleClick(scope.$index)">
                <span style="font-weight: bolder">详 情</span>
              </el-button>
              <el-button link type="primary" size="small" plain @click="handleClick(scope.$index)"><span
                  style="font-weight: bolder">修 改</span>
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <div style="margin-top: 10px">
          <el-pagination
              v-model:current-page="currentPage"
              v-model:page-size="pageSize"
              :page-sizes="[100, 200, 300, 400]"
              :size="size"
              :disabled="disabled"
              background=true
              layout="total, sizes, prev, pager, next, jumper"
              :total="400"
          />
        </div>
      </div>

      <!--        弹窗-->
      <el-dialog v-model="dialogFormVisible" :visible.sync="dialogTableVisible" title="详情" width="500">
        <el-form>
          <el-form-item label="外出记录ID" :label-width="formLabelWidth">
            <el-input v-model="elderForm.outingId" autocomplete="off" :disabled="true"/>
          </el-form-item>
          <el-form-item label="老人ID" :label-width="formLabelWidth">
            <el-input v-model="elderForm.elderlyId" autocomplete="off" :disabled="true"/>
          </el-form-item>
          <el-form-item label="外出日期" :label-width="formLabelWidth">
            <el-date-picker v-model="elderForm.outingDate" type="date" placeholder="选择日期"/>
          </el-form-item>
          <el-form-item label="外出时间" :label-width="formLabelWidth">
            <el-time-picker v-model="elderForm.outingTime" placeholder="选择时间"/>
          </el-form-item>
          <el-form-item label="目的地" :label-width="formLabelWidth">
            <el-input v-model="elderForm.destination" autocomplete="off"/>
          </el-form-item>
          <el-form-item label="外出目的" :label-width="formLabelWidth">
            <el-input v-model="elderForm.purpose" type="textarea" autocomplete="off"/>
          </el-form-item>
          <el-form-item label="陪同人员" :label-width="formLabelWidth">
            <el-input v-model="elderForm.accompanyingPerson" autocomplete="off"/>
          </el-form-item>
          <el-form-item label="联系方式" :label-width="formLabelWidth">
            <el-input v-model="elderForm.contactInfo" autocomplete="off"/>
          </el-form-item>
          <el-form-item label="备注" :label-width="formLabelWidth">
            <el-input v-model="elderForm.remarks" type="textarea" autocomplete="off"/>
          </el-form-item>
          <el-form-item label="创建时间" :label-width="formLabelWidth">
            <el-date-picker v-model="elderForm.createdAt" type="datetime" placeholder="选择创建时间"
                            :disabled="true"/>
          </el-form-item>
          <el-form-item label="更新时间" :label-width="formLabelWidth">
            <el-date-picker v-model="elderForm.updatedAt" type="datetime" placeholder="选择更新时间"/>
          </el-form-item>
          <el-form-item label="审核状态" :label-width="formLabelWidth">
            <el-select v-model="elderForm.reviewStatus" placeholder="请选择">
              <el-option label="未审核" value="0"/>
              <el-option label="已审核" value="1"/>
              <el-option label="审核未通过" value="-1"/>
            </el-select>
          </el-form-item>
          <el-form-item label="状态" :label-width="formLabelWidth">
            <el-select v-model="elderForm.status" placeholder="请选择">
              <el-option label="可用" value="1"/>
              <el-option label="不可用" value="0"/>
            </el-select>
          </el-form-item>
        </el-form>

        <template #footer>
          <div class="dialog-footer">
            <el-button @click="dialogTableVisible = false">取消</el-button>
            <el-button type="primary" @click="dialogFormSubmit">
              确认
            </el-button>
          </div>
        </template>
      </el-dialog>
    </el-card>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "out-office-registration",
  data() {
    return {
      // 搜索栏
      optionsIdentity: [{
        value: '0',
        label: '健康管家（护工）'
      }, {
        value: '1',
        label: '老人'
      }],
      identity: '',
      name: "",
      radioNurse: 0,
      radioNurseDisabled: false,

      // 表格、弹窗设置
      formLabelWidth: '140px',
      currentPage: 0,
      pageSize: 0,

      // todo 表格字段
      tableData: [],
      elderForm: {
        "outingId": null,
        "elderlyId": null,
        "outingDate": "",
        "outingTime": "",
        "destination": "",
        "purpose": "",
        "accompanyingPerson": null,
        "contactInfo": null,
        "remarks": null,
        "createdAt": "",
        "updatedAt": "",
        "reviewStatus": 0,
        "status": "1"
      },

      dialogTableVisible: false,
    };
  },
  mounted() {
    // axios
    //     .get("http://localhost:9090/outing-registration/getAll")
    //     .then((res) => {
    //       console.log(res.data);
    //       this.tableData = res.data;
    //     })
    //     .catch((err) => {
    //       console.error(err);
    //     });
  },
  methods: {
    identityChange() {
      if (this.identity == 1) {
        this.radioNurseDisabled = false;

      } else {
        this.radioNurseDisabled = true;
      }

      // todo 跨域请求的地址
      axios
          .get("http://localhost:9090/outing-registration/getAll")
          .then((res) => {
            console.log(res.data);
            this.tableData = res.data;
          })
          .catch((err) => {
            console.error(err);
          });
    },
    onSubmit(){
      //todo 按名字和无管家查询
      let selectLink = 'http://localhost:9090/outing-registration/getByCondition?'
      selectLink += `name=${this.form.name}`
      selectLink += `&bedNumber=${this.form.bedNumber}`
      selectLink += `&checkInTime=${this.form.checkInTime}`

      axios
          .get(selectLink)
          .then((res) => {
            this.tableData = []
            console.log(res.data);
            this.tableData = res.data;
          })
          .catch((err) => {
            console.error(err);
          });
    },
    clearAll() {
      this.identity = '';
      this.name = "";
      this.radioNurse = 0;
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
    }
  },
};
</script>
<style scoped>
table td {
  text-align: center;
}
</style>