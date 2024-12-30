<script setup>
import {ref,reactive,onMounted} from "vue";
import request from "@/utils/request";
import {success,error} from "@/utils/success"
const form=reactive({
  projectName:"",
  maxPrice:'',
  minPrice:'',
  pageSize:'5',
  pageNum:'1'
})
let total=ref('');
const handleCurrentChange=(val)=>{
  form.pageNum=val
  request.post('care-project/select',form).then(res=>{
    console.log(res.data)
    tableData.value=res.data
  })
}
const handleSizeChange=(val)=>{
  form.pageSize=val
  request.post('care-project/select',form).then(res=>{
    tableData.value=res.data
  })
}
const background=ref('true')
const tableData=ref('')
const getData=()=>{
  request.get('care-project/getData').then(res=>{
    total.value=res.data.length
  })
}
onMounted(()=>{
  select()
  getData()
})
const select=()=>{
  request.post('care-project/select',form).then(res=>{
    tableData.value=res.data
  })

}
const clearAll=()=>{
  form.projectName=''
  form.maxPrice=''
  form.minPrice=''
}
const rules = ({
  minPrice: [
    // { min: form.maxPrice, max: 5,required: true, message: '最小值不能大于最大值', trigger: 'blur' },
    // { type: 'number', message: '该内容需要填写数字', trigger: 'blur' },
    { Range: true ,min:1,max: form.maxPrice, message: '大于最大值', trigger: 'blur' },
  ],
  maxPrice: [
    { min: form.minPrice,  message: '该值必须大于最低项目价格', trigger: 'blur' },
  ],
  projectName: [
    { required: true,  message: '项目名称不能为空', trigger: 'blur' },
  ],
  price: [
    { required: true,  message: '项目价格不能为空', trigger: 'blur' },
  ],
  serviceDuration: [
    { required: true,  message: '项目服务时长不能为空', trigger: 'blur' },
  ],
  frequency: [
    { required: true,  message: '项目频率不能为空', trigger: 'blur' },
  ],
  nurseLevel: [
    { required: true,  message: '项目服务等级不能为空', trigger: 'blur' },
  ],
})
const selectable = (row, index) => {
  return row.isActive
}
const rowClass = ({row, index}) => {
  if (row.isActive === false) {
    return { "background-color": 'rgb(241,241,241)',"color":'rgb(175,175,175)'}
  }
}
const changeSwitch=(index,row)=>{
  console.log(row)
  request.get("care-project/changeActive/"+row.isActive+"/"+row.projectId).then(res=>{
    success()
  }).catch(err=>{
    fail()
  })
  rowClass({row, index})
}
const drawer=ref(false)
const toggleDrawer=()=>{
  drawer.value=!drawer.value
}
const addFormRef=ref(null)
const addForm=reactive({
  projectName:'',
  description:'',
  serviceDuration:'',
  price:'',
  frequency:'',
  nurseLevel:''
})
const addProject=()=>{
  addFormRef.value.validate((valid)=>{
    if(valid){
      console.log(addForm.serviceDuration.toString())
      request.post("care-project/addProject",addForm).then(res=>{
        success()
        drawer.value=false
      }).catch(err=>{
        error()
      })
      getData()
      select()
    }
    else {
      error()
    }
  })

}
const clear=()=>{
  addForm.description=''
  addForm.serviceDuration=''
  addForm.price=''
  addForm.frequency=''
  addForm.nurseLevel=''
  addForm.projectName=''
}
const dialogFormVisible=ref(false)
const update=(index,row)=>{
  updateForm.projectId=row.projectId
  updateForm.projectName=row.projectName
  updateForm.description=row.description
  updateForm.serviceDuration=row.serviceDuration
  updateForm.price=row.price
  updateForm.frequency=row.frequency
  updateForm.nurseLevel=row.nurseLevel
  dialogFormVisible.value=true
}
const updateForm=reactive({
  projectId:'',
  projectName:'',
  description:'',
  serviceDuration:'',
  price:'',
  frequency:'',
  nurseLevel:''
})
const cancelUpdate=()=>{
  dialogFormVisible.value=false
}
const updateFormRef=ref(false)
const updateProject=()=>{
  updateFormRef.value.validate((valid)=>{
    if(valid){
      request.post("care-project/updateProject",updateForm).then(res=>{
        dialogFormVisible.value=false
        success()
        select()
      }).catch(err=>{})
    }
  })
}
const deleteProject=(index,row)=>{
  request.get("care-project/deleteProject/"+row.projectId).then(res=>{
    success()
  }).catch(err=>{
    error()
  })
  select()
  getData()
}
</script>

