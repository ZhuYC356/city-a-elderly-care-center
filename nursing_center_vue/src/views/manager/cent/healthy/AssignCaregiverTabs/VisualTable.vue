<template>
  <div>
<!--    <el-button icon="el-icon-refresh-right" circle style="float:right;margin-right: 15px" @click="refresh"></el-button>-->
  <div class="tableInline">
    <div>
      <div id="echarsNursing" style="width: 400px; height: 350px;margin:auto"></div>
    </div>

    <div>
      <div id="echarsElderly" style="width: 400px; height: 350px;"></div>
      <el-alert title="哇！所有老人都已分配护工啦" type="success"
                v-show="this.withoutAssigned==0" style="margin-top: -80px;"
                center show-icon
      ></el-alert>
      <el-alert title="请尽快为未分配护工的老人分配健康管家" type="warning"
                v-show="this.withoutAssigned>0" style="margin-top: -80px;"
                center show-icon
      ></el-alert>
    </div>

  </div>
  </div>

</template>
<script>
import * as echarts from 'echarts';
import axios from "axios";

export default {
  mounted() {
    this.initChartNursing();
    this.initChartElderly();
  },
  data() {
    return {
      colorTable: ["#5c7bd9", "#ffdc60", "#40b27d", "#a969c6", "#ff915a", "#ff88e0",],
      nurseData: [],
      nursingXAxis: [],
      nursingYAxis: [],
      withoutAssigned: 0,
      hasAssigned: 0
    }
  },
  methods: {
    // refresh(){location.reload() },
    initChartNursing() {
      axios
          .get("http://127.0.0.1:9090/nurse-info/getAllNurses")
          .then((res) => {
            console.log("返回护工数据");
            console.log(res.data.data);
            this.nurseData = res.data.data;
            for (let i = 0; i < this.nurseData.length; i++) {
              this.nursingXAxis.push(this.nurseData[i].nurseName);
              let itemYAxis = {}
              itemYAxis.value = this.nurseData[i].elderlyList.length;
              itemYAxis.itemStyle = {
                color: this.colorTable[i % this.colorTable.length]
              };
              this.nursingYAxis.push(itemYAxis);
            }
            // 获取 DOM 元素并初始化 ECharts 实例
            let myChartNursing = echarts.init(document.getElementById('echarsNursing'));
            // 设置图表的选项
            myChartNursing.setOption(this.updateNursingChart());
          })
          .catch((err) => {
            console.error(err);
          });
    },
    initChartElderly() {
      axios
          .get("http://127.0.0.1:9090/elderly-info/countNurseId")
          .then((res) => {
            // console.log("统计 nurseId 为空和不为空的个数");
            // console.log(res.data);
            this.withoutAssigned = res.data.nurseIdIsNull;
            this.hasAssigned = res.data.nurseIdIsNotNull;
            let myChartElderly = echarts.init(document.getElementById('echarsElderly'));
            myChartElderly.setOption(this.updateElderlyChart());
          })
          .catch((err) => {
            console.error(err);
          });
    },
    updateNursingChart() {
      let NursingSetOptions = {
        title: {
          text: '护工负责老人的数量',
          left: 'center',
        },
        tooltip: {},
        xAxis: {
          data: this.nursingXAxis,
        },
        yAxis: {},
        series: [
          {
            name: '负责老人的数量',
            type: 'bar',
            data: this.nursingYAxis,
          },
        ],
      };
      return NursingSetOptions;
    },
    updateElderlyChart() {
      let ElderlySetOptions = {
        title: {
          text: '未分配与已分配护工的老人数量',
          // subtext: '单位：个数',
          left: 'center',
        },
        tooltip: {
          trigger: 'item',
        },
        legend: {
          top: '15%',
          left: 'center'
        },
        series: [
          {
            name: '老人个数',
            type: 'pie',
            radius: ['40%', '70%'],
            center: ['50%', '70%'],
            // adjust the start and end angle
            startAngle: 180,
            endAngle: 360,
            data: [
              {value: this.hasAssigned, name: '已分配护工', itemStyle: {color: '#9fe080'}},
              {value: this.withoutAssigned, name: '未分配护工', itemStyle: {color: '#ff7070'}}

            ]
          }
        ]
      }
      return ElderlySetOptions;
    }
  },
};
</script>
<style scoped>
.tableInline {
  display: flex;
  justify-content: flex-start;
  flex-wrap: wrap;
  margin-top: 5px;
}
</style>