<script setup>
import {reactive, ref, onMounted} from 'vue';
import request from '@/utils/request';
import axios from "axios";
import * as XLSX from 'xlsx';

// 表单数据
const form = reactive({
  name: '',
  bedId: '',
  checkInDate: '',
});
const addForm = reactive({
  elderlyId: '',
  name: '',
  checkInDate: '',
  checkOutDate: '',
  bedId: '',
  checkoutType: '',
  approvalStatus: '',
  approvalPerson: '',
  approvalTime: '',
  adminId: '',
});
// 分页配置
const currentPage4 = ref(5)
const pageSize4 = ref(100)
const size = ref('large')
const background = ref(true)
const disabled = ref(false)
const handleSizeChange = () => {
  console.log();
}
const handleCurrentChange = () => {
  console.log();
}


// 搜索按钮点击事件
const onSubmit = () => {
  let selectLink = 'http://localhost:9090/check-out-requests/select?';
  selectLink += `name=${form.name}`
  selectLink += `&bedId=${form.bedId}`
  selectLink += `&checkInTime=${form.checkInDate}`

  axios
      .get(selectLink)
      .then((res) => {
        tableData.value = []
        console.log(res.data);
        tableData.value = res.data;
      })
      .catch((err) => {
        console.error(err);
      });
}
onMounted(() => {
  getData()
  console.log(tableData)
})
const clearAll = () => {
  form.name = '';
  form.bedId = '';
  form.checkInDate = '';
  getData();
};


const tableData = ref([]);
// 获取退住请求
const getData = () => {
  request.get('check-out-requests/gainAll').then((res) => {
    console.log(res);
    tableData.value = res;
  });
};
// 组件挂载后获取所有数据
onMounted(() => {
  getData();
});


// 同意申请
const handleAgree = (index,row) => {
  addForm.value=row
  addForm.value.adminId=1
  let flag = row.approvalStatus
  if (flag == 2) {
    alert("审批状态不为“2”才可以点击同意喔~")
    return
  }
  console.log("审批")
  console.log(addForm.value)
  axios.post('http://localhost:9090/check-out-requests/agree', addForm.value)
      .then((response) => {
        if (response.data.msg=='成功'){
          alert('提交成功')
          console.log(response);
          // location.reload()
          getData()
        }
        else {
          alert('糟糕！提交失败')
        }
      })
      .catch((error) => {
        alert('糟糕！提交失败')
        console.log(error);
      });
};

// 撤销申请
const handleRevoke = (index,row) => {
  addForm.value=row
  addForm.value.adminId=1
  let itemData = tableData.value[index];
  let flag = itemData.approvalStatus
  if (flag == 1 || flag == 3 ) {
    alert("审批状态为“2”才可以点击撤销喔~")
    return
  }
  console.log("审批")
  console.log(addForm.value)
  axios.post('http://localhost:9090/check-out-requests/revoke', addForm.value)
      .then((response) => {
        if (response.data.msg=='成功'){
          alert('提交成功')
          console.log(response);
          // location.reload()
          getData()
        }
        else {
          alert('糟糕！提交失败')
        }
      })
      .catch((error) => {
        alert('糟糕！提交失败')
        console.log(error);
      });
};

const updateTableRowStatus = (elderlyId, status) => {
  const row = tableData.value.find(item => item.approvalStatus === approvalStatus);
  if (row) {
    row.approvalStatus = status; // 更新表格中的状态
  }
}

const selectedRows = ref([]);
// 生成审批报告
const submitReport = () => {
  if (selectedRows.value.length === 0) {
    alert('请先选择要生成报告的条目');
    return;
  }

  let reportContent = selectedRows.value.map((data, index) => `
    第${index + 1}条:<br>
    姓名: ${data.name || 'null'}<br>
    床位号: ${data.bedId || 'null'}<br>
    入住日期: ${data.checkInDate || 'null'}<br>
    退住日期: ${data.checkOutDate || 'null'}<br>
    退住类型: ${data.checkoutType || 'null'}<br>
    审核状态: ${data.approvalStatus || 'null'}<br>
    审批人: ${data.approvalPerson || 'null'}<br>
    审批时间: ${data.approvalTime || 'null'}<br>
  `).join('<br>');
  // 显示报告内容
  reportDialogContent.value = reportContent;
  reportDialogVisible.value = true;

};



// 弹窗显示报告
const reportDialogVisible = ref(false);
const reportDialogContent = ref('');


// 导出为 TXT 文件
const exportToTxt = () => {
  if (!reportDialogContent.value) {
    alert('没有可导出的报告内容！');
    return;
  }

  const blob = new Blob([reportDialogContent.value], { type: 'text/plain;charset=utf-8' });
  const link = document.createElement('a');
  link.href = URL.createObjectURL(blob);
  link.download = '审批报告.txt';
  link.click();
};

