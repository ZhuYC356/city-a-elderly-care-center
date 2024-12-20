/**
* @name: Bunk_manager
* @description: 床位管理
* @author: wct
* @date: 2023/2/13 14:06
*/
<script setup>
import {reactive, ref,onMounted} from 'vue'
import request from "@/utils/request";
const form = reactive({
  name: '',
  bedNumber: '',
  date: ''
})
const addForm = reactive({
  name: '',
  bedNumber: '',
  date: '',
  gender: '',
  familyContactInfo: '',
  floorNumber: '',
  roomNumber: ''
})
const onSubmit = () => {
  alert('提交')
}
const clearAll = () => {
  form.name = ''
  form.bedNumber = ''
  form.date = ''
}
const tableData = ref("")
const getAll = () => {
  request.get("bed-info/getAll").then(res => {
    tableData.value=res.data
  })
}
const select=()=>{
  request.post("bed-info/select",form).then(res=>{
    console.log(res)
    tableData.value=res.data;
  })
}
onMounted(()=>{
  getAll()
  console.log(tableData)
})
const handleClick = (index,row) => {
  console.log(index)
  console.log(row)
}

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
const drawer = ref(false)
const toggle = () => {
  drawer.value = !drawer.value
}
const submit=() => {
  alert('提交')
}


const dialogFormVisible = ref(false)
const update=()=>{
  dialogFormVisible.value=true
}
const updateForm = reactive({
  name: '',
  gender:'',
  date: '',
  floorNumber: '',
  bedNumber: '',
  newBedNumber: ''
})
</script>

<template>
  <div>
    <el-card style="height: 630px">
      <div>
        <hr style="margin: 10px">
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>
        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">床位管理</span>
        <hr style="margin: 10px">
      </div>
      <div style="margin-top: 15px;margin-left: 10px">
        <el-form :inline="true" :model="form">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.name" placeholder="请填写老人姓名" clearable>
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.bedNumber" placeholder="请填写床位号" clearable>
              <template #prefix>
                <i class="el-icon-postcard" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-date-picker
                v-model="form.date"
                type="date"
                placeholder="请选择入住日期"
                clearable
            />
          </el-form-item>
          <el-form-item style="margin-right: 15px">
            <el-button type="primary" @click="select"><span style="font-weight: bolder">搜 索</span></el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="danger" @click="clearAll"><span style="font-weight: bolder">清 空</span></el-button>
          </el-form-item>
        </el-form>
      </div>
      <div>
        <el-button type="primary" style="margin-left: 10px" @click="toggle"><span
            style="font-weight: bolder">添加床位</span></el-button>
        <el-drawer title="I am the title" :with-header="false" :visible.sync="drawer">
          <div style="margin: 15px">
            <span style="font-weight: bolder;font-size: 15px">添加床位</span>
            <el-form :model="addForm" label-width="auto" style="max-width: 600px">
              <el-form-item label="姓名" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-user" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>

              <el-form-item label="性别">
                <el-select v-model="addForm.gender" placeholder="请选择性别">
                  <template #prefix>
                    <i class="el-icon-toilet-paper" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                  <el-option label="男" value="男" />
                  <el-option label="女" value="女" />
                </el-select>
              </el-form-item>

              <el-form-item style="margin-right: 20px;" label="出生日期">
                <el-date-picker
                    v-model="form.date"
                    type="date"
                    placeholder="请选择入住日期"
                    clearable
                    style="width: 300px"
                />
              </el-form-item>
              <el-form-item label="监护人电话" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-phone" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>
              <el-form-item label="楼号" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-s-home" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>
              <el-form-item label="房间号" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-film" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>
              <el-form-item label="床位号" style="margin-top: 15px">
                <el-input v-model="addForm.name" style="width: 300px;">
                  <template #prefix>
                    <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                </el-input>
              </el-form-item>
              <el-button link type="success" size="small" @click="submit" style="margin-left: 20px">
                <span style="font-weight: bolder">提 交</span>
              </el-button>
            </el-form>
          </div>
          <div>

          </div>
        </el-drawer>
      </div>

      <div style="margin-top: 5px">
        <el-table :data="tableData" style="width: 100%;" height="390" :stripe="true"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}">
          <el-table-column type="selection" width="55"/>
          <el-table-column property="name" label="姓名" width="120"/>
          <el-table-column property="gender" label="性别" width="120"/>
          <el-table-column label="入住时间" width="120">
            <template #default="scope">{{ scope.row.date }}</template>
          </el-table-column>
          <el-table-column property="familyContactInfo" label="监护人电话" width="120"/>
          <el-table-column property="floorNumber" label="楼号" width="120"/>
          <el-table-column property="roomNumber" label="房间号" width="120"/>
          <el-table-column property="bedNumber" label="床位号" width="120"/>
          <el-table-column fixed="right" label="Operations" min-width="120">
            <template #default="scope">
              <el-button link type="success" size="small" @click="handleClick(scope.$index,scope.row)">
                <span style="font-weight: bolder">详 情</span>
              </el-button>
              <el-button link type="primary" size="small" @click="update"><span style="font-weight: bolder">修 改</span>
              </el-button>
              <el-dialog  width="50%" :visible.sync="dialogFormVisible" :append-to-body="true">
                <div>
                  <span style="font-weight: bolder;font-size: 15px">床位调换</span>
                  <el-form :model="updateForm" label-width="auto" style="max-width: 600px">
                    <el-form-item label="姓名" style="margin-top: 15px">
                      <el-input v-model="addForm.name" style="width: 300px;" placeholder="请输入姓名">
                        <template #prefix>
                          <i class="el-icon-user" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                      </el-input>
                    </el-form-item>
                    <el-form-item label="性别">
                      <el-select v-model="updateForm.gender" placeholder="请选择性别">
                        <el-option label="男" value="男" />
                        <el-option label="女" value="女" />
                      </el-select>
                    </el-form-item>
                    <el-form-item label="楼号" style="margin-top: 15px">
                      <el-input v-model="updateForm.floorNumber" style="width: 300px;" placeholder="请输入楼号">
                        <template #prefix>
                          <i class="el-icon-s-home" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                      </el-input>
                    </el-form-item>
                    <el-form-item style="margin-right: 20px;margin-top: 15px" label="出生日期">
                      <el-date-picker
                          v-model="updateForm.date"
                          type="date"
                          placeholder="请选择日期"
                          clearable
                          style="width: 300px"
                      />
                    </el-form-item>
                    <el-form-item style="margin-right: 20px;margin-top: 15px" label="现床位号">
                      <el-input v-model="updateForm.bedNumber" placeholder="请填写现在床位号" clearable style="width: 300px">
                        <template #prefix>
                          <i class="el-icon-postcard" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                      </el-input>
                    </el-form-item>
                    <el-form-item style="margin-right: 20px;margin-top: 15px" label="新床位号">
                      <el-input v-model="updateForm.newBedNumber" placeholder="请填写你要调换的床位号" clearable style="width: 300px">
                        <template #prefix>
                          <i class="el-icon-tickets" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                      </el-input>
                    </el-form-item>
                  </el-form>

                </div>
                <template #footer>
                  <div class="dialog-footer">
                    <el-button @click="dialogFormVisible = false" type="primary"><span style="font-weight: bolder">确 认</span></el-button>
                    <el-button type="danger" @click="dialogFormVisible = false">
                      <span style="font-weight: bolder">取 消</span>
                    </el-button>
                  </div>
                </template>

              </el-dialog>
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
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
          />
        </div>
      </div>
    </el-card>
  </div>
</template>

<style scoped>

</style>