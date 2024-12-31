<script setup>
import * as echarts from 'echarts';
import {ref,onMounted} from "vue";
const chartDom = ref(null);
const chartDom1 = ref(null);
import request from "@/utils/request";
let date=new Date()
let year=date.getFullYear()
let chartInstance=null
let chartInstance1=null
const data = ref([]);
onMounted( () => {
  request.get('financial/getAll').then(res => {
    data.value=res
    console.log(res)
    let arrx=[];
    let getmoney=[]
    let paymoney=[]
    res.forEach((ele=>{
      arrx.push(ele.month)
      getmoney.push(ele.getMoney)
      paymoney.push(ele.payMoney)
    }))
    console.log(arrx)
    console.log(getmoney)

    chartInstance = echarts.init(chartDom.value);
    const option = {
      legend: {},
      tooltip: {},
      dataset: {
        source: [
        ]
      },
      xAxis: { type: 'category',
        axisLabel: {
          interval: 0,
        },
        name: '/月份',
        data: arrx
      },
      yAxis: {
        name: '/金额(元)',
      },
      series: [{
        // // data: [120, 200, 150, 80],
        // type: 'bar'
        name: "月收入",
        type: "bar",
        data: getmoney,
      }, {
        // data: [120, 200, 150, 80],
        name: "月支出",
        data: paymoney,
        type: 'bar' }]
    }
    // chartInstance.value = echarts.init(chartDom.value);
    chartInstance.setOption(option);
})
  request.get("/financial/ProjectRate").then(res=>{
    console.log(res)
    let name=[];
    let number=[]
    res.forEach(ele=>{
      name.push(ele.projectName)
      number.push(ele.number)
    })
    // Map<String, Integer> map = new HashMap<>();
    const map = new Map();
    for(let i=0;i<name.length;i++){
      map.set(name[i],number[i]);
    }
    console.log(name)
    console.log(number)
    console.log(map)
    chartInstance1=echarts.init(chartDom1.value)
    const option1 = {
      title: {
        text: '项目次数占比图',
        subtext: 'Really Data',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      legend: {
        orient: 'vertical',
        left: 'left',
        data: map.keys()
      },
      series: [
        {
          name: '项目次数',
          type: 'pie',
          radius: '50%',
          data: [],
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }
      ]
    }
    for(let i=0;i<=number.length;i++){
      option1.series[0].data.push({
        value: map.get(name[i]),
        name: name[i]
      })
    }
    console.log(option1)
    chartInstance1.setOption(option1);
  })



});
</script>

<template>
    <div>
      <el-card style="height: 630px">
      <div>
        <hr style="margin: 10px">
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-money" style="margin-left: 30px;font-size: 20px"></i>
        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">财务账单</span>
        <hr style="margin: 10px">
      </div>
        <div style="display: flex;margin-top: 60px">
          <div ref="chartDom" style="width: 1000px; height: 400px;margin-left: -20px;"></div>
          <div ref="chartDom1" style="width: 600px; height: 400px;margin-left: 30px;margin-top: 10px"></div>
        </div>
        <div style="margin-left: 250px;margin-top: -40px">
          <span style="font-size: 13px;font-weight: bolder;color: #8c939d">{{year}}总年度收入支出表</span>
        </div>
      </el-card>
  </div>
</template>

<style scoped>

</style>