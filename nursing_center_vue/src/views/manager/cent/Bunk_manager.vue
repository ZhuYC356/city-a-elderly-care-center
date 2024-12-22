/**
* @name: Bunk_manager
* @description: 床位管理
* @author: wct
* @date: 2023/2/13 14:06
*/
<script setup>
import {reactive, ref,onMounted,onUnmounted} from 'vue'
import request from "@/utils/request";
const form = reactive({
  name: '',
  bedNumber: '',
  date: ''
})
const addForm = reactive({
  bedNumber: '',
  bedType: '',
  bedStatus: '',
  floorNumber: '',
  roomNumber: '',
  floor:''
})
const clearAll = () => {
  form.name = ''
  form.bedNumber = ''
  form.date = ''
}
const tableData = ref("")
const getAll = () => {
  request.get("bed-info/getAll").then(res => {
    tableData.value=res.data
    console.log("res")
    console.log(res.data)
  })
}
const select=()=>{
  request.post("bed-info/select",form).then(res=>{
    console.log(res)
    tableData.value=res.data;
  })
}
// 显示当前时间
let currentDate=ref("")
onMounted(()=>{
  getAll()
  const interval = setInterval(() => {
    const now = new Date();
    currentDate.value = `${now.getFullYear()}/${now.getMonth() + 1}/${now.getDate()} `;
    updateForm.date=currentDate.value;
  }, 1000);
  // 在Vue实例销毁前，清除时间定时器
    onUnmounted(()=>{
      clearInterval(interval)
    })
  })