<template>
  <div>
    <el-card style="height: 630px">
      <div>
        <hr style="margin: 10px">
        <i class="el-icon-office-building" style="margin-left: 30px;font-size: 20px"></i>
        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">护理项目</span>
        <hr style="margin: 10px">
      </div>
      <div style="margin-top: 15px;margin-left: 10px">
        <el-form :inline="true" :model="form" :rules="rules" ref="formRef">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.projectName" placeholder="请填写项目名称" clearable>
              <template #prefix>
                <i class="el-icon-box" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px" prop="minPrice">
            <el-input v-model="form.minPrice" placeholder="请填写最低服务价格" clearable style="width: 190px">
              <template #prefix>
                <i class="el-icon-money" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-input v-model="form.maxPrice" placeholder="请填写最高服务价格" clearable style="width: 190px">
              <template #prefix>
                <i class="el-icon-money" style="font-size: 15px;margin-left: 3px" ></i>
              </template>
            </el-input>
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
        <el-button type="primary" style="margin-left: 10px" @click="toggleDrawer"><span
            style="font-weight: bolder">添加新项目</span></el-button>
      </div>

      <el-drawer title="I am the title" :with-header="false" :visible.sync="drawer">
        <div style="margin: 15px">
          <span style="font-weight: bolder;font-size: 15px">添加新项目</span>
          <el-form :model="addForm" label-width="auto" style="max-width: 600px;margin-top: 15px" :rules="rules" ref="addFormRef">
            <el-form-item label="项目名称" prop="projectName">
              <el-input v-model="addForm.projectName" placeholder="请输入项目名称" class="myInput"/>
            </el-form-item>
            <el-form-item label="项目描述">
              <el-input v-model="addForm.description" type="textarea" class="myInput" placeholder="请填写项目描述"/>
            </el-form-item>
            <el-form-item label="服务时长" prop="serviceDuration">
              <el-time-picker v-model="addForm.serviceDuration"  placeholder="请填写项目持续时间"  class="myInput"/>
            </el-form-item>
            <el-form-item label="服务价格" prop="price" >
              <el-input v-model="addForm.price" placeholder="请输入项目价格（元）" class="myInput"/>
            </el-form-item>
            <el-form-item label="服务频率" prop="frequency" >
              <el-select v-model="addForm.frequency" placeholder="请选择服务频率">
                <el-option label="每天" value="W" />
                <el-option label="每月" value="D" />
                <el-option label="每周" value="M" />
              </el-select>
            </el-form-item>
            <el-form-item label="护理等级" style="margin-bottom: 25px" prop="nurseLevel">
              <el-select v-model="addForm.nurseLevel" placeholder="请选择服务等级">
                <el-option label="最高级" value="1" />
                <el-option label="高级" value="2" />
                <el-option label="中级" value="3" />
                <el-option label="低级" value="4" />
              </el-select>
            </el-form-item>
            <el-button link type="success" size="small" @click="addProject" style="margin-left: 5px">
              <span style="font-weight: bolder">提 交</span>
            </el-button>
            <el-button link type="danger" size="small" @click="clear" style="margin-left: 20px">
              <span style="font-weight: bolder">清 空</span>
            </el-button>
          </el-form>
        </div>
        <div>
        </div>
      </el-drawer>


      <div style="margin-top: 5px">
        <el-table :data="tableData" style="width: 100%;" height="390"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}" :row-style="rowClass" >
          <el-table-column type="selection" width="55" :selectable="selectable"/>
          <el-table-column property="projectName" label="项目名称" width="120"/>
          <el-table-column property="description" label="项目描述" width="130"/>
          <el-table-column property="serviceDuration" label="服务时长" width="130"/>
          <el-table-column property="price" label="服务价格" width="120"/>
          <el-table-column property="frequency" label="服务频率" width="120"/>
          <el-table-column property="nurseLevel" label="护理等级" width="120"/>
          <el-table-column fixed="right" label="状态(启用/停用)" min-width="120">
            <template #default="scope">
              <el-switch v-model="scope.row.isActive" @change="changeSwitch(scope.$index,scope.row)"/>
            </template>
          </el-table-column>
          <el-table-column fixed="right" label="操作" min-width="120">
            <template #default="scope">
              <el-button link type="primary" size="small" @click="update(scope.$index,scope.row)"><span style="font-weight: bolder">修 改</span>
              </el-button>
              <el-button link type="danger" size="small" @click="deleteProject(scope.$index,scope.row)"><span style="font-weight: bolder">删 除</span>
              </el-button>
            </template>
          </el-table-column>
        </el-table>


        <el-dialog  width="50%" :visible.sync="dialogFormVisible" :append-to-body="true">
          <div>
            <span style="font-weight: bolder;font-size: 15px">项目修改</span>
            <el-form :model="updateForm" label-width="auto" style="max-width: 600px" :rules="rules"  ref="updateFormRef">
              <el-form-item label="项目名称" prop="projectName" style="margin-top: 15px">
                <el-input v-model="updateForm.projectName" placeholder="请输入项目名称" class="myInput"/>
              </el-form-item>
              <el-form-item label="项目描述">
                <el-input v-model="updateForm.description" type="textarea" class="myInput" placeholder="请填写项目描述"/>
              </el-form-item>
              <el-form-item label="服务时长" prop="serviceDuration">
                <el-time-picker v-model="updateForm.serviceDuration"  placeholder="请填写项目持续时间"  class="myInput"/>
              </el-form-item>
              <el-form-item label="服务价格" prop="price" >
                <el-input v-model="updateForm.price" placeholder="请输入项目价格（元）" class="myInput"/>
              </el-form-item>
              <el-form-item label="服务频率" prop="frequency" >
                <el-select v-model="updateForm.frequency" placeholder="请选择服务频率">
                  <el-option label="每天" value="W" />
                  <el-option label="每月" value="D" />
                  <el-option label="每周" value="M" />
                </el-select>
              </el-form-item>
              <el-form-item label="护理等级" style="margin-bottom: 25px" prop="nurseLevel">
                <el-select v-model="updateForm.nurseLevel" placeholder="请选择服务等级">
                  <el-option label="最高级" value="1" />
                  <el-option label="高级" value="2" />
                  <el-option label="中级" value="3" />
                  <el-option label="低级" value="4" />
                </el-select>
              </el-form-item>
            </el-form>
          </div>
          <template #footer>
            <div class="dialog-footer">
              <el-button @click="updateProject" type="primary"><span style="font-weight: bolder">确 认</span></el-button>
              <el-button type="danger" @click="cancelUpdate">
                <span style="font-weight: bolder">取 消</span>
              </el-button>
            </div>
          </template>
        </el-dialog>

        <div style="margin-top: 10px">
          <el-pagination
              v-model:current-page="form.pageNum"
              :page-sizes="[5, 15, 20, 25]"
              :background="background"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total"
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