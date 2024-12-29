<template>
  <div class="card">
    <div>
      <hr style="margin: 10px">
      <el-icon>
        <Notebook/>
      </el-icon>
      <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>
      <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">服务关注</span>
      <hr style="margin: 10px">
    </div>



    <el-row :gutter="20" style="margin: 20px">
      <el-col :span="6">
        <el-input v-model="search" size="large" clearable placeholder="请输入客户姓名" prefix-icon="el-icon-search">
          <template #prepend>
            <h3 style="color: #409EFF">查询客户信息</h3>
          </template>
        </el-input>
      </el-col>
    </el-row>



    <el-table :data="filterTableData" stripe :border="false" style="width: 100%"
              max-height="600">
      <el-table-column type="expand">
        <template #default="props">
          <div m="4" style="width: 90%;margin: auto;">
            <h2>护理服务项目</h2>
            <el-table :data="props.row.careProjectForElderlyList" :border="true"
                      :row-class-name="tableRowClassName"
                      highlight-current-row>
              <el-table-column label="项目名称" prop="projectName" />
              <el-table-column label="护理项目描述" prop="description" />
              <el-table-column label="项目服务状态" prop="careStatus" />
              <el-table-column sortable label="服务时长" prop="careEndTime" />
              <el-table-column sortable label="价格" prop="price" />
              <el-table-column label="操作">
                <el-button style="color: #3f9dfd" @click="serviceProjectRenew = true">续费</el-button>
                <el-button type="danger" plain @click="serviceProjectDelete = true">移除</el-button>
              </el-table-column>
            </el-table>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="姓名" prop="name" />
      <el-table-column label="性别" prop="gender" />
      <el-table-column label="年龄" prop="age" />
      <el-table-column label="身份证号" prop="idNumber" />
      <el-table-column label="护工名" prop="nurseName" />
      <el-table-column label="操作">
        <el-button type="success" plain @click="drawer = true">购买护理项目</el-button>
      </el-table-column>
    </el-table>




    <el-dialog
        title="护理项目续费"
        :visible.sync="serviceProjectRenew"
        width="30%"
        center>
      <el-form :label-position="labelPosition" label-width="80px" :model="formLabelAlign">
        <el-form-item label="续费项目">
          <el-input v-model="formLabelAlign.name" placeholder="项目名，不能自己改" disabled></el-input>
        </el-form-item>
        <el-form-item label="续费时长">
          <el-input v-model="formLabelAlign.region"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="serviceProjectRenew = false" plain>取 消</el-button>
        <el-button type="primary" plain @click="serviceProjectRenew = false">确 定</el-button>
      </span>
    </el-dialog>



    <el-dialog
        title="提示"
        :visible.sync="serviceProjectDelete"
        width="30%"
        center>
      <h2 style="text-align: center;color: #F56C6C">确定要移除该项目吗？</h2>
      <span slot="footer" class="dialog-footer">
        <el-button @click="serviceProjectDelete = false" plain>取 消</el-button>
        <el-button type="danger" plain  @click="serviceProjectDelete = false">确 定</el-button>
      </span>
    </el-dialog>


    <el-drawer
        title="购买护理项目"
        :visible.sync="drawer"
        :direction="direction"
        size="40%">
      <div style="display: flex;">
        <el-card style="width: 50%;margin: 1%">
          <template #header>
            <div class="card-header">
              <span>项目1</span>
            </div>
          </template>
          <p v-for="o in 4" :key="o" class="text item">{{ '项目内容 ' + o }}</p>
          <template #footer>底部内容</template>
        </el-card>

        <el-card style="width: 50%;margin: 1%">
          <template #header>
            <div class="card-header">
              <span>项目2</span>
            </div>
          </template>
          <p v-for="o in 4" :key="o" class="text item">{{ '项目内容 ' + o }}</p>
          <template #footer>底部内容</template>
        </el-card>
      </div>

      <div style="display: flex;">
        <el-card style="width: 50%;margin: 1%">
          <template #header>
            <div class="card-header">
              <span>项目3</span>
            </div>
          </template>
          <p v-for="o in 4" :key="o" class="text item">{{ '项目内容 ' + o }}</p>
          <template #footer>底部内容</template>
        </el-card>

        <el-card style="width: 50%;margin: 1%">
          <template #header>
            <div class="card-header">
              <span>项目4</span>
            </div>
          </template>
          <p v-for="o in 4" :key="o" class="text item">{{ '项目内容 ' + o }}</p>
          <template #footer>底部内容</template>
        </el-card>
      </div>

      <div style="display: flex;">
        <el-card style="width: 50%;margin: 1%">
          <template #header>
            <div class="card-header">
              <span>项目5</span>
            </div>
          </template>
          <p v-for="o in 4" :key="o" class="text item">{{ '项目内容 ' + o }}</p>
          <template #footer>底部内容</template>
        </el-card>

      </div>
    </el-drawer>



  </div>
</template>

<style>

</style>

<script setup>
import {computed, onMounted, ref} from 'vue'
import axios from "axios";

const serviceProjectRenew = ref(false);
const serviceProjectDelete = ref(false);

const tableData = ref([]);


const getAllElderlyProjects = () => {
  // 发送 GET 请求到后端
  axios.get('http://localhost:9090/care-record/getAllElderlyProjects')
      .then(response => {
        console.log('从后端成功获取服务关注的信息:', response.data);
        tableData.value = response.data;
        console.log('打印tableData的内容:', tableData.value);
      })
      .catch(error => {
        console.error('错误:', error);
      });
}
onMounted(()=>{
  getAllElderlyProjects()
})


const search = ref('')
const filterTableData = computed(() =>
    tableData.value.filter(
        (data) =>
            !search.value ||
            data.name.toLowerCase().includes(search.value.toLowerCase())
    )
)


const labelPosition = ref('right');
const formLabelAlign = ref({
  name: '',
  region: '',
  type: ''
});



const drawer = ref(false);
const direction = ref('ltr');



</script>