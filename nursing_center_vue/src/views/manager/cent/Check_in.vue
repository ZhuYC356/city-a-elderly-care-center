<template>
  <div>
    <el-card>
      <div>
        <hr style="margin: 10px">
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>
        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">入住登记信息</span>
        <hr style="margin: 10px">
      </div>
      <div style="margin-top: 15px;margin-left: 10px">
        <!--        上端按钮-->
        <el-button style="margin-bottom: 10px;background-color: #37a9e3" plain icon="el-icon-plus" plain
                   @click="dialogFormVisible = true">
          入住登记
        </el-button>
        <el-button style="margin-bottom: 10px;background-color: #f3ac34" plain icon="el-icon-plus" plain
                   @click="dialogFormVisible1 = true">
          退住登记申请
        </el-button>
        <el-button style="margin-bottom: 10px;background-color: #84d570" plain icon="el-icon-plus" plain
                   @click="dialogFormVisible2 = true">
          外出登记申请
        </el-button>

        <!--        查询界面-->
        <el-form :inline="true" :model="selectFrom">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="selectFrom.name" placeholder="请填写老人姓名" clearable>
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-input v-model="selectFrom.bedNumber" placeholder="请填写床位号" clearable>
              <template #prefix>
                <i class="el-icon-postcard" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px">
            <el-date-picker
                v-model="selectFrom.date"
                type="date"
                placeholder="请选择入住日期"
                clearable
            />
          </el-form-item>
          <el-form-item style="margin-right: 15px">
            <el-button type="primary" @click="onSubmit"><span style="font-weight: bolder">搜 索</span></el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="danger" @click="clearAll"><span style="font-weight: bolder">清 空</span></el-button>
          </el-form-item>
        </el-form>
      </div>
      <div style="margin-top: 5px">
        <el-table :data="elderlyList" style="width: 100%;" height="365" :stripe="true"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}">
          <el-table-column type="selection" width="55"/>
          <el-table-column property="name" label="姓名" width="120"/>
          <el-table-column property="gender" label="性别" width="120"/>
          <el-table-column property="age" label="年龄" width="120"/>
          <el-table-column property="familyContactInfo" label="家庭联系人电话" width="120"/>
          <el-table-column property="floorNumber" label="楼号" width="120"/>
          <el-table-column property="roomNumber" label="房间号" width="120"/>
          <el-table-column property="bedNumber" label="床位号" width="120"/>
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

    <!--新增入住登记-->
    <el-dialog :visible.sync="dialogFormVisible" title="新增入住登记" width="500">
      <el-form :model="riseElderly">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="riseElderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="riseElderly.idNumber" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="riseElderly.familyContactInfo" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身体状况描述:" :label-width="formLabelWidth">
          <el-input v-model="riseElderly.physicalCondition" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="性别:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.gender" placeholder="选择性别">
            <el-option label="男性" value="M"/>
            <el-option label="女性" value="F"/>
          </el-select>
        </el-form-item>
        <el-form-item label="自理等级:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.selfCareStatus" placeholder="选择自理等级">
            <el-option label="不自理" value="1"/>
            <el-option label="部分自理" value="2"/>
            <el-option label="自理" value="3"/>
          </el-select>
        </el-form-item>
        <el-form-item label="护理等级:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.nurseLevel" placeholder="选择护理等级">
            <el-option label="最高级" value="1"/>
            <el-option label="高级" value="2"/>
            <el-option label="中级" value="3"/>
            <el-option label="低级" value="4"/>
          </el-select>
        </el-form-item>
        <el-form-item label="选择护工:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.nurseId" placeholder="选择护工">
            <el-option label="张三" value="1"/>
            <el-option label="李四" value="2"/>
            <el-option label="王五" value="3"/>
            <el-option label="赵六" value="4"/>
          </el-select>
        </el-form-item>
        <el-form-item label="选择楼号:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.floorNumber" placeholder="选择楼号">
            <el-option label="5号楼" value="1"/>
            <el-option label="6号楼" value="2"/>
            <el-option label="7号楼" value="3"/>
            <el-option label="8号楼" value="4"/>
          </el-select>
        </el-form-item>
        <el-form-item label="选择房间号:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.roomNumber" placeholder="选择房间号">
            <el-option label="101" value="1"/>
            <el-option label="102" value="2"/>
            <el-option label="103" value="3"/>
            <el-option label="104" value="4"/>
          </el-select>
        </el-form-item>
        <el-form-item label="选择床位:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.bedId" placeholder="选择床位">
            <el-option label="1" value="1"/>
            <el-option label="2" value="2"/>
            <el-option label="3" value="3"/>
            <el-option label="4" value="4"/>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取消</el-button>
          <el-button type="primary" @click="add()">
            保存
          </el-button>
        </div>
      </template>
    </el-dialog>


    <!--  退住申请-->
    <el-dialog :visible.sync="dialogFormVisible1" title="退住登记申请" width="500">
      <el-form :model="checkOutRequests">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="checkOutRequests.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="checkOutRequests.idNumber" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="checkOutRequests.familyContactInfo" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="原因描述:" :label-width="formLabelWidth">
          <el-input v-model="checkOutRequests.checkoutReason" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="退住类型:" :label-width="formLabelWidth">
          <el-select v-model="checkOutRequests.checkoutType" placeholder="退住类型">
            <el-option label="正常退住" value="1"/>
            <el-option label="死亡退住" value="2"/>
            <el-option label="保留床位" value="3"/>
          </el-select>
        </el-form-item>
        <el-form-item style="margin-right: 20px" label="外出时间:">
          <el-date-picker
              v-model="checkOutRequests.checkoutDate"
              type="date"
              placeholder="请选择外出时间:"
              clearable
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible1 = false">取消</el-button>
          <el-button type="primary" @click="dialogFormVisible1 = false">
            提交审核
          </el-button>
        </div>
      </template>
    </el-dialog>

    <!--  外出申请-->
    <el-dialog :visible.sync="dialogFormVisible2" title="外出登记申请" width="500">
      <el-form :model="outingRegistration">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.idNumber" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.familyContactInfo" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="外出原因:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.outingReason" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="外出目的地:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.purpose" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="外出陪同人:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.accompanyingPerson" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="外出陪同人联系方式:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.contactInfo" autocomplete="off"/>
        </el-form-item>
        <el-form-item style="margin-right: 20px" label="外出时间:">
          <el-date-picker
              v-model="selectFrom.date"
              type="date"
              placeholder="请选择外出时间:"
              clearable
          />
        </el-form-item>
        <el-form-item label="外出陪同人联系方式:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="紧急联系方式:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.name" autocomplete="off"/>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible2 = false">取消</el-button>
          <el-button type="primary" @click="dialogFormVisible2 = false">
            保存
          </el-button>
        </div>
      </template>
    </el-dialog>

    <!--  查看详情-->
    <el-dialog :visible.sync="dialogFormVisible3" title="查询详情" width="500">
      <el-form :model="viewInfo">
        <!--        展示数据所有老人的数据-->
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="dialogFormVisible3 = false">
            关闭
          </el-button>
        </div>
      </template>
    </el-dialog>

    <!--  修改信息-->
    <el-dialog :visible.sync="dialogFormVisible4" title="修改信息" width="500">
      <el-form :model="updateInfo">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="updateInfo.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="updateInfo.idNumber" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="updateInfo.familyContactInfo" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身体状况描述:" :label-width="formLabelWidth">
          <el-input v-model="updateInfo.physicalCondition" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="性别:" :label-width="formLabelWidth">
          <el-select v-model="updateInfo.gender" placeholder="选择性别">
            <el-option label="男性" value="M"/>
            <el-option label="女性" value="F"/>
          </el-select>
        </el-form-item>
        <el-form-item label="自理等级:" :label-width="formLabelWidth">
          <el-select v-model="updateInfo.selfCareStatus" placeholder="选择自理等级">
            <el-option label="不自理" value="1"/>
            <el-option label="部分自理" value="2"/>
            <el-option label="自理" value="3"/>
          </el-select>
        </el-form-item>
        <el-form-item label="护理等级:" :label-width="formLabelWidth">
          <el-select v-model="updateInfo.nurseLevel" placeholder="选择护理等级">
            <el-option label="最高级" value="1"/>
            <el-option label="高级" value="2"/>
            <el-option label="中级" value="3"/>
            <el-option label="低级" value="4"/>
          </el-select>
        </el-form-item>
        <el-form-item label="更改护工:" :label-width="formLabelWidth">
          <el-select v-model="updateInfo.nurseId" placeholder="更改护工">
            <el-option label="张三" value="1"/>
            <el-option label="李四" value="2"/>
            <el-option label="王五" value="3"/>
            <el-option label="赵六" value="4"/>
          </el-select>
        </el-form-item>
        <el-form-item label="选择楼号:" :label-width="formLabelWidth">
          <el-select v-model="updateInfo.floorNumber" placeholder="选择楼号">
            <el-option label="5号楼" value="1"/>
            <el-option label="6号楼" value="2"/>
            <el-option label="7号楼" value="3"/>
            <el-option label="8号楼" value="4"/>
          </el-select>
        </el-form-item>
        <el-form-item label="选择房间号:" :label-width="formLabelWidth">
          <el-select v-model="updateInfo.roomNumber" placeholder="选择房间号">
            <el-option label="101" value="1"/>
            <el-option label="102" value="2"/>
            <el-option label="103" value="3"/>
            <el-option label="104" value="4"/>
          </el-select>
        </el-form-item>
        <el-form-item label="选择床位:" :label-width="formLabelWidth">
          <el-select v-model="updateInfo.bedId" placeholder="选择床位">
            <el-option label="1" value="1"/>
            <el-option label="2" value="2"/>
            <el-option label="3" value="3"/>
            <el-option label="4" value="4"/>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible4 = false">取消</el-button>
          <el-button type="primary" @click="dialogFormVisible4 = false">
            保存修改
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>

