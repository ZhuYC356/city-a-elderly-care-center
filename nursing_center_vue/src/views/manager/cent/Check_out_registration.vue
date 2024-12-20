<!--<script setup>-->
<!--import {reactive, ref,onMounted} from 'vue'-->
<!--import request from "@/utils/request";-->
<!--const form = reactive({-->
<!--  name: '',-->
<!--  bedId: '',-->
<!--  checkInDate: ''-->
<!--})-->
<!--const addForm = reactive({-->
<!--  elderlyId: '',-->
<!--  name: '',-->
<!--  checkInDate: '',-->
<!--  checkOutDate: '',-->
<!--  bedId: '',-->
<!--  checkoutType: '',-->
<!--  approvalStatus: '',-->
<!--  approvalPerson: '',-->
<!--  approvalTime: '',-->
<!--})-->
<!--// 提交搜索请求-->
<!--const onSubmit = () => {-->
<!--  /*alert('提交')*/-->
<!--  request.post("check-out-requests/select",form).then(res => {-->
<!--    console.log(res)-->
<!--    tableData.value=res-->
<!--  })-->
<!--}-->
<!--// 清空-->
<!--const clearAll = () => {-->
<!--  form.name = ''-->
<!--  form.bedId = ''-->
<!--  form.checkInDate = ''-->
<!--  getData()-->
<!--}-->
<!--const tableData = ref([])-->
<!--// 获取数据-->
<!--const getData = () => {-->
<!--  request.get("check-out-requests/list").then(res => {-->
<!--    console.log(res)-->
<!--    tableData.value=res-->
<!--  })-->
<!--}-->


<!--// 组件挂载后获取所有数据-->
<!--onMounted(() => {-->
<!--  getData()-->
<!--})-->
<!--const dialogFormVisible = ref(false)-->
<!--//同意申请-->
<!--const handleClick = () => {-->
<!--  /*alert('点击了详情')*/-->
<!--  dialogFormVisible.value=true-->
<!--}-->
<!--const update = () => {-->
<!--  alert('点击了修改')-->
<!--}-->
<!--const currentPage4 = ref(5)-->
<!--const pageSize4 = ref(100)-->
<!--const size = ref('large')-->
<!--const background = ref(true)-->
<!--const disabled = ref(false)-->
<!--const handleSizeChange = () => {-->
<!--  console.log();-->
<!--}-->
<!--const handleCurrentChange = () => {-->
<!--  console.log();-->
<!--}-->
<!--const drawer = ref(false)-->
<!--const toggle = () => {-->
<!--  drawer.value = !drawer.value-->
<!--}-->
<!--const submit=() => {-->
<!--  alert('提交')-->
<!--}-->

<!--</script>-->

<!--<template>-->
<!--  <div>-->
<!--    <el-card style="height: 630px">-->
<!--      <div>-->
<!--        <hr style="margin: 10px">-->
<!--        <el-icon>-->
<!--          <Notebook/>-->
<!--        </el-icon>-->
<!--        <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>-->
<!--        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">退住登记审核</span>-->
<!--        <hr style="margin: 10px">-->
<!--      </div>-->
<!--      <div style="margin-top: 15px;margin-left: 10px">-->
<!--        <el-form :inline="true" :model="form">-->
<!--          <el-form-item style="margin-right: 20px">-->
<!--            <el-input v-model="form.name" placeholder="请填写老人姓名" clearable>-->
<!--              <template #prefix>-->
<!--                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px" ></i>-->
<!--              </template>-->
<!--            </el-input>-->
<!--          </el-form-item>-->
<!--          <el-form-item style="margin-right: 20px">-->
<!--            <el-input v-model="form.bedNumber" placeholder="请填写床位号" clearable>-->
<!--              <template #prefix>-->
<!--                <i class="el-icon-postcard" style="font-size: 15px;margin-left: 3px" ></i>-->
<!--              </template>-->
<!--            </el-input>-->
<!--          </el-form-item>-->
<!--          <el-form-item style="margin-right: 20px">-->
<!--            <el-date-picker-->
<!--                v-model="form.date"-->
<!--                type="date"-->
<!--                placeholder="请选择入住日期"-->
<!--                clearable-->
<!--            />-->
<!--          </el-form-item>-->
<!--          <el-form-item style="margin-right: 15px">-->
<!--            <el-button type="primary" @click="onSubmit"><span style="font-weight: bolder">搜 索</span></el-button>-->
<!--          </el-form-item>-->
<!--          <el-form-item>-->
<!--            <el-button type="danger" @click="clearAll"><span style="font-weight: bolder">清 空</span></el-button>-->
<!--          </el-form-item>-->
<!--        </el-form>-->
<!--      </div>-->
<!--      <div>-->
<!--        <el-button type="primary" style="margin-left: 10px" @click="toggle"><span-->
<!--            style="font-weight: bolder">生成审批信息报告</span></el-button>-->
<!--        <el-drawer title="I am the title" :with-header="false" :visible.sync="drawer">-->
<!--          <div style="margin: 15px">-->
<!--            <span style="font-weight: bolder;font-size: 15px">添加床位</span>-->
<!--            <el-form :model="addForm" label-width="auto" style="max-width: 600px">-->
<!--              <el-form-item label="姓名" style="margin-top: 15px">-->
<!--                <el-input v-model="addForm.name" style="width: 300px;">-->
<!--                  <template #prefix>-->
<!--                    <i class="el-icon-user" style="font-size: 15px;margin-left: 3px" ></i>-->
<!--                  </template>-->
<!--                </el-input>-->
<!--              </el-form-item>-->

