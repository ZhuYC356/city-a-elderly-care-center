<template>
  <div>
    <el-form :model="medicalRecord" label-width="auto" style="max-width: 95%">
      <el-form-item label="主诉">
        <el-input placeholder="主诉" v-model="medicalRecord.readme"/>
      </el-form-item>
      <el-form-item label="现病史">
        <el-input placeholder="现病史" v-model="medicalRecord.present"/>
      </el-form-item>
      <el-form-item label="现病治疗情况">
        <el-input placeholder="现病治疗情况" v-model="medicalRecord.presentTreat"/>
      </el-form-item>
      <el-form-item label="既往史">
        <el-input placeholder="既往史" v-model="medicalRecord.history"/>
      </el-form-item>
      <el-form-item label="过敏史">
        <el-input placeholder="过敏史" v-model="medicalRecord.allergy"/>
      </el-form-item>
      <el-form-item label="体格检查">
        <el-input placeholder="体格检查" v-model="medicalRecord.physique"/>
      </el-form-item>
      <!--    表格-->
      <el-button type="primary" @click="showAdd = true">新增</el-button>

      <el-table
          :data="diseaseList"
          style="width: 100%"
      >
        <el-table-column label="ICD编码" width="180">
          <template #default="scope">
            <div style="display: flex; align-items: center">
              <el-icon>
                <timer/>
              </el-icon>
              <span style=" margin-left: 10px">{{ scope.row.diseaseICD }}</span>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="名称" width="180">
          <template #default="scope">
            <div style="display: flex; align-items: center">
              <el-icon>
                <timer/>
              </el-icon>
              <span style="margin-left: 10px">{{ scope.row.diseaseName }}</span>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="发病时间" width="180">
          <template #default="scope">
            <div style="display: flex; align-items: center">
              <el-icon>
                <timer/>
              </el-icon>
              <span style="margin-left: 10px">{{ scope.row.datetime }}</span>
            </div>
          </template>
        </el-table-column>


        <el-table-column align="right">
          <template #header>
            <el-input v-model="search" size="small" placeholder="search"/>
          </template>
          <template #default="scope">
            <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
              编辑
            </el-button>
            <el-button
                size="small"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)"
            >
              删除
            </el-button>
          </template>
        </el-table-column>

      </el-table>
      <el-pagination background layout="prev, pager, next" :total="1000" />

      <el-form-item style="margin-top: 10px" label="检查建议">
        <el-input placeholder="检查建议" v-model="medicalRecord.proposal"/>
      </el-form-item>
      <el-form-item label="注意事项">
        <el-input placeholder="注意事项" v-model="medicalRecord.careful"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">保存</el-button>
        <el-button>首页</el-button>
      </el-form-item>

    </el-form>

    <el-dialog v-model="showAdd" title="Shipping address" width="500">
      <el-form :model="form">
        <el-form-item label="疾病" :label-width="formLabelWidth">
          <el-select placeholder="Please select a zone">
            <el-option label="Zone No.1" value="shanghai"/>
            <el-option label="Zone No.2" value="beijing"/>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible = false">Cancel</el-button>
          <el-button type="primary" @click="dialogFormVisible = false">
            Confirm
          </el-button>
        </div>
      </template>
    </el-dialog>

  </div>
</template>
<script>
export default {
  name: "病案首页",
  data() {
    return {
      form: {},
      formLabelWidth: '120px',
      dialogFormVisible: '',
      showAdd: false,

      patient: {},
      centerDialogVisible: '',
      search: '',
      addDisease: '',
      medicalRecord: {
        // 病历号的id
        registerId: '',
        readme: '',
        present: '',
        presentTreat: '',
        history: '',
        allergy: '',
        physique: '',
        proposal: '',
        careful: '',
        diagnosis: '',
        cure: '',
      },
      diseaseList: [
        {
          datetime: '2016-05-03',
          diseaseName: 'Tom',
          diseaseICD: 'Angeles',
        },
        {
          datetime: '2016-05-04',
          diseaseName: 'Tom',
          diseaseICD: 'No',
        },
        {
          datetime: '2016-05-01',
          diseaseName: 'Tom',
          diseaseICD: 'St',
        },
        {
          datetime: '2016-05-02',
          diseaseName: 'Tom',
          diseaseICD: 'StLos',
        }
      ],
      allDiseaseList: [
        {
          diseaseName: 'Tom',
          diseaseICD: 'Angeles',
        },
      ],
    }
  },
  methods: {
    onSubmit() {
      // 判断是否满足条件
      if (this.medicalRecord.present === '') {
        this.$message.error('请输入现病史')
        return
      }
      if (this.medicalRecord.presentTreat === '') {
        this.$message.error('请输入现病治疗情况')
        return
      }
      if (this.medicalRecord.history === '') {
        this.$message.error('请输入既往史')
        return
      }
      if (this.medicalRecord.allergy === '') {
        this.$message.error('请输入过敏史')
        return
      }
      if (this.medicalRecord.physique === '') {
        this.$message.error('请输入体格检查')
        return
      }
      if (this.medicalRecord.proposal === '') {
        this.$message.error('请输入检查建议')
        return
      }
      // 发送请求添加病历的请求
      this.medicalRecord.registerId = this.patient.registerId
      this.$request.post('/medical-record/add', this.medicalRecord).then(res => {
        if (res.code === '200') {
          this.$message.success('保存成功')
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    handleEdit(index, row) {
      // 传回的是索引和数据
      console.log(row)
      alert(index, row.name)
    },
    handleDelete(index, row) {
      alert(index, row)
    },
    add() {
      alert("新增")
    }
  },
  created() {
    this.patient = localStorage.getItem('patient')
  },
  mounted() {

  }
}
</script>
<style scoped>

</style>