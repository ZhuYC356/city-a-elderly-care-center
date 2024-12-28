<template>
  <div>
    <el-card>
      <!--      上方标题-->
      <div>
        <hr style="margin: 10px"/>
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px; font-size: 20px"></i>
        <span style="margin-left: 5px; font-size: 20px; font-weight: bolder">设置服务对象</span>
        <hr style="margin: 10px"/>
      </div>

      <el-tabs tab-position="right">
        <el-tab-pane label="数据可视化"><VisualTable></VisualTable></el-tab-pane>
        <el-tab-pane label="管理护工服务对象"><ManagementOfNursing></ManagementOfNursing></el-tab-pane>
        <el-tab-pane label="为老人设置服务"><AssignForTheElderly></AssignForTheElderly></el-tab-pane>
      </el-tabs>

    </el-card>

  </div>
</template>

<script>
import VisualTable from "@/views/manager/cent/healthy/AssignCaregiverTabs/VisualTable.vue";
import AssignForTheElderly from "@/views/manager/cent/healthy/AssignCaregiverTabs/AssignForTheElderly.vue";
import ManagementOfNursing from "@/views/manager/cent/healthy/AssignCaregiverTabs/ManagementOfNursing.vue";
export default {
  name: "out-office-registration",
  components: {ManagementOfNursing, AssignForTheElderly, VisualTable},
};
</script>
<style scoped>

</style>