<!--              <el-form-item label="性别" style="margin-top: 15px">-->
<!--                <el-input v-model="addForm.name" style="width: 300px;">-->
<!--                  <template #prefix>-->
<!--                    <i class="el-icon-toilet-paper" style="font-size: 15px;margin-left: 3px" ></i>-->
<!--                  </template>-->
<!--                </el-input>-->
<!--              </el-form-item>-->
<!--              <el-form-item style="margin-right: 20px;" label="出生日期">-->
<!--                <el-date-picker-->
<!--                    v-model="form.date"-->
<!--                    type="date"-->
<!--                    placeholder="请选择入住日期"-->
<!--                    clearable-->
<!--                    style="width: 300px"-->
<!--                />-->
<!--              </el-form-item>-->
<!--              <el-form-item label="监护人电话" style="margin-top: 15px">-->
<!--                <el-input v-model="addForm.name" style="width: 300px;">-->
<!--                  <template #prefix>-->
<!--                    <i class="el-icon-phone" style="font-size: 15px;margin-left: 3px" ></i>-->
<!--                  </template>-->
<!--                </el-input>-->
<!--              </el-form-item>-->
<!--              <el-form-item label="楼号" style="margin-top: 15px">-->
<!--                <el-input v-model="addForm.name" style="width: 300px;">-->
<!--                  <template #prefix>-->
<!--                    <i class="el-icon-s-home" style="font-size: 15px;margin-left: 3px" ></i>-->
<!--                  </template>-->
<!--                </el-input>-->
<!--              </el-form-item>-->
<!--              <el-form-item label="房间号" style="margin-top: 15px">-->
<!--                <el-input v-model="addForm.name" style="width: 300px;">-->
<!--                  <template #prefix>-->
<!--                    <i class="el-icon-film" style="font-size: 15px;margin-left: 3px" ></i>-->
<!--                  </template>-->
<!--                </el-input>-->
<!--              </el-form-item>-->
<!--              <el-form-item label="床位号" style="margin-top: 15px">-->
<!--                <el-input v-model="addForm.name" style="width: 300px;">-->
<!--                  <template #prefix>-->
<!--                    <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>-->
<!--                  </template>-->
<!--                </el-input>-->
<!--              </el-form-item>-->
<!--              <el-button link type="success" size="small" @click="submit" style="margin-left: 20px">-->
<!--                <span style="font-weight: bolder">提 交</span>-->
<!--              </el-button>-->
<!--            </el-form>-->
<!--          </div>-->
<!--          <div>-->



