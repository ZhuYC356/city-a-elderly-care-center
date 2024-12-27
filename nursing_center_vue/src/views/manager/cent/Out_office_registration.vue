<template xmlns="">
  <div>
    <el-card style="height: 630px">
      <div>
        <hr style="margin: 10px"/>
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px; font-size: 20px"></i>
        <span style="margin-left: 5px; font-size: 20px; font-weight: bolder">外出登记审核</span>
        <hr style="margin: 10px"/>
      </div>
      <div style="margin-top: 15px; margin-left: 10px">
        <el-form :inline="true" :model="form">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.name" placeholder="请填写老人姓名" clearable>
              <template #prefix>
                <i
                    class="el-icon-user"
                    style="font-size: 15px; margin-left: 3px"
                ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px" >
            <el-input
                v-model="form.bedNumber"
                placeholder="请填写床位号"
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
          <el-form-item style="margin-right: 20px">
            <el-date-picker
                v-model="form.checkInTime"
                type="date"
                placeholder="请选择入住日期"
                clearable
            />
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
      <div>
          <el-button type="primary" style="margin-left: 10px" @click="exportHandle()">
            <span style="font-weight: bolder">外出登记导出Excel表</span>
          </el-button>
      </div>
      <div style="margin-top: 5px">
        <el-table
            :data="tableData"
            style="width: 100%; margin:auto;text-align: center;"
            cell-style="text-align: center;"
            height="395"
            :stripe="true"
            :header-cell-style="{ background: '#f3f6fd', color: '#555' ,textAlign: 'center'}"
            @selection-change="selectedRows = $event"
        >
          <el-table-column type="selection" width="55"/>
          <el-table-column property="outingId" label="外出登记号" width="120"/>
          <el-table-column property="elderlyId" label="老人id号" width="120"/>
          <el-table-column property="outingDate" label="外出日期" width="120"/>
          <el-table-column property="outingTime" label="具体时间" width="120"/>
          <el-table-column property="destination" label="详细描述" width="120"/>
          <el-table-column property="purpose" label="外出目的" width="120"/>
          <el-table-column fixed="right" label="操作" min-width="120">
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
        <div style="margin-top: 10px; text-align: center;">
          <el-pagination
              v-model:current-page="currentPage"
              v-model:page-size="pageSize"
              :page-sizes="[5, 10, 20, 50]"
              :size="size"
              :disabled="disabled"
              :background="background"
              layout="total, sizes, prev, pager, next, jumper"
              :total="tableData.length"
          />
        </div>

      </div>
      <el-dialog v-model="dialogFormVisible" :visible.sync="dialogTableVisible" title="外出登记详情" width="500">
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
            <el-date-picker v-model="elderForm.createdAt" type="datetime" placeholder="选择创建时间" :disabled="true"/>
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
      tableData: [],
      selectedRows:[],
      selectedElderId:[],
      form: {
        name: "",
        bedNumber: "",
        checkInTime: "",
      },
      background: true,
      currentPage: 0,
      pageSize: 0,
      dialogTableVisible: false,
      formLabelWidth: '140px',
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
    };
  },
  mounted() {
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
  methods: {
    onSubmit() {
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
      this.form.name = "";
      this.form.bedNumber = "";
      this.form.checkInTime = "";
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
    exportHandle(){
      if(this.selectedRows.length==0){
        window.location.href='http://localhost:9090/outing-registration/export'
        this.$message({
          showClose: true,
          message: '恭喜你，导出全部数据成功',
          type: 'success'
        });
      }else{
        for(let i=0;i<this.selectedRows.length;i++){
          this.selectedElderId.push(this.selectedRows[i].outingId)
          console.log("被选中的老人id：")
          console.log(this.selectedElderId)
          if(i==this.selectedRows.length-1){
            window.location.href='http://localhost:9090/outing-registration/exportSelected?outingIds='+this.selectedElderId
            // alert('http://localhost:9090/outing-registration/exportSelected?outingIds='+this.selectedElderId)
            this.$message({
              showClose: true,
              message: '恭喜你，导出选中数据成功',
              type: 'success'
            });
            this.selectedElderId=[]
          }
        }
      }

    }
  },
};
</script>
<style scoped>
table td{
  text-align: center;
}
</style>
