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
        <el-button style="margin-bottom: 10px;background-color: #80d89a" plain icon="el-icon-plus" plain
                   @click="dialogFormVisible = true">
          入住登记
        </el-button>
        <el-button style="margin-bottom: 10px;background-color: #f3ac34" plain icon="el-icon-plus" plain
                   @click="dialogFormVisible1 = true">
          退住登记申请
        </el-button>
        <el-button style="margin-bottom: 10px;background-color: #6985de" plain icon="el-icon-plus" plain
                   @click="dialogFormVisible2 = true">
          外出登记申请
        </el-button>
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
        <el-table :data="tableData" style="width: 100%;" height="365" :stripe="true"
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
            <template #default>
              <el-button link type="success" size="small" @click="handleClick($index,row)">
                <span style="font-weight: bolder">详 情</span>
              </el-button>
              <el-button link type="primary" size="small" @click="update()"><span style="font-weight: bolder">修 改</span>
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
      <el-form :model="elderly">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身体状况描述:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="性别:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择性别">
            <el-option label="男性" value="M"/>
            <el-option label="女性" value="F"/>
          </el-select>
        </el-form-item>
        <el-form-item label="自理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择自理等级">
            <el-option label="不自理" value="1"/>
            <el-option label="部分自理" value="2"/>
            <el-option label="自理" value="3"/>
          </el-select>
        </el-form-item>
        <el-form-item label="护理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择护理等级">
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
          <el-button type="primary" @click="dialogFormVisible = false">
            保存
          </el-button>
        </div>
      </template>
    </el-dialog>
    <!--  退住申请-->
    <el-dialog :visible.sync="dialogFormVisible1" title="新增入住登记" width="500">
      <el-form :model="elderly">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身体状况描述:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="性别:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择性别">
            <el-option label="男性" value="M"/>
            <el-option label="女性" value="F"/>
          </el-select>
        </el-form-item>
        <el-form-item label="自理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择自理等级">
            <el-option label="不自理" value="1"/>
            <el-option label="部分自理" value="2"/>
            <el-option label="自理" value="3"/>
          </el-select>
        </el-form-item>
        <el-form-item label="护理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择护理等级">
            <el-option label="最高级" value="1"/>
            <el-option label="高级" value="2"/>
            <el-option label="中级" value="3"/>
            <el-option label="低级" value="4"/>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible1 = false">取消</el-button>
          <el-button type="primary" @click="dialogFormVisible1 = false">
            保存
          </el-button>
        </div>
      </template>
    </el-dialog>
    <!--  外出申请-->
    <el-dialog :visible.sync="dialogFormVisible2" title="新增入住登记" width="500">
      <el-form :model="elderly">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身体状况描述:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="性别:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择性别">
            <el-option label="男性" value="M"/>
            <el-option label="女性" value="F"/>
          </el-select>
        </el-form-item>
        <el-form-item label="自理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择自理等级">
            <el-option label="不自理" value="1"/>
            <el-option label="部分自理" value="2"/>
            <el-option label="自理" value="3"/>
          </el-select>
        </el-form-item>
        <el-form-item label="护理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择护理等级">
            <el-option label="最高级" value="1"/>
            <el-option label="高级" value="2"/>
            <el-option label="中级" value="3"/>
            <el-option label="低级" value="4"/>
          </el-select>
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
    <el-dialog :visible.sync="dialogFormVisible3" title="新增入住登记" width="500">
      <el-form :model="elderly">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身体状况描述:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="性别:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择性别">
            <el-option label="男性" value="M"/>
            <el-option label="女性" value="F"/>
          </el-select>
        </el-form-item>
        <el-form-item label="自理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择自理等级">
            <el-option label="不自理" value="1"/>
            <el-option label="部分自理" value="2"/>
            <el-option label="自理" value="3"/>
          </el-select>
        </el-form-item>
        <el-form-item label="护理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择护理等级">
            <el-option label="最高级" value="1"/>
            <el-option label="高级" value="2"/>
            <el-option label="中级" value="3"/>
            <el-option label="低级" value="4"/>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible3 = false">取消</el-button>
          <el-button type="primary" @click="dialogFormVisible3 = false">
            保存
          </el-button>
        </div>
      </template>
    </el-dialog>
    <!--  修改信息-->
    <el-dialog :visible.sync="dialogFormVisible4" title="新增入住登记" width="500">
      <el-form :model="elderly">
        <el-form-item label="姓名:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身份证号:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="家庭联系电话:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="身体状况描述:" :label-width="formLabelWidth">
          <el-input v-model="elderly.name" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="性别:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择性别">
            <el-option label="男性" value="M"/>
            <el-option label="女性" value="F"/>
          </el-select>
        </el-form-item>
        <el-form-item label="自理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择自理等级">
            <el-option label="不自理" value="1"/>
            <el-option label="部分自理" value="2"/>
            <el-option label="自理" value="3"/>
          </el-select>
        </el-form-item>
        <el-form-item label="护理等级:" :label-width="formLabelWidth">
          <el-select v-model="elderly.region" placeholder="选择护理等级">
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
          <el-button type="primary" @click="dialogFormVisible4 = false">
            保存
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>

</template>
<script>
export default {
  name: "入住登记",
  methods: {
    onSubmit() {
      console.log('submit!');
    },
    clearAll() {
      this.form.name = '';
      this.form.bedNumber = '';
      this.form.date = '';
    },
    handleClick() {
      this.dialogFormVisible3 = true
      console.log('handleClick')
    },
    update() {
      this.dialogFormVisible4 = true
      alert('修改')
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
      elderly: {
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
      tableData: [
        {
          name: '张三',
          gender: '男',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '1',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
        {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        }, {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        }, {
          name: '李四',
          gender: '女',
          date: '2022-01-01',
          familyContactInfo: '1234567890',
          floorNumber: '1',
          roomNumber: '101',
          bedNumber: '2',
        },
      ]
    }
  }
}
</script>
<style scoped>

</style>