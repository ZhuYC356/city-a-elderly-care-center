<template>
  <div>
    <el-card>
      <div>
        <hr style="margin: 10px">
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>
        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">护工信息</span>
        <hr style="margin: 10px">
      </div>
      <div style="margin-top: 15px;margin-left: 10px">
        <!--        查询输入框-->
        <el-form :inline="true" :model="selectFrom">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="selectFrom.name" placeholder="请填写护工姓名" clearable>
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-input v-model="selectFrom.bedNumber" placeholder="请填写工号" clearable>
              <template #prefix>
                <i class="el-icon-postcard" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-select v-model="selectFrom.nurseLevel" placeholder="选择护理等级">
              <el-option label="最高级" value="1"/>
              <el-option label="高级" value="2"/>
              <el-option label="中级" value="3"/>
              <el-option label="低级" value="4"/>
            </el-select>
          </el-form-item>
          <el-form-item style="margin-right: 15px">
            <el-button type="primary" @click="select()"><span style="font-weight: bolder">搜 索</span></el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="danger" @click="clearAll()"><span style="font-weight: bolder">清 空</span></el-button>
          </el-form-item>
        </el-form>
      </div>
      <div style="margin-top: 5px">
        <!--        表格-->
        <div>
          <el-button type="primary" @click="add()"><span style="font-weight: bolder">添加护工</span></el-button>
        </div>
        <el-table :data="tableData" style="width: 100%; margin-top: 10px" height="365" :stripe="true"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}">
          <el-table-column type="selection" width="55"/>
          <el-table-column property="name" label="姓名" width="100"/>
          <el-table-column property="gender" label="性别" width="80"/>
          <el-table-column property="age" label="年龄" width="80"/>
          <el-table-column property="idNumber" label="身份证号" width="150"/>
          <el-table-column property="contactInfo" label="联系方式" width="150"/>
          <el-table-column property="nurseLevel" label="护理等级" width="150"/>
          <el-table-column fixed="right" label="操作" min-width="120">
            <template v-slot="scope">
              <el-button link type="success" size="small" plain @click="handleClick( scope.$index,scope.row)">
                <span style="font-weight: bolder">详 情</span>
              </el-button>
              <el-button link type="primary" size="small" plain @click="update(scope.$index,scope.row)"><span
                  style="font-weight: bolder">修 改</span>
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
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
          />
        </div>
      </div>

    </el-card>
    <!--      新增护工-->
    <el-dialog :visible.sync="dialogFormVisible" title="新增护工" width="500">
      <el-form :model="riseNursing" style="margin-top: 2px">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="riseNursing.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="性别:" :label-width="formLabelWidth">
          <el-select v-model="riseNursing.gender" placeholder="选择性别">
            <el-option label="男性" value="M"/>
            <el-option label="女性" value="F"/>
          </el-select>
        </el-form-item>
        <el-form-item label="年龄:" :label-width="formLabelWidth">
          <el-input v-model="riseNursing.age" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="riseNursing.idNumber" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="联系方式:" :label-width="formLabelWidth">
          <el-input v-model="riseNursing.contactInfo" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="工作经验:" :label-width="formLabelWidth">
          <el-input v-model="riseNursing.workExperience" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="执业证书:" :label-width="formLabelWidth">
          <el-input v-model="riseNursing.professionalCertificate" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="护理等级:" :label-width="formLabelWidth">
          <el-select v-model="riseNursing.nurseLevel" placeholder="选择护理等级">
            <el-option label="最高级" value="1"/>
            <el-option label="高级" value="2"/>
            <el-option label="中级" value="3"/>
            <el-option label="低级" value="4"/>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取消</el-button>
          <el-button type="primary" @click="submit()">
            保存
          </el-button>
        </div>
      </template>
    </el-dialog>

    <!--  查看详情-->
    <el-dialog :visible.sync="dialogFormVisibleView" title="查询详情" width="500">
      <div>
        <el-form :model="viewInfo" label-width="auto" style="max-width: 600px">
          <el-form-item label="姓名" style="margin-top: 15px">
            <el-input v-model="viewInfo.name" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="性别" style="margin-top: 15px">
            <el-input v-model="viewInfo.gender" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-news" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="年龄" style="margin-top: 15px">
            <el-input v-model="viewInfo.age" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-coin" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="身份证号" style="margin-top: 15px">
            <el-input v-model="viewInfo.idNumber" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="联系方式" style="margin-top: 15px">
            <el-input v-model="viewInfo.contactInfo" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="工作经验" style="margin-top: 15px">
            <el-input v-model="viewInfo.workExperience" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="执业证书" style="margin-top: 15px">
            <el-input v-model="viewInfo.professionalCertificate" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="执业证书" style="margin-top: 15px">
            <el-input v-model="viewInfo.serviceEvaluation" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
        </el-form>
      </div>
    </el-dialog>
    <!--  修改-->
    <el-dialog :visible.sync="dialogFormVisibleUpdate" title="查询详情" width="500">
      <div>
        <el-form :model="updateInfo" label-width="auto" style="max-width: 600px">
          <el-form-item label="姓名" style="margin-top: 15px">
            <el-input v-model="updateInfo.name" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="性别" style="margin-top: 15px">
            <el-input v-model="updateInfo.gender" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-news" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="年龄" style="margin-top: 15px">
            <el-input v-model="updateInfo.age" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-coin" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="身份证号" style="margin-top: 15px">
            <el-input v-model="updateInfo.idNumber" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="联系方式" style="margin-top: 15px">
            <el-input v-model="updateInfo.contactInfo" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="工作经验" style="margin-top: 15px">
            <el-input v-model="updateInfo.workExperience" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="执业证书" style="margin-top: 15px">
            <el-input v-model="updateInfo.professionalCertificate" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="服务评价" style="margin-top: 15px">
            <el-input v-model="updateInfo.serviceEvaluation" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
        </el-form>
      </div>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="danger" @click="save()">
            <span style="font-weight: bolder">保存</span>
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>
<script>
export default {
  name: "护工管理",
  mounted() {
    this.$request.get('/nurse-info/getAll').then(res => {
      this.tableData = res.data
    })
  },
  methods: {
    submit() {
      if (this.riseNursing.name === '' ||
          this.riseNursing.gender === '' ||
          this.riseNursing.age === '' ||
          this.riseNursing.idNumber === '' ||
          this.riseNursing.contactInfo === '' ||
          this.riseNursing.workExperience === '' ||
          this.riseNursing.professionalCertificate === '' ||
          this.riseNursing.nurseLevel === ''
      ) {
        this.$message.error("请填写完整信息")
        return
      }
      this.$request.post('/nurse-info/add', this.riseNursing).then(res => {
        if (res.data === 1) {
          this.$message.success('添加成功')
          this.dialogFormVisible = false
          location.reload()
        } else {
          this.$message.error(res.msg)
        }
      })

    },
    add() {
      this.dialogFormVisible = true
    },
    handleClick(index, row) {
      console.log("row:" + row.nurseId)
      this.$request.get('/nurse-info/getById/' + row.nurseId).then(res => {
        this.viewInfo = res.data
      })
      this.dialogFormVisibleView = true
    },
    update(index, row) {
      console.log("row:" + row.nurseId)
      this.$request.get('/nurse-info/getById/' + row.nurseId).then(res => {
        this.updateInfo = res.data
      })
      this.dialogFormVisibleUpdate = true
    },
    save() {
      if (this.updateInfo.name === '' ||
          this.updateInfo.gender === '' ||
          this.updateInfo.age === '' ||
          this.updateInfo.idNumber === '' ||
          this.updateInfo.contactInfo === '' ||
          this.updateInfo.workExperience === '' ||
          this.updateInfo.professionalCertificate === '' ||
          this.updateInfo.nurseLevel === ''
      ) {
        this.$message.error("请填写完整信息")
        return
      } else {
        this.$request.post('/nurse-info/update', this.updateInfo).then(res => {
          if (res.data === 1) {
            this.$message.success('修改成功')
            this.dialogFormVisibleUpdate = false
            location.reload()
          } else {
            this.$message.error(res.msg)
          }
        })
      }
    },
    select() {

    },
    clearAll() {
      this.selectFrom = {
        name: '',
        bedNumber: '',
        checkInTime: ''
      }
    }
  },
  data() {
    return {
      updateInfo: {
        name: '',
        nurseId: '',
        gender: '',
        age: '',
        idNumber: '',
        contactInfo: '',
        workExperience: '',
        professionalCertificate: '',
        homeAddress: '',
        nurseLevel: '',
        serviceEvaluation: '',
      },
      viewInfo: {
        name: '',
        nurseId: '',
        gender: '',
        age: '',
        idNumber: '',
        contactInfo: '',
        workExperience: '',
        professionalCertificate: '',
        homeAddress: '',
        nurseLevel: '',
        serviceEvaluation: '',
      },
      riseNursing: {
        name: '',
        gender: '',
        age: '',
        idNumber: '',
        contactInfo: '',
        workExperience: '',
        professionalCertificate: '',
        homeAddress: '',
        nurseLevel: '',
      },
      dialogFormVisible: false,
      dialogFormVisibleView: false,
      dialogFormVisibleUpdate: false,
      tableData: [],
      selectFrom: {
        name: '',
        bedNumber: '',
        checkInTime: ''
      },
      formLabelWidth: '140px',
    }
  },
}
</script>
<style scoped>

</style>