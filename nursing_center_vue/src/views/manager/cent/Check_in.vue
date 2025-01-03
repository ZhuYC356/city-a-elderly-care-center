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
                   @click="openRise()">
          入住登记
        </el-button>
        <el-button style="margin-bottom: 10px;background-color: #f3ac34" plain icon="el-icon-plus" plain
                   @click="openRiseCheckOut()">
          退住登记申请
        </el-button>
        <el-button style="margin-bottom: 10px;background-color: #84d570" plain icon="el-icon-plus" plain
                   @click="dialogFormVisible2 = true">
          外出登记申请
        </el-button>

        <!--        查询输入框-->
        <el-form :inline="true" :model="selectFrom">
          <el-form-item style="margin-right: 20px">
            <el-input v-model="selectFrom.name" placeholder="请填写老人姓名" clearable>
              <template #prefix>
                <i class="el-icon-user" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
<!--          <el-form-item style="margin-right: 20px">-->
<!--            <el-input v-model="selectFrom.bedNumber" placeholder="请填写床位号" clearable>-->
<!--              <template #prefix>-->
<!--                <i class="el-icon-postcard" style="font-size: 15px;margin-left: 3px"></i>-->
<!--              </template>-->
<!--            </el-input>-->
<!--          </el-form-item>-->
          <el-form-item style="margin-right: 20px">
            <el-date-picker
                v-model="selectFrom.checkInTime"
                type="date"
                placeholder="请选择入住日期"
                clearable
            />
          </el-form-item>
          <el-form-item style="margin-right: 15px">
            <el-button type="primary" @click="select()"><span style="font-weight: bolder">搜 索</span></el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="danger" @click="clearAll"><span style="font-weight: bolder">清 空</span></el-button>
          </el-form-item>
        </el-form>
      </div>
      <div style="margin-top: 5px">
        <!--        表格-->
        <el-table :data="elderlyList" style="width: 100%;" height="365" :stripe="true"
                  :header-cell-style="{background:'#f3f6fd',color:'#555'}">
          <el-table-column type="selection" width="55"/>

          <el-table-column property="name" label="姓名" width="100"/>
          <el-table-column label="头像" width="100">
            <template v-slot="scope">
              <div style="display: flex; align-items: center">
                <el-image style=" height: 40px; border-radius: 50%" v-if="scope.row.avatar"
                          :src="scope.row.avatar" :preview-src-list="[scope.row.avatar]"></el-image>
              </div>
            </template>
          </el-table-column>
          <el-table-column property="gender" label="性别" width="80"/>
          <el-table-column property="age" label="年龄" width="80"/>
          <el-table-column property="familyContactInfo" label="家庭联系人电话" width="180"/>
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
        <el-form-item label="年龄:" :label-width="formLabelWidth">
          <el-input v-model="riseElderly.age" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="riseElderly.familyContactInfo" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭住址:" :label-width="formLabelWidth">
          <el-input v-model="riseElderly.homeAddress" autocomplete="off"/>
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
<!--        <el-form-item label="选择护工:" :label-width="formLabelWidth">-->
<!--          <el-select v-model="riseElderly.nurseId" placeholder="选择护工">-->
<!--            <el-option-->
<!--                v-for="item in nurseList"-->
<!--                :key="item.nurseId"-->
<!--                :label="item.name"-->
<!--                :value="item.nurseId">-->
<!--            </el-option>-->
<!--          </el-select>-->
<!--        </el-form-item>-->
        <el-form-item label="选择楼号:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.floorNumber" placeholder="选择楼号" @change="getRoomList(1)">
            <el-option
                v-for="item in floorList"
                :key="item"
                :label="item+'号楼'"
                :value="item"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="选择房间号:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.roomNumber" placeholder="选择房间号" @change="getBedList(1)">
            <el-option
                v-for="item in roomList"
                :key="item"
                :label="item +'号房间'"
                :value="item"
            >
            </el-option>

          </el-select>
        </el-form-item>
        <el-form-item label="选择床位:" :label-width="formLabelWidth">
          <el-select v-model="riseElderly.bedNumber" placeholder="选择床位">
            <el-option
                v-for="item in bedList"
                :key="item"
                :label="item+'号床'"
                :value="item"
            >
            </el-option>
          </el-select>
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
          <el-button type="primary" @click="add()">
            保存
          </el-button>
        </div>
      </template>
    </el-dialog>


    <!--  退住申请-->
    <el-dialog :visible.sync="dialogFormVisible1" title="退住登记申请" width="500">
      <el-form :model="checkOutRequests">
        <el-form-item label="选择楼号:" :label-width="formLabelWidth">
          <el-select v-model="checkOutRequests.floorNumber" placeholder="选择楼号" @change="getRoomList(2)">
            <el-option
                v-for="item in floorList"
                :key="item"
                :label="item+'号楼'"
                :value="item"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="选择房间号:" :label-width="formLabelWidth">
          <el-select v-model="checkOutRequests.roomNumber" placeholder="选择房间号" @change="getBedList(2)">
            <el-option
                v-for="item in checkOutRequestsRoomList"
                :key="item"
                :label="item +'号房间'"
                :value="item"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="选择床位:" :label-width="formLabelWidth">
          <el-select v-model="checkOutRequests.bedNumber" placeholder="选择床位" @change="getElderlyInfo()">
            <el-option
                v-for="item in checkOutRequestsBedList"
                :key="item"
                :label="item+'号床'"
                :value="item"
            >
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="checkOutRequests.name" autocomplete="off" disabled/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="checkOutRequests.idNumber" autocomplete="off" disabled/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="checkOutRequests.familyContactInfo" autocomplete="off" disabled/>
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
        <el-form-item label="退住时间:" :label-width="formLabelWidth">
          <el-date-picker
              v-model="checkOutRequests.checkoutDate"
              type="date"
              placeholder="请选择退住时间:"
              clearable
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible1 = false">取消</el-button>
          <el-button type="primary" @click="saveCheckOutRequests()">
            提交审核
          </el-button>
        </div>
      </template>
    </el-dialog>

    <!--  外出申请-->
    <el-dialog :visible.sync="dialogFormVisible2" title="外出登记申请" width="500">
      <el-form :model="outingRegistration">
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.idNumber" autocomplete="off" @blur="getElderlyInfoByIdNumber()"/>
        </el-form-item>
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.name" autocomplete="off" disabled/>
        </el-form-item>
        <el-form-item label="外出原因:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.outingReason" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="外出目的:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.purpose" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="外出目的地:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.destination" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="外出陪同人:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.accompanyingPerson" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="外出陪同人联系方式:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.contactInfo" autocomplete="off"/>
        </el-form-item>
        <el-form-item :label-width="formLabelWidth" label="外出时间:">
          <el-date-picker
              v-model="outingRegistration.outingDate"
              type="date"
              placeholder="请选择外出时间:"
              clearable
          />
        </el-form-item>
        <el-form-item label="备注:" :label-width="formLabelWidth">
          <el-input v-model="outingRegistration.remarks" autocomplete="off"/>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible2 = false">取消</el-button>
          <el-button type="primary" @click="submitOutingRegistration()">
            保存
          </el-button>
        </div>
      </template>
    </el-dialog>

    <!--  查看详情-->
    <el-dialog :visible.sync="dialogFormVisible3" title="查询详情" width="500">
      <div>
        <el-form :model="viewInfo" label-width="auto" style="max-width: 600px">

          <el-image
              style="width: 100px; height: 100px;margin-left: 80px"
              :src="viewInfo.avatar"
              :preview-src-list="srcList">
          </el-image>
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
          <el-form-item label="家庭住址" style="margin-top: 15px">
            <el-input v-model="viewInfo.address" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-place" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="监护人联系方式" style="margin-top: 15px">
            <el-input v-model="viewInfo.familyContactInfo" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-phone" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="自理能力" style="margin-top: 15px">
            <el-input v-model="viewInfo.selfCareStatus" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-wind-power" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="margin-right: 20px;margin-top: 15px" label="入住日期">
            <el-date-picker
                v-model="viewInfo.checkInTime"
                type="date"
                clearable
                style="width: 300px"
                disabled="true"
            />
          </el-form-item>
          <el-form-item label="楼号" style="margin-top: 15px">
            <el-input v-model="viewInfo.floorNumber" style="width: 300px;" disabled>
              <template #prefix>
                <i class="el-icon-box" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>


          <el-form-item label="房间号">
            <el-input v-model="viewInfo.roomNumber" disabled style="width: 300px;">
              <template #prefix>
                <i class="el-icon-film" style="font-size: 15px;margin-left: 3px"></i>
              </template>
            </el-input>
          </el-form-item>

          <el-form-item style="margin-right: 20px;margin-top: 15px" label="床位号">
            <el-input v-model="viewInfo.bedNumber" disabled clearable style="width: 300px">
              <template #prefix>
                <i class="el-icon-postcard" style="font-size: 15px;margin-left: 3px"></i>
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

    <!--  修改信息-->
    <el-dialog :visible.sync="dialogFormVisible4" title="修改信息" width="500">
      <el-form :model="updateInfo">
        <el-form-item :label-width="formLabelWidth" label="照片" prop="avatar">
          <el-upload
              :action="$baseUrl + '/files/upload'"
              list-type="picture"
              :on-success="handleCoverSuccessUpdate"
          >
            <el-button type="primary">上传照片</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="updateInfo.familyContactInfo" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身体状况描述:" :label-width="formLabelWidth">
          <el-input v-model="updateInfo.physicalCondition" autocomplete="off"/>
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
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible4 = false">取消</el-button>
          <el-button type="primary" @click="saveUpdate()">
            修改
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>