// 导出为 Excel 文件
const exportToExcel = () => {
  if (selectedRows.value.length === 0) {
    alert('请先选择要导出的条目');
    return;
  }

  const data = selectedRows.value.map(row => ({
    姓名: row.name || 'null',
    床位号: row.bedId || 'null',
    入住日期: row.checkInDate || 'null',
    退住日期: row.checkOutDate || 'null',
    退住类型: row.checkoutType || 'null',
    审核状态: row.approvalStatus || 'null',
    审批人: row.approvalPerson || 'null',
    审批时间: row.approvalTime || 'null',
  }));

  const ws = XLSX.utils.json_to_sheet(data);
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, '审批报告');
  XLSX.writeFile(wb, '审批报告.xlsx');
};
</script>

<template>
  <div>
    <el-card style="height: 630px">
      <div>
        <hr style="margin: 10px"/>
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px; font-size: 20px"></i>
        <span style="margin-left: 5px; font-size: 20px; font-weight: bolder">退住登记审核</span>
        <hr style="margin: 10px"/>
      </div>

      <!--      搜索条件：-->
      <div style="margin-top: 15px; margin-left: 10px">
        <el-form :inline="true" :model="form">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.name" placeholder="请填写老人姓名" clearable>
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px; margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.bedId" placeholder="请填写床号" clearable>
              <template #prefix>
                <i class="el-icon-postcard" style="font-size: 15px; margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
<!--            <el-date-picker
                v-model="form.checkInDate"
                type="datetime"
                placeholder="请选择入住日期"
                value-format="yyyy-MM-dd hh:mm:ss"
                clearable
            />-->

          </el-form-item>
          <el-form-item style="margin-right: 15px">
            <el-button type="primary" @click="onSubmit">
              <span style="font-weight: bolder">搜 索</span>
            </el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="danger" @click="clearAll">
              <span style="font-weight: bolder">清 空</span>
            </el-button>
          </el-form-item>
        </el-form>
      </div>

      <!--生成审批报告-->
      <div>
        <el-button type="primary" style="margin-left: 10px" @click="submitReport">
          <span style="font-weight: bolder">生成审批信息报告</span>
        </el-button>
      </div>

      <!--表单内容-->
      <div style="margin-top: 5px">
        <el-table :data="tableData" style="width: 100%;" height="390" :stripe="true"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}" @selection-change="selectedRows = $event">
          <el-table-column type="selection" width="55"/>
          <el-table-column property="elderlyId" label="ID" width="80"/>
          <el-table-column property="name" label="姓名" width="120"/>
          <el-table-column property="checkInDate" label="入住日期" width="120"/>
          <el-table-column property="checkOutDate" label="退住日期" width="120"/>
          <el-table-column property="bedId" label="床位号" width="80"/>
          <el-table-column property="checkoutType" label="退住类型" width="80"/>
          <el-table-column property="approvalStatus" label="审核状态" width="80"/>
          <el-table-column property="approvalPerson" label="审批人" width="80"/>
          <el-table-column property="approvalTime" label="审批时间" width="120"/>
          <el-table-column fixed="right" label="操作" min-width="120">
            <template #default="scope">
              <el-button link type="success" size="small" @click="handleAgree(scope.$index, scope.row)">
                <span style="font-weight: bolder">同意</span>
              </el-button>
              <el-button link type="primary" size="small" @click="handleRevoke(scope.$index, scope.row)">
                <span style="font-weight: bolder">撤销</span>
              </el-button>
            </template>
          </el-table-column>
        </el-table>

        <!--分页-->
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


    <el-dialog
        title="审批报告"
        :visible.sync="reportDialogVisible"
        width="40%"
        @close="reportDialogVisible = false"
    >
      <!-- 使用 v-html 渲染内容 -->
      <div v-html="reportDialogContent"></div>

      <!-- 添加导出按钮 -->
      <div style="margin-top: 20px; text-align: center;">
        <el-button type="primary" @click="exportToTxt">
          导出为 TXT格式
        </el-button>
        <el-button type="success" @click="exportToExcel" style="margin-left: 40px;">
          导出为 Excel格式
        </el-button>
      </div>
    </el-dialog>

<!--    &lt;!&ndash; 同意申请弹窗 &ndash;&gt;
    <el-dialog
        title="同意申请"
        :visible.sync="agreeDialogVisible"
        width="30%"
        @close="agreeDialogVisible = false"
    >
      <el-form :model="addForm" label-width="auto">
        <el-form-item label="审批人" style="margin-top: 15px">
          <el-input v-model="approvalPerson"/>
        </el-form-item>
        <el-form-item label="审批时间" style="margin-top: 15px">
          <el-date-picker v-model="approvalTime" type="datetime"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitAgree">提交</el-button>
          <el-button @click="agreeDialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    &lt;!&ndash; 撤销申请弹窗 &ndash;&gt;
    <el-dialog
        title="撤销申请"
        :visible.sync="revokeDialogVisible"
        width="30%"
        @close="revokeDialogVisible = false"
    >
      <el-form :model="addForm" label-width="auto">
        <el-form-item label="撤销人" style="margin-top: 15px">
          <el-input v-model="addForm.approvalPerson"/>
        </el-form-item>
        <el-form-item label="审批时间" style="margin-top: 15px">
          <el-date-picker v-model="addForm.approvalTime" type="datetime"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitRevoke">提交</el-button>
          <el-button @click="revokeDialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>-->

    <!-- 审批报告弹窗 -->


  </div>
</template>

<style scoped>
</style>

<style scoped>

</style>