const dialogDetail = ref(false)
const detailForm = reactive({
  address: '',
  age: '',
  checkInTime: '',
  familyContactInfo: '',
  name: '',
  gender:'',
  floorNumber: '',
  bedNumber: '',
  roomNumber: '',
  selfCareStatus:'',
  idNumber: '',
})
const detail = (index,row) => {
    dialogDetail.value=true
    detailForm.address=row.address
    detailForm.age=row.age
    detailForm.checkInTime=row.checkInTime
    detailForm.familyContactInfo=row.familyContactInfo
    detailForm.name=row.name
    detailForm.gender=row.gender
    detailForm.floorNumber=row.floorNumber
    detailForm.bedNumber=row.bedNumber
    detailForm.roomNumber=row.roomNumber
    detailForm.selfCareStatus=row.selfCareStatus
    detailForm.idNumber=row.idNumber
}
const cancelDetail = () => {
  dialogDetail.value=false
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
const addBed=() => {
  console.log(addForm)
  request.post("bed-info/addBed",addForm).then(res=>{
    if(res.data=1){
      alert("添加成功")
      drawer.value=false
      clearAddForm()
    }
  })
}
const clearAddForm=()=>{
  addForm.bedNumber=''
  addForm.bedType=''
  addForm.bedStatus=''
  addForm.floorNumber=''
  addForm.roomNumber=''
  addForm.floor=''
}

const dialogFormVisible = ref(false)
const update=(index,row)=>{
  updateForm.name=row.name
  updateForm.gender=row.gender
  updateForm.bedNumber=row.bedNumber
  updateForm.roomNumber=row.roomNumber
  dialogFormVisible.value=true
}
const updateBed=()=>{
  request.post("bed-info/updateBed",updateForm).then(res=>{
      if(res.status=200){
        alert("修改成功")
        getAll()
      }
  })
  dialogFormVisible.value=false
  updateForm.floorNumber=''
  updateForm.newBedNumber=''
  updateForm.newRoomNumber=''
}
const cancelUpdate = () => {
  updateForm.floorNumber=''
  updateForm.newBedNumber=''
  updateForm.newRoomNumber=''
  dialogFormVisible.value=false
  }
const updateForm = reactive({
  name: '',
  gender:'',
  date: '',
  floorNumber: '',
  bedNumber: '',
  roomNumber: '',
  newRoomNumber: '',
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
            style="font-weight: bolder">添加新床位</span></el-button>
        <el-drawer title="I am the title" :with-header="false" :visible.sync="drawer">
          <div style="margin: 15px">
            <span style="font-weight: bolder;font-size: 15px">添加床位</span>
<!--            添加-&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;-->
            <el-form :model="addForm" label-width="auto" style="max-width: 600px;margin-top: 15px">
              <el-form-item label="床位号">
                <el-select v-model="addForm.bedNumber" placeholder="选择床位">
                  <template #prefix>
                    <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                  <el-option label="1" value="1"/>
                  <el-option label="2" value="2"/>
                  <el-option label="3" value="3"/>
                  <el-option label="4" value="4"/>
                </el-select>
              </el-form-item>
              <el-form-item label="床位类型">
                <el-select v-model="addForm.bedType" placeholder="请选择床位类型">
                  <template #prefix>
                    <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                  <el-option label="1" value="1"/>
                  <el-option label="2" value="2"/>
                </el-select>
              </el-form-item>
              <el-form-item label="床位状态">
                <el-select v-model="addForm.bedStatus" placeholder="请选择床位状态">
                  <template #prefix>
                    <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                  <el-option label="1" value="1"/>
                  <el-option label="2" value="2"/>
                  <el-option label="3" value="3"/>
                  <el-option label="4" value="4"/>
                  <el-option label="5" value="4"/>
                  <el-option label="6" value="4"/>
                  <el-option label="7" value="4"/>
                  <el-option label="8" value="4"/>
                </el-select>
              </el-form-item>
              <el-form-item label="楼号">
                <el-select v-model="addForm.floorNumber" placeholder="请选择楼号">
                  <template #prefix>
                    <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                  <el-option label="5号楼" value="1"/>
                  <el-option label="6号楼" value="2"/>
                  <el-option label="7号楼" value="3"/>
                  <el-option label="8号楼" value="4"/>
                </el-select>
              </el-form-item>
              <el-form-item label="房间号">
                <el-select v-model="addForm.roomNumber" placeholder="请选择房间号">
                  <template #prefix>
                    <i class="el-icon-film" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                  <el-option label="101" value="1"/>
                  <el-option label="102" value="2"/>
                  <el-option label="103" value="3"/>
                  <el-option label="104" value="4"/>
                </el-select>
              </el-form-item>
              <el-form-item label="楼层">
                <el-select v-model="addForm.floor" placeholder="请选择楼层">
                  <template #prefix>
                    <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
                  </template>
                  <el-option label="5号楼" value="1"/>
                  <el-option label="6号楼" value="2"/>
                  <el-option label="7号楼" value="3"/>
                  <el-option label="8号楼" value="4"/>
                </el-select>
              </el-form-item>
              <el-button link type="success" size="small" @click="addBed" style="margin-left: 20px">
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
            <template #default="scope">{{ scope.row.checkInTime }}</template>
          </el-table-column>
          <el-table-column property="familyContactInfo" label="监护人电话" width="120"/>
          <el-table-column property="floorNumber" label="楼号" width="120"/>
          <el-table-column property="roomNumber" label="房间号" width="120"/>
          <el-table-column property="bedNumber" label="床位号" width="120"/>
          <el-table-column fixed="right" label="Operations" min-width="120">
            <template #default="scope">
              <el-button link type="success" size="small" @click="detail(scope.$index,scope.row)">
                <span style="font-weight: bolder">详 情</span>
              </el-button>
              <el-button link type="primary" size="small" @click="update(scope.$index,scope.row)"><span style="font-weight: bolder">修 改</span>
              </el-button>
              <el-dialog  width="50%" :visible.sync="dialogFormVisible" :append-to-body="true">
                <div>
                  <span style="font-weight: bolder;font-size: 15px">床位调换</span>
                  <el-form :model="updateForm" label-width="auto" style="max-width: 600px" >
                    <el-form-item label="姓名" style="margin-top: 15px">
                      <el-input v-model="updateForm.name" style="width: 300px;"  disabled>
                        <template #prefix>
                          <i class="el-icon-user" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                      </el-input>
                    </el-form-item>
                    <el-form-item label="性别">
                      <el-select v-model="updateForm.gender" disabled style="width: 300px;" >
                      </el-select>
                    </el-form-item>
                    <el-form-item label="楼号">
                      <el-select v-model="updateForm.floorNumber" placeholder="请选择楼号" style="width: 300px;" >
                        <template #prefix>
                          <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                        <el-option label="5号楼" value="1"/>
                        <el-option label="6号楼" value="2"/>
                        <el-option label="7号楼" value="3"/>
                        <el-option label="8号楼" value="4"/>
                      </el-select>
                    </el-form-item>

                    <el-form-item style="margin-right: 20px;margin-top: 15px" label="入住日期">
                      <el-date-picker
                          v-model="updateForm.date"
                          type="date"
                          clearable
                          style="width: 300px"
                          disabled="true"
                      />
                    </el-form-item>
                    <el-form-item label="现房间号">
                      <el-input v-model="updateForm.roomNumber" disabled style="width: 300px;">
                        <template #prefix>
                          <i class="el-icon-film" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                      </el-input>
                    </el-form-item>
                    <el-form-item label="新房间号">
                      <el-select v-model="updateForm.newRoomNumber" placeholder="请选择新房间号" style="width: 300px;">
                        <template #prefix>
                          <i class="el-icon-film" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                        <el-option label="101" value="101"/>
                        <el-option label="102" value="102"/>
                        <el-option label="103" value="103"/>
                        <el-option label="104" value="104"/>
                      </el-select>
                    </el-form-item>

                    <el-form-item style="margin-right: 20px;margin-top: 15px" label="现床位号">
                      <el-input v-model="updateForm.bedNumber" disabled clearable style="width: 300px">
                        <template #prefix>
                          <i class="el-icon-postcard" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                      </el-input>
                    </el-form-item>
                    <el-form-item label="新床位号">
                      <el-select v-model="updateForm.newBedNumber" placeholder="请选择新的床位号" style="width: 300px">
                        <template #prefix>
                          <i class="el-icon-tickets" style="font-size: 15px;margin-left: 3px" ></i>
                        </template>
                        <el-option label="1" value="1"/>
                        <el-option label="2" value="2"/>
                        <el-option label="3" value="3"/>
                        <el-option label="4" value="4"/>
                      </el-select>
                    </el-form-item>
                  </el-form>

                </div>
                <template #footer>
                  <div class="dialog-footer">
                    <el-button @click="updateBed" type="primary"><span style="font-weight: bolder">确 认</span></el-button>
                    <el-button type="danger" @click="cancelUpdate">
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

    <el-dialog  width="50%" :visible.sync="dialogDetail" :append-to-body="true">
      <div>
        <span style="font-weight: bolder;font-size: 15px">床位详情</span>
        <el-form :model="detailForm" label-width="auto" style="max-width: 600px" >
          <el-form-item label="姓名" style="margin-top: 15px">
            <el-input v-model="detailForm.name" style="width: 300px;"  disabled>
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="性别" style="margin-top: 15px">
            <el-input v-model="detailForm.gender" style="width: 300px;"  disabled>
              <template #prefix>
                <i class="el-icon-news" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="年龄" style="margin-top: 15px">
            <el-input v-model="detailForm.age" style="width: 300px;"  disabled>
              <template #prefix>
                <i class="el-icon-coin" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="省份证号" style="margin-top: 15px">
            <el-input v-model="detailForm.idNumber" style="width: 300px;"  disabled>
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="家庭住址" style="margin-top: 15px">
            <el-input v-model="detailForm.address" style="width: 300px;"  disabled>
              <template #prefix>
                <i class="el-icon-place" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="监护人联系方式" style="margin-top: 15px">
            <el-input v-model="detailForm.familyContactInfo" style="width: 300px;"  disabled>
              <template #prefix>
                <i class="el-icon-phone" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="自理能力" style="margin-top: 15px">
            <el-input v-model="detailForm.selfCareStatus" style="width: 300px;"  disabled>
              <template #prefix>
                <i class="el-icon-wind-power" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px;margin-top: 15px" label="入住日期">
            <el-date-picker
                v-model="detailForm.checkInTime"
                type="date"
                clearable
                style="width: 300px"
                disabled="true"
            />
          </el-form-item>
          <el-form-item label="楼号" style="margin-top: 15px">
            <el-input v-model="detailForm.floorNumber" style="width: 300px;"  disabled>
              <template #prefix>
                <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>


          <el-form-item label="房间号">
            <el-input v-model="detailForm.roomNumber" disabled style="width: 300px;">
              <template #prefix>
                <i class="el-icon-film" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>

          <el-form-item style="margin-right: 20px;margin-top: 15px" label="床位号">
            <el-input v-model="detailForm.bedNumber" disabled clearable style="width: 300px">
              <template #prefix>
                <i class="el-icon-postcard" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>

        </el-form>

      </div>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="danger" @click="cancelDetail">
            <span style="font-weight: bolder">退 出</span>
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>

</style>