</template>
<script>
import Clock from "@/components/Clock.vue";

export default {
  name: "入住登记",
  created() {
    this.getAll()
  },
  methods: {
    updateClear() {
      this.updateInfo = {
        idNumber: '',
        name: '',
        elderlyId: '',
        roomNumber: '',
        floorNumber: '',
        bedNumber: '',
        checkInTime: '',
        checkOutTime: '',
        familyContactInfo: '',
        physicalCondition: '',
        selfCareStatus: '',
        nurseLevel: '',
        avatar: '',
      }
    },
    infoViewClear() {
      this.viewInfo = {
        elderlyId: '',
        name: '',
        idNumber: '',
        gender: '',
        birthday: '',
        age: '',
        nation: '',
        nativePlace: '',
        politicalOutlook: '',
        educationDegree: '',
        maritalStatus: '',
        householdType: '',
        householdRegistrationAddress: '',
        permanentResidenceAddress: '',
        phoneNumber: '',
        familyContactInfo: '',
        physicalCondition: '',
        selfCareStatus: '',
        nurseLevel: '',
        checkInTime: '',
        floorNumber: '',
        roomNumber: '',
        bedNumber: ''
      }
    },
    getAll() {
      this.$request.get('/elderly-info/getAll').then(res => {
        this.elderlyList = res.data
      })
    },
    getElderlyInfoByIdNumber() {
      if (this.outingRegistration.idNumber === '') {
        this.$message.error('请输入身份证号')
      } else {
        this.$request.get('/elderly-info/getElderlyInfoByIdNumber/' + this.outingRegistration.idNumber).then(res => {
          if (res.data === null) {
            this.$message.error('该老人不存在')
          } else {
            this.$message.success('该老人存在')
            console.log(res.data)
            this.outingRegistration.name = res.data.name
            this.outingRegistration.elderlyId = res.data.elderlyId
          }
        })
      }
    },
    getRoomList(sing) {
      if (sing === 1) {
        if (this.riseElderly.floorNumber === '') {
          this.$message.error('请先选择楼号')
        } else {
          this.$request.get('/bed-info/getAllRoomByFloorNumber/' + this.riseElderly.floorNumber + '/' + sing).then(res => {
            console.log(res.data)
            this.roomList = res.data
          })
        }
      } else {
        if (this.checkOutRequests.floorNumber === '') {
          this.$message.error('请先选择楼号')
        } else {
          this.$request.get('/bed-info/getAllRoomByFloorNumber/' + this.checkOutRequests.floorNumber + '/' + sing).then(res => {
            console.log(res.data)
            this.checkOutRequestsRoomList = res.data
          })
        }
      }
      this.riseElderly.roomNumber = ''
      this.checkOutRequests.roomNumber = ''
    },
    getBedList(sing) {
      if (sing === 1) {
        if (this.riseElderly.roomNumber === '') {
          this.$message.error('请先选择房间号')
        } else {
          this.$request.get('/bed-info/getAllBedByRoom/' + this.riseElderly.roomNumber + '/' + sing + '/' + this.riseElderly.floorNumber).then(res => {
            console.log(res.data)
            this.bedList = res.data
          })
        }
      } else {
        if (this.checkOutRequests.roomNumber === '') {
          this.$message.error('请先选择房间号')
        } else {
          this.$request.get('/bed-info/getAllBedByRoom/' + this.checkOutRequests.roomNumber + '/' + sing + '/' + this.checkOutRequests.floorNumber).then(res => {
            console.log(res.data)
            this.checkOutRequestsBedList = res.data
          })
        }
      }
      this.riseElderly.bedNumber = ''
      this.checkOutRequests.bedNumber = ''
    },
    getElderlyInfo() {
      //   根据房间号床号查询老人信息
      this.$request.get('/elderly-info/getElderlyInfoByRoomAndBed/' + this.checkOutRequests.floorNumber + '/' + this.checkOutRequests.roomNumber + '/' + this.checkOutRequests.bedNumber).then(res => {
        console.log(res.data)
        this.checkOutRequests.elderlyId = res.data.elderlyId
        this.checkOutRequests.bedId = res.data.bedId
        this.checkOutRequests.name = res.data.name
        this.checkOutRequests.idNumber = res.data.idNumber
        this.checkOutRequests.familyContactInfo = res.data.familyContactInfo
        this.checkOutRequests.phoneNumber = res.data.familyContactInfo
      })
    },

    openRise() {
      this.dialogFormVisible = true
      this.$request.get('/nurse-info/getAll').then(res => {
        this.nurseList = res.data
      })
      this.$request.get('/bed-info/getBedByAllFloor').then(res => {
        console.log(res.data)
        this.floorList = res.data
      })
    },
    openRiseCheckOut() {
      this.dialogFormVisible1 = true
      this.$request.get('/bed-info/getBedByAllFloor').then(res => {
        console.log(res.data)
        this.floorList = res.data
      })
    },
    add() {
      if (this.riseElderly.name === '' ||
          this.riseElderly.age === '' ||
          this.riseElderly.idNumber === '' ||
          this.riseElderly.familyContactInfo === '' ||
          this.riseElderly.physicalCondition === '' ||
          this.riseElderly.gender === '' ||
          this.riseElderly.selfCareStatus === '' ||
          this.riseElderly.nurseLevel === '' ||
          this.riseElderly.floorNumber === '' ||
          this.riseElderly.roomNumber === '' ||
          this.riseElderly.bedNumber === '' ||
          this.riseElderly.avatar === ''
      ) {
        console.log(this.riseElderly)
        this.$message.error('请填写完整信息')
      } else {
        this.$request.post('/elderly-info/add', this.riseElderly).then(res => {
          if (res.data === 1) {
            this.$message.success('添加成功')
          } else {
            this.$message.error(res.msg)
          }
        })
        this.dialogFormVisible = false
        this.getAll()
      }
    },
    submitOutingRegistration() {
      if (this.outingRegistration.outingReason === '' ||
          this.outingRegistration.purpose === '' ||
          this.outingRegistration.outingDate === '' ||
          this.outingRegistration.accompanyingPerson === '' ||
          this.outingRegistration.remarks === '' ||
          this.outingRegistration.contactInfo === '' ||
          this.outingRegistration.elderlyId === '' ||
          this.outingRegistration.destination === ''
      ) {
        this.$message.error('请填写完整信息')
      } else {
        this.$request.post('/outing-registration/addInfo', this.outingRegistration).then(res => {
          if (res.data === 1) {
            this.$message.success('添加成功')
          } else {
            this.$message.error(res.msg)
          }
        })
        this.dialogFormVisible2 = false
      }
    },
    select() {
      if (this.selectFrom.name === '' && this.selectFrom.bedNumber === '' && this.selectFrom.date === '') {
        this.$message.error('请填写搜索信息')
      } else {
        this.$request.post('/elderly-info/selectByFrom', this.selectFrom).then(res => {
          console.log(res)
          if (res.data.length === 0) {
            this.$message.error('未查询到结果')
          } else {
            this.elderlyList = res.data
          }
        })
      }
      console.log('submit!');
    },
    clearAll() {
      this.selectFrom.name = '';
      this.selectFrom.bedNumber = '';
      this.selectFrom.date = '';
      this.getAll()
    },
    handleClick(index, row) {
      this.dialogFormVisible3 = true
      // console.log("老人Id:"+row.elderlyId)
      this.$request.get('/elderly-info/getById/' + row.elderlyId).then(res => {
        console.log(res.data)
        this.viewInfo = res.data
        this.srcList = [this.viewInfo.avatar]
      })
    },
    update(index, row) {
      this.updateInfo = row
      console.log("row:" + row.elderlyId)
      this.dialogFormVisible4 = true
    },
    saveUpdate() {
      if (
          this.updateInfo.familyContactInfo === '' ||
          this.updateInfo.physicalCondition === '' ||
          this.updateInfo.selfCareStatus === '' ||
          this.updateInfo.nurseLevel === ''
      ) {
        this.$message.error('请填写完整信息')
        return
      }
      this.dialogFormVisible4 = false
      this.$request.post('/elderly-info/updateById', this.updateInfo).then(res => {
        if (res.code === "200") {
          this.$message.success('修改成功')
          this.updateClear()
        } else {
          this.$message.error("修改失败")
        }
      })
    },
    handleSizeChange(val) {
      console.log(`每页 ${val} 条`);
    },
    handleCurrentChange(val) {
      console.log(`当前页: ${val}`);
    },
    saveCheckOutRequests() {
      if (
          this.checkOutRequests.checkoutDate === '' ||
          this.checkOutRequests.checkoutType === '' ||
          this.checkOutRequests.elderlyId === ''
      ) {
        this.$message.error('请填写完整信息')
        return
      }
      this.$request.post('/check-out-requests/add', this.checkOutRequests).then(res => {
        if (res.msg === "成功") {
          this.$message.success('申请成功')
        } else {
          this.$message.error(res.msg)
          this.dialogFormVisible1 = false
        }
      })
    },
    handleCoverSuccess(res) {
      this.riseElderly.avatar = res.data
    },
    handleCoverSuccessUpdate(res) {
      this.updateInfo.avatar = res.data
    },
  },
  data() {
    return {
      number: 2,
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
        avatar: "",
      },
      viewInfo: {
        elderlyId: "",
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
        outingDate: '',
        outingReason: '',
        destination: '',
        purpose: '',
        accompanyingPerson: '',
        contactInfo: '',
        remarks: ''
      },
      checkOutRequests: {
        bedId: '',
        floorNumber: '',
        bedNumber: '',
        roomNumber: '',
        familyContactInfo: '',
        name: '',
        idNumber: '',
        checkoutDate: '',
        elderlyId: '',
        checkoutReason: '',
        checkoutType: '',
        approvalStatus: '',
      },
      selectFrom: {
        name: '',
        bedNumber: '',
        checkInTime: '',
      },
      form: {
        name: '',
        bedNumber: '',
        date: '',
      },
      floorList: [],
      nurseList: [],
      roomList: [],
      checkOutRequestsRoomList: [],
      checkOutRequestsBedList: [],
      bedList: [],
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
        avatar: '',
        homeAddress: '',
        medicalHistory: '',
        allergyHistory: ''
      },
      elderlyList: [],
      dialogFormVisible: false,
      dialogFormVisible1: false,
      dialogFormVisible2: false,
      dialogFormVisible3: false,
      dialogFormVisible4: false,
      formLabelWidth: '120px',
      currentPage: 0,
      pageSize: 0,
      size: 'mini',
      disabled: false,
      background: true,
    };
  },
  components: {
    Clock,
  }
}
</script>
<style scoped>

</style>