<!--          </div>-->
<!--        </el-drawer>-->
<!--      </div>-->
<!--      <div style="margin-top: 5px">-->
<!--        <el-table :data="tableData" style="width: 100%;" height="390" :stripe="true"-->
<!--                  :header-cell-style="{background:'#f3f6fd',color:'#555'}">-->
<!--          <el-table-column type="selection" width="55"/>-->
<!--          <el-table-column property="elderlyId" label="ID" width="80"/>-->
<!--          <el-table-column property="name" label="姓名" width="120"/>-->
<!--&lt;!&ndash;          <el-table-column label="出生日期" width="120">-->
<!--            <template #default="scope">{{ scope.row.date }}</template>-->
<!--          </el-table-column>&ndash;&gt;-->
<!--          <el-table-column property="checkInDate" label="入住日期" width="120"/>-->
<!--          <el-table-column property="checkOutDate" label="退住日期" width="120"/>-->
<!--&lt;!&ndash;          <el-table-column property="roomNumber" label="房间号" width="80"/>&ndash;&gt;-->
<!--          <el-table-column property="bedId" label="床位号" width="80"/>-->
<!--          <el-table-column property="checkoutType" label="退住类型" width="80"/>-->
<!--          <el-table-column property="approvalStatus" label="审核状态" width="80"/>-->
<!--          <el-table-column property="approvalPerson" label="审批人" width="80"/>-->
<!--          <el-table-column property="approvalTime" label="审批时间" width="120"/>-->
<!--          <el-table-column fixed="right" label="Operations" min-width="120">-->
<!--            <template #default>-->
<!--              <el-button link type="success" size="small" @click="handleClick">-->
<!--                <span style="font-weight: bolder">同意申请</span>-->
<!--              </el-button>-->
<!--              <el-dialog  width="50%" :visible.sync="dialogFormVisible" :append-to-body="true">-->
<!--                <div>-->
<!--                  <span></span>-->
<!--                </div>-->
<!--              </el-dialog>-->
<!--              <el-button link type="primary" size="small" @click="update"><span style="font-weight: bolder">撤销申请</span>-->
<!--              </el-button>-->
<!--            </template>-->
<!--          </el-table-column>-->
<!--        </el-table>-->
<!--        <div style="margin-top: 10px">-->
<!--          <el-pagination-->
<!--              v-model:current-page="currentPage4"-->
<!--              v-model:page-size="pageSize4"-->
<!--              :page-sizes="[100, 200, 300, 400]"-->
<!--              :size="size"-->
<!--              :disabled="disabled"-->
<!--              :background="background"-->
<!--              layout="total, sizes, prev, pager, next, jumper"-->
<!--              :total="400"-->
<!--              @size-change="handleSizeChange"-->
<!--              @current-change="handleCurrentChange"-->
<!--          />-->
<!--        </div>-->
<!--      </div>-->
<!--    </el-card>-->
<!--  </div>-->
<!--</template>-->

<script setup>
import { reactive, ref, onMounted } from 'vue';
import request from '@/utils/request';

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
});

// 表单操作
const onSubmit = () => {
  request.post('check-out-requests/select', form).then((res) => {
    console.log(res);
    tableData.value = res;
  });
};

const clearAll = () => {
  form.name = '';
  form.bedId = '';
  form.checkInDate = '';
  getData();
};

const tableData = ref([]);

// 获取数据
const getData = () => {
  request.get('check-out-requests/list').then((res) => {
    console.log(res);
    tableData.value = res;
  });
};

// 组件挂载后获取所有数据
onMounted(() => {
  getData();
});

// 弹窗控制
const agreeDialogVisible = ref(false);
const revokeDialogVisible = ref(false);

// 同意申请
const handleAgree = (row) => {
  addForm.elderlyId = row.elderlyId; // 记录被同意的条目ID
  agreeDialogVisible.value = true;
};

// 撤销申请
const handleRevoke = (row) => {
  addForm.elderlyId = row.elderlyId; // 记录被撤销的条目ID
  revokeDialogVisible.value = true;
};

// 提交同意申请
const submitAgree = () => {
  if (!addForm.approvalPerson || !addForm.approvalTime) {
    alert('请填写审批人和审批时间');
    return;
  }

  // 发送同意请求
  request.post('check-out-requests/agree', { ...addForm }).then(() => {
    // 更新表格状态
    updateTableRowStatus(addForm.elderlyId, '同意');
    agreeDialogVisible.value = false;
  });
};

// 提交撤销申请
const submitRevoke = () => {
  if (!addForm.approvalPerson || !addForm.approvalTime) {
    alert('请填写撤销人和撤销时间');
    return;
  }

  // 发送撤销请求
  request.post('check-out-requests/revoke', { ...addForm }).then(() => {
    // 更新表格状态
    updateTableRowStatus(addForm.elderlyId, '撤销');
    revokeDialogVisible.value = false;
  });
};

const updateTableRowStatus = (elderlyId, status) => {
  const row = tableData.value.find(item => item.elderlyId === elderlyId);
  if (row) {
    row.approvalStatus = status; // 更新表格中的状态
  }
};

const currentPage4 = ref(5);
const pageSize4 = ref(100);
const selectedRows = ref([]);

