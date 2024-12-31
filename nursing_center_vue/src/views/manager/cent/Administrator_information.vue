<template>
  <div>
    <el-card>
      <div>
        <hr style="margin: 10px">
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>
        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">管理员信息</span>
        <hr style="margin: 10px">
      </div>
      <div style="margin-top: 15px;margin-left: 10px">
        <!--        查询输入框-->
        <el-form :inline="true" :model="selectFrom">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="selectFrom.name" placeholder="请填写管理员姓名" clearable>
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
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
          <el-button type="primary" @click="dialogFormVisible = true"><span
              style="font-weight: bolder">添加管理员</span></el-button>
        </div>
        <el-table :data="tableData" style="width: 100%; margin-top: 10px" height="365" :stripe="true"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}">
          <el-table-column type="selection" width="55"/>
          <el-table-column property="username" label="用户名" width="100"/>
          <el-table-column property="name" label="姓名" width="100"/>
          <el-table-column label="头像" width="70">
            <template v-slot="scope">
              <div style="display: flex; align-items: center">
                <el-image style=" height: 40px; border-radius: 50%" v-if="scope.row.avatar"
                          :src="scope.row.avatar" :preview-src-list="[scope.row.avatar]"></el-image>
              </div>
            </template>
          </el-table-column>
          <el-table-column property="phone" label="电话" width="150"/>
          <el-table-column property="email" label="邮箱" width="150"/>
          <el-table-column fixed="right" label="操作" min-width="120">
            <template v-slot="scope">
              <el-button link type="primary" size="small" plain @click="update(scope.$index,scope.row)"><span
                  style="font-weight: bolder">修 改</span>
              </el-button>
              <el-button link type="danger" size="small" plain @click="deleteById(scope.$index,scope.row)">
                <span style="font-weight: bolder">删除</span>
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
    <!--      新增管理员-->
    <el-dialog :visible.sync="dialogFormVisible" title="新增管理员" width="500">
      <el-form :model="riseAdmin" style="margin-top: 2px">
<!--        <el-form-item label="用户名:" :label-width="formLabelWidth">-->
<!--          <el-input v-model="riseAdmin.username" autocomplete="off"/>-->
<!--        </el-form-item>-->
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="riseAdmin.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="电话:" :label-width="formLabelWidth">
          <el-input v-model="riseAdmin.phone" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="邮箱:" :label-width="formLabelWidth">
          <el-input v-model="riseAdmin.email" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="密码:" :label-width="formLabelWidth">
          <el-input v-model="riseAdmin.password" autocomplete="off"/>
        </el-form-item>
        <el-form-item :label-width="formLabelWidth" label="照片" prop="avatar">
          <el-upload
              :action="$baseUrl + '/files/upload'"
              list-type="picture"
              :on-success="handleCoverSuccess"
          >
            <el-button type="primary">上传照片</el-button>
          </el-upload>
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
        </el-form>
      </div>
    </el-dialog>


    <!--  修改-->
    <el-dialog :visible.sync="dialogFormVisibleUpdate" title="查询详情" width="500">
      <div>
        <el-form :model="updateInfo" label-width="auto" style="max-width: 600px">
          <el-form-item :label-width="formLabelWidth" label="照片" prop="avatar">
            <el-upload
                :action="$baseUrl + '/files/upload'"
                list-type="picture"
                :on-success="handleCoverSuccessUpdate"
            >
              <el-button type="primary">上传照片</el-button>
            </el-upload>
          </el-form-item>
          <el-form-item label="姓名" style="margin-top: 15px">
            <el-input v-model="updateInfo.name" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="手机号" style="margin-top: 15px">
            <el-input v-model="updateInfo.phone" style="width: 300px;">
              <template #prefix>
                <i class="el-icon-connection" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="邮箱" style="margin-top: 15px">
            <el-input v-model="updateInfo.email" style="width: 300px;">
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
  name: "管理员信息",
  mounted() {
    this.gayAll()
  },
  methods: {
    gayAll() {
      this.$request.get('/admin/getAll').then(res => {
        this.tableData = res.data
      })
    },
    submit() {
      if (this.riseAdmin.name === '' ||
          this.riseAdmin.phone === '') {
        this.$message.error("请填写完整信息")
      } else {
        this.$request.post('/admin/add', this.riseAdmin).then(res => {
          if (res.code === "200") {
            this.$message.success("添加成功")
            this.dialogFormVisible = false
            this.gayAll()
          } else {
            this.$message.error("添加失败")
          }
        })
      }
    },
    update(index, row) {
      console.log("row:" + row.id)
      this.updateInfo = row
      this.dialogFormVisibleUpdate = true
    },
    save() {
      this.$request.post('/admin/update', this.updateInfo).then(res => {
        if (res.code === "200") {
          this.$message.success("修改成功")
          this.dialogFormVisibleUpdate = false
          this.gayAll()
        } else {
          this.$message.error("修改失败")
        }
      })
    },
    select() {

    },
    deleteById(index, row) {
      if (!confirm("您确定删除吗？")) {
        return
      }
      this.$request.get('/admin/deleteById/' + row.id).then(res => {
        if (res.code === "200") {
          this.$message.success("删除成功")
        } else {
          this.$message.error("删除失败")
        }
      })
      this.gayAll()
    },
    clearAll() {
      this.selectFrom = {}
    },
    handleCoverSuccess(res) {
      this.riseAdmin.avatar = res.data
    },
    handleCoverSuccessUpdate(res){
      this.updateInfo.avatar = res.data
    }
  },
  data() {
    return {
      updateInfo: {
        name: '',
        phone: '',
        email: '',
        avatar: '',
        id: ''
      },
      viewInfo: {
        name: '',
        username: '',
        phone: '',
        email: '',
      },
      riseAdmin: {
        name: '',
        password: '',
        phone: '',
        email: '',
        avatar: '',
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