<template>
  <div class="tableInline">
    <div id="echarsNursing" style="width: 50%; height: 350px;margin:auto"></div>
    <div id="echarsElderly" style="width: 50%; height: 350px;margin:auto"></div>
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
      colorTable: ["#61B95A", "#FDB813", "#E74C3C", "#3498DB", "#E67E22", "#9B59B6"],
      nurseData: [],
      nursingXAxis: [],
      nursingYAxis: [],
      withoutAssigned:0,
      hasAssigned:0
    }
  },
  methods: {
    initChartNursing() {
      axios
          .get("http://127.0.0.1:9090/nurse-info/getAllNurses")
          .then((res) => {
            console.log("返回护工数据");
            console.log(res.data.data);
            this.nurseData = res.data.data;
            for (let i = 0; i < this.nurseData.length; i++) {
              this.nursingXAxis.push("护工:"+this.nurseData[i].nurseName);
              this.nursingYAxis.push(this.nurseData[i].elderlyList.length);
            }
            console.log(this.NursingSetOptions);
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

      // 获取 DOM 元素并初始化 ECharts 实例
      let myChartElderly = echarts.init(document.getElementById('echarsElderly'));
      // 设置图表的选项
      myChartElderly.setOption(this.ElderlySetOptions);
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
      let ElderlySetOptions= {
        title: {
          text: '老人分配护工情况',
          left: 'center',
          // top: 'center'
        },
        series: [
          {
            type: 'pie',
            data: [
              {
                value: this.withoutAssigned,
                name: '未分配护工的老人个数'
              },
              {
                value: this.hasAssigned,
                name: '已分配护工的老人个数'
              },
            ],
            radius: '50%'
          }
        ]
      }
    }
  },
};
</script>
<style scoped>
.tableInline {

  display: flex;
  justify-content: flex-start;
  flex-wrap: wrap;

}
</style>