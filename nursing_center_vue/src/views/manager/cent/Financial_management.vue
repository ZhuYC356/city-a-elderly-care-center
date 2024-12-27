<script setup>
import * as echarts from 'echarts';
import {ref,onMounted} from "vue";
const chartDom = ref(null);
const chartDom1 = ref(null);
let chartInstance=null
onMounted( () => {
  chartInstance = echarts.init(chartDom.value);
  const option = {
    legend: {},
    tooltip: {},
    dataset: {
      source: [
        ['project', '收入', '支出'],
        ['1', 40, 85.8, 93.7],
        ['2', 83.1, 73.4, 55.1],
        ['3', 86.4, 65.2, 82.5],
        ['4', 72.4, 53.9, 39.1],
        ['5', 72.4, 53.9, 39.1],
        ['6', 72.4, 53.9, 39.1],
        ['7', 72.4, 53.9, 39.1],
        ['8', 72.4, 53.9, 39.1],
        ['9', 72.4, 53.9, 39.1],
        ['10', 72.4, 53.9, 39.1],
        ['11', 72.4, 53.9, 39.1],
        ['12', 72.4, 53.9, 39.1],
      ]
    },
    xAxis: { type: 'category',
              axisLabel: {
                interval: 0,
              },
              name: '/月份'
    },
    yAxis: {},
    // Declare several bar series, each will be mapped
    // to a column of dataset.source by default.
    series: [{ type: 'bar' }, { type: 'bar' }]
  };
  chartInstance.setOption(option);
});
</script>

<template>
    <div>
      <div ref="chartDom" style="width: 1100px; height: 400px;margin-left: -50px"></div>
      <div ref="chartDom1" style="width: 600px; height: 400px;"></div>
  </div>
</template>

<style scoped>

</style>