// 生成审批报告
const submitReport = () => {
  if (selectedRows.value.length === 0) {
    alert('请先选择要生成报告的条目');
    return;
  }

  let reportContent = selectedRows.value.map((data, index) => `
    ---- 第${index + 1}条 ----
    姓名: ${data.name}
    床位号: ${data.bedId}
    入住日期: ${data.checkInDate}
    退住日期: ${data.checkOutDate}
    退住类型: ${data.checkoutType}
    审核状态: ${data.approvalStatus}
    审批人: ${data.approvalPerson}
    审批时间: ${data.approvalTime}
  `).join('\n');

  reportDialogContent.value = reportContent;
  reportDialogVisible.value = true;
};

// 弹窗显示报告
const reportDialogVisible = ref(false);
const reportDialogContent = ref('');
</script>

<template>
  <div>
    <el-card style="height: 630px">
      <div>
        <hr style="margin: 10px" />
        <el-icon>
          <Notebook />
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px; font-size: 20px"></i>
        <span style="margin-left: 5px; font-size: 20px; font-weight: bolder">退住登记审核</span>
        <hr style="margin: 10px" />
      </div>

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
            <el-input v-model="form.bedId" placeholder="请填写床位号" clearable>
              <template #prefix>
                <i class="el-icon-postcard" style="font-size: 15px; margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-date-picker
                v-model="form.checkInDate"
                type="date"
                placeholder="请选择入住日期"
                clearable
            />
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

      <div>
        <el-button type="primary" style="margin-left: 10px" @click="submitReport">
          <span style="font-weight: bolder">生成审批信息报告</span>
        </el-button>
      </div>

      <!-- 同意申请弹窗 -->
      <el-dialog
          title="同意申请"
          :visible.sync="agreeDialogVisible"
          width="30%"
          @close="agreeDialogVisible = false"
      >
        <el-form :model="addForm" label-width="auto">
          <el-form-item label="审批人" style="margin-top: 15px">
            <el-input v-model="addForm.approvalPerson" />
          </el-form-item>
          <el-form-item label="审批时间" style="margin-top: 15px">
            <el-date-picker v-model="addForm.approvalTime" type="datetime" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitAgree">提交</el-button>
            <el-button @click="agreeDialogVisible = false">取消</el-button>
          </el-form-item>
        </el-form>
      </el-dialog>

      <!-- 撤销申请弹窗 -->
      <el-dialog
          title="撤销申请"
          :visible.sync="revokeDialogVisible"
          width="30%"
          @close="revokeDialogVisible = false"
      >
        <el-form :model="addForm" label-width="auto">
          <el-form-item label="撤销人" style="margin-top: 15px">
            <el-input v-model="addForm.approvalPerson" />
          </el-form-item>
          <el-form-item label="撤销时间" style="margin-top: 15px">
            <el-date-picker v-model="addForm.approvalTime" type="datetime" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitRevoke">提交</el-button>
            <el-button @click="revokeDialogVisible = false">取消</el-button>
          </el-form-item>
        </el-form>
      </el-dialog>

      <!-- 审批报告弹窗 -->
      <el-dialog
          title="审批报告"
          :visible.sync="reportDialogVisible"
          width="60%"
          @close="reportDialogVisible = false"
      >
        <el-pre>{{ reportDialogContent }}</el-pre>
      </el-dialog>

      <div style="margin-top: 5px">
        <el-table :data="tableData" style="width: 100%;" height="390" :stripe="true" :header-cell-style="{background:'#f3f6fd',color:'#555'}" @selection-change="selectedRows = $event">
          <el-table-column type="selection" width="55" />
          <el-table-column property="elderlyId" label="ID" width="80" />
          <el-table-column property="name" label="姓名" width="120" />
          <el-table-column property="checkInDate" label="入住日期" width="120" />
          <el-table-column property="checkOutDate" label="退住日期" width="120" />
          <el-table-column property="bedId" label="床位号" width="80" />
          <el-table-column property="checkoutType" label="退住类型" width="80" />
          <el-table-column property="approvalStatus" label="审核状态" width="80" />
          <el-table-column property="approvalPerson" label="审批人" width="80" />
          <el-table-column property="approvalTime" label="审批时间" width="120" />
          <el-table-column fixed="right" label="操作" min-width="120">
            <template #default="scope">
              <el-button link type="success" size="small" @click="handleAgree(scope.row)">
                <span style="font-weight: bolder">同意申请</span>
              </el-button>
              <el-button link type="primary" size="small" @click="handleRevoke(scope.row)">
                <span style="font-weight: bolder">撤销申请</span>
              </el-button>
            </template>
          </el-table-column>
        </el-table>

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
          />
        </div>
      </div>
    </el-card>
  </div>
</template>

<style scoped>
</style>

<style scoped>

</style>