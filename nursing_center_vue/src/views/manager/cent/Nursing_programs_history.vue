<script setup>
import {reactive, ref, onMounted} from 'vue';
import request from '@/utils/request';
import axios from "axios";
import * as XLSX from 'xlsx';
import { Message } from 'element-ui';

// 表单数据
const form = reactive({
  name: '',
  projectName: '',
});
const addForm = reactive({
  elderlyId: '',
  name: '',
  idNumber: '',
  projectName: '',
  nurseLevel: '',
  nurseName: '',
  careStatus: '',
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
  let selectLink = 'http://localhost:9090/care-record/select?';
  selectLink += `name=${form.name}`
  selectLink += `&projectName=${form.projectName}`

  axios
      .get(selectLink)
      .then((res) => {
        tableData.value = [];  // 清空之前的数据
        console.log(res.data);
        tableData.value = res.data;  // 显示查询到的护理记录
      })
      .catch((err) => {
        console.error(err);
      })
}
onMounted(() => {
  getData()
  console.log(tableData)
})
const clearAll = () => {
  form.name = '';
  form.project_name = '';
  getData();
};


const tableData = ref([]);
// 获取护理记录
const getData = () => {
  request.get('care-record/getRecord').then((res) => {
    console.log(res);
    tableData.value = res;
  });
};
// 组件挂载后获取所有数据
onMounted(() => {
  getData();
});
// 控制查看详情弹窗显示与隐藏
const detailDialogVisible = ref(false);
// 详细信息内容
const detailDialogContent = ref('');

// 查看详情的函数
const viewDetails = (index, row) => {
  const elderlyId = row.elderlyId; // 从当前选中的行获取老人的 ID

  axios
      .get(`http://localhost:9090/care-record/getRecordById`, { params: { elderlyId } }) // 发送请求，带上老人 ID
      .then((res) => {
        if (res.data && Array.isArray(res.data)) {
          detailDialogContent.value = res.data.map(record => `
          <p>
            <strong>老人姓名:</strong> ${record.name || '未提供'}<br>
            <strong>身份证号:</strong> ${record.idNumber || '未提供'}<br>
            <strong>护理项目:</strong> ${record.projectName || '未提供'}<br>
            <strong>护理等级:</strong> ${record.nurseLevel || '未提供'}<br>
            <strong>护理人:</strong> ${record.nurseName || '未提供'}<br>
            <strong>护理状态:</strong> ${record.careStatus || '未提供'}<br>
            <strong>护理状态:</strong> ${record.careStatus || '未提供'}<br>
          </p>
        `).join('<hr>');  // 拼接每一条记录的详细信息，分隔使用 <hr> 标签
          detailDialogVisible.value = true;  // 显示详情弹窗
        } else {
          Message({
            message: '未找到详细信息',
            type: 'warning',
          })
        }
      })
      .catch((err) => {
        console.error('获取护理记录失败', err);
        Message.error('获取护理记录失败，请稍后重试')
      });
};


// 移除记录的函数
const deleteRow = (index, tableData) => {
  const record = tableData[index];

  // 判断护理状态，只有护理状态为1时才能移除
  if (record.careStatus !== '1') {  // 假设护理状态是字符串 '1'
    alert('只有护理状态为1时才能移除记录');
    return;
  }

  const elderlyId = record.elderlyId;  // 获取需要移除记录的老人ID

  // 弹出确认框
  const isConfirmed = window.confirm('您确定要移除此记录吗？');

  // 发送删除请求
  axios
      .delete('http://localhost:9090/care-record/remove', { params: { elderlyId } })
      .then((res) => {
        console.log(res.data.message);  // 打印移除成功消息
        tableData.splice(index, 1);  // 从表格中移除对应的记录
        Message({
          message: '记录已成功移除',
          type: 'success',
        })
      })
      .catch((err) => {
        console.error('移除记录失败', err);
        Message.error('移除记录失败')
      });
}





const selectedRows = ref([]);
// 生成护理记录
const submitReport = () => {
  if (selectedRows.value.length === 0) {
    alert('请先选择要生成报告的条目');
    return;
  }

  let reportContent = selectedRows.value.map((data, index) => `
    第${index + 1}条:<br>
    老人编号: ${data.elderlyId || 'null'}<br>
    老人姓名: ${data.name || 'null'}<br>
    身份证号: ${data.idNumber || 'null'}<br>
    护理项目: ${data.projectName || 'null'}<br>
    护理等级: ${data.nurseLevel || 'null'}<br>
    护理人: ${data.nurseName || 'null'}<br>
    护理状态: ${data.careStatus || 'null'}<br>
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
    alert('没有可导出的记录内容！');
    return;
  }

  const blob = new Blob([reportDialogContent.value], {type: 'text/plain;charset=utf-8'});
  const link = document.createElement('a');
  link.href = URL.createObjectURL(blob);
  link.download = '护理记录.txt';
  link.click();
};

// 导出为 Excel 文件
const exportToExcel = () => {
  if (selectedRows.value.length === 0) {
    alert('请先选择要导出的条目');
    return;
  }

  const data = selectedRows.value.map(row => ({
    老人编号: row.elderlyId || 'null',
    老人姓名: row.name || 'null',
    身份证号: row.idNumber || 'null',
    护理项目: row.projectName || 'null',
    护理等级: row.nurseLevel || 'null',
    护理人: row.nurseName || 'null',
    护理状态: row.careStatus || 'null',
  }));

  const ws = XLSX.utils.json_to_sheet(data);
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, '护理记录');
  XLSX.writeFile(wb, '护理记录.xlsx');
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
        <span style="margin-left: 5px; font-size: 20px; font-weight: bolder">护理记录</span>
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
            <el-input v-model="form.projectName" placeholder="请填写项目" clearable>
              <template #prefix>
                <i class="el-icon-postcard" style="font-size: 15px; margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
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
          <span style="font-weight: bolder">生成护理记录报告</span>
        </el-button>
      </div>

      <!--表单内容-->
      <div style="margin-top: 5px">
        <el-table :data="tableData" style="width: 100%;" height="390" :stripe="true"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}" @selection-change="selectedRows = $event">
          <el-table-column type="selection" width="55"/>
          <el-table-column property="elderlyId" label="ID" width="120"/>
          <el-table-column property="name" label="姓名" width="120"/>
          <el-table-column property="idNumber" label="身份证号" width="180"/>
          <el-table-column property="projectName" label="护理项目" width="120"/>
          <el-table-column property="nurseLevel" label="护理等级" width="120"/>
          <el-table-column property="nurseName" label="护理人" width="120"/>
          <el-table-column property="careStatus" label="护理状态" width="100"/>
          <el-table-column fixed="right" label="操作" min-width="120">
            <template #default="scope">
              <el-button link type="success" size="small" plain @click="viewDetails(scope.$index, scope.row)">
                <span style="font-weight: bolder">详情</span>
              </el-button>
              <el-button link type="danger" size="small" plain @click="deleteRow(scope.$index, tableData)">
                <span style="font-weight: bolder">移除</span>
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
        title="护理记录"
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

    <!--查看详情 -->
    <el-dialog
        title="护理记录详情"
        :visible.sync="detailDialogVisible"
        width="500px"
        @close="detailDialogVisible = false"
    >
      <div v-html="detailDialogContent"></div>
    </el-dialog>


  </div>
</template>

<style scoped>
</style>

<style scoped>

</style>