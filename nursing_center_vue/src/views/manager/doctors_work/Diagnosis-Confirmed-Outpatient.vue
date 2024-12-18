<template>
  <div>
    <el-form :model="form" label-width="auto" style="max-width: 100%">
      <el-form-item label="病历号">
        <el-input v-model="form.caseNumber"/>
      </el-form-item>

      <el-form-item label="患者姓名">
        <el-input v-model="form.name"/>
      </el-form-item>

      <el-form-item label="性别">
        <el-radio-group v-model="form.gender">
          <el-radio label="1" value="1">男</el-radio>
          <el-radio label="0" value="0">女</el-radio>
        </el-radio-group>
      </el-form-item>

      <el-form-item label="年龄">
        <el-input v-model="form.age"/>
      </el-form-item>

      <el-form-item label="检查">
        <el-input v-model="form.examine"/>
      </el-form-item>

      <el-form-item label="诊断">
        <el-input v-model="form.diagnosis"/>
      </el-form-item>

      <el-form-item label="处理意见">
        <el-input v-model="form.suggest"/>
      </el-form-item>
      <el-button type="primary" @click="onSubmit">保存</el-button>
      <el-button @click="onCancel">重置</el-button>
    </el-form>
  </div>
</template>
<script>
export default {
  name: "Diagnosis-Confirmed-Outpatient",
  data() {
    return {
      form: {
        caseNumber: '',
        name: '',
        gender: '',
        age: '',
        examine: '',
        diagnosis: '',
        suggest: ''
      },
    }
  },
  methods: {
    onSubmit() {
      console.log('submit!');
    },
    onCancel() {
      alert("取消")
    }
  }
}
</script>
<style scoped>

</style>