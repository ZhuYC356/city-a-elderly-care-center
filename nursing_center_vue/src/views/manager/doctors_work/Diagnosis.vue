<template>
  <div>
    <el-card>
      <h2>医生诊疗</h2>
      <br>
      <hr>
      <br>
      <!--      <h3 style="margin-bottom: 10px">你好! {{ employee.realName || "医生"}} 你当前已用号额: {{ formInline.usedAmount }}个</h3>-->
      <Clock/>
      <div style="margin-top: 10px">
        当前病人名: {{ patient.realName || "未选择病人" }}
        <br>
        当前病历号: {{ patient.caseNumber || "未选择病人" }}
      </div>
    </el-card>
    <el-card style="margin-top: 10px">
      <div slot="header" class="clearfix" style="width: 100%">
        <el-menu
            :default-active="activeIndex"
            class="el-menu-demo"
            mode="horizontal"
            active-text-color="#ffd04b"
            style="
              width: 80%;
              background-color: #ffffff;
              display: flex;
              justify-content: space-between;

            "
        >
<!--          <el-tabs type="border-card" style="width: 100%">-->
<!--            <el-tab-pane @click="activeIndex = '1'" label="病案首页"></el-tab-pane>-->
<!--            <el-tab-pane @click="activeIndex = '2'" label="检查申请"></el-tab-pane>-->
<!--            <el-tab-pane @click="activeIndex = '3'" label="检查结果"></el-tab-pane>-->
<!--            <el-tab-pane @click="activeIndex = '4'" label="门诊确诊"></el-tab-pane>-->
<!--            <el-tab-pane @click="activeIndex = '5'" label="开设处方"></el-tab-pane>-->
<!--            <el-tab-pane @click="activeIndex = '6'" label="费用查询"></el-tab-pane>-->
<!--          </el-tabs>-->
          <el-menu-item @click="activeIndex = '1'" index="1">病案首页</el-menu-item>
          <el-menu-item @click="activeIndex = '2'" index="2">检查申请</el-menu-item>
          <el-menu-item @click="activeIndex = '3'" index="3">检查结果</el-menu-item>
          <el-menu-item @click="activeIndex = '4'" index="4">门诊确诊</el-menu-item>
          <el-menu-item @click="activeIndex = '5'" index="5">开设处方</el-menu-item>
          <el-menu-item @click="activeIndex = '6'" index="6">费用查询</el-menu-item>
        </el-menu>
      </div>
    </el-card>
    <el-card style="margin-top: 10px">
      <div v-if="activeIndex==='1'">
        <DiagnosisMedicalRecord/>
      </div>
      <div v-else-if="activeIndex==='2'">
        <DiagnosisCheckTheApplication/>
      </div>
      <div v-else-if="activeIndex==='3'">
        <DiagnosisCheckTheResults/>
      </div>
      <div v-else-if="activeIndex==='4'">
        <DiagnosisConfirmedOutpatient/>
      </div>
      <div v-else-if="activeIndex==='5'">
        <DiagnosisPrescribing/>
      </div>
      <div v-else-if="activeIndex==='6'">
        <DiagnosisFeeInquiry/>
      </div>
      <router-view></router-view>
    </el-card>
    <Foot/>
  </div>
</template>
<script>
import DiagnosisMedicalRecord from "@/views/manager/doctors_work/Diagnosis-MedicalRecord.vue";
import DiagnosisCheckTheApplication from "@/views/manager/doctors_work/Diagnosis-Check-The-Application.vue";
import DiagnosisCheckTheResults from "@/views/manager/doctors_work/Diagnosis-Check-The-Results.vue";
import DiagnosisConfirmedOutpatient from "@/views/manager/doctors_work/Diagnosis-Confirmed-Outpatient.vue";
import DiagnosisPrescribing from "@/views/manager/doctors_work/Diagnosis-Prescribing.vue";
import DiagnosisFeeInquiry from "@/views/manager/doctors_work/Diagnosis-Fee-Inquiry.vue";
import Foot from "@/components/Foot.vue";
import Clock from "@/components/Clock.vue";

export default {
  name: "Diagnosis",
  data() {
    return {
      patient: {},
      activeIndex: '1',
    }
  },
  mounted() {
  },
  methods: {},
  created() {
    this.patient = JSON.parse(localStorage.getItem('patient'))
  },
  components: {
    DiagnosisMedicalRecord,
    DiagnosisCheckTheApplication,
    DiagnosisCheckTheResults,
    DiagnosisConfirmedOutpatient,
    DiagnosisPrescribing,
    DiagnosisFeeInquiry,
    Foot,
    Clock,
  },

};
</script>
<style scoped>

</style>