</template>
<script>
export default {
  name: "入住登记",
  created() {
    this.$request.get('/elderly-info/getAll').then(res => {
      this.elderlyList = res.data
    })
  },
  methods: {
    add() {
      this.$request.post('/elderly-info/add', this.riseElderly).then(res => {
        if (res.code === 200) {
          this.$message.success('添加成功')
        }
      })
      this.dialogFormVisible = false
    },
    onSubmit() {
      console.log('submit!');
    },
    clearAll() {
      this.selectFrom.name = '';
      this.selectFrom.bedNumber = '';
      this.selectFrom.date = '';
    },
    handleClick(index, row) {
      this.dialogFormVisible3 = true
    },
    update(index, row) {
      this.dialogFormVisible4 = true
    },
    handleSizeChange(val) {
      console.log(`每页 ${val} 条`);
    },
    handleCurrentChange(val) {
      console.log(`当前页: ${val}`);
    },
  },
  data() {
    return {
      updateInfo: {
        nurseLevel: '',
        name: "",
        gender: "",
        age: "",
        idNumber: "",
        selfCareStatus: "",
        familyContactInfo: "",
        nurseId: "",
        bedId: "",
        floorNumber: "",
        roomNumber: "",
        bedNumber: "",
        physicalCondition: "",
      },
      viewInfo: {
        name: "",
        gender: "",
        age: "",
        idNumber: "",
        selfCareStatus: "",
        familyContactInfo: "",
        nurseId: "",
        bedId: "",
        floorNumber: "",
        roomNumber: "",
        bedNumber: "",
        physicalCondition: "",
      },
      outingRegistration: {
        name: '',
        idNumber: '',
        familyContactInfo: '',
        elderlyId: '',
        roomNumber: '',
        outDate: '',
        outingReason: '',
        destruction: '',
        purpose: '',
        accompanyingPerson: '',
        contactInfo: ''
      },
      checkOutRequests: {
        familyContactInfo: '',
        name: '',
        idNumber: '',
        checkoutDate: '',
        elderlyId: '',
        roomNumber: '',
        checkOutDate: '',
        checkoutReason: '',
        checkoutType: '',
      },
      selectFrom: {
        name: '',
        bedNumber: '',
        date: '',
      },
      form: {
        name: '',
        bedNumber: '',
        date: '',
      },
      riseElderly: {
        name: "",
        gender: "",
        age: "",
        idNumber: "",
        selfCareStatus: "",
        familyContactInfo: "",
        nurseId: "",
        bedId: "",
        floorNumber: "",
        roomNumber: "",
        bedNumber: "",
        physicalCondition: "",
        nurseLevel: '',
      },
      elderlyList: [],
      dialogFormVisible: false,
      dialogFormVisible1: false,
      dialogFormVisible2: false,
      dialogFormVisible3: false,
      dialogFormVisible4: false,
      formLabelWidth: '120px',
      currentPage4: 4,
      pageSize4: 100,
      size: 'mini',
      disabled: false,
      background: false,
    }
  }
}
</script>
<style scoped>

</style>