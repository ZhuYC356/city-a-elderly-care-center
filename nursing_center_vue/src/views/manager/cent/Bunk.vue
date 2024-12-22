<template>
  <div>
    <div class="card" style="padding: 15px;padding-left: 30px">
      <h1>床位示意图</h1>
    </div>

    <div class="card" style="margin-top: 30px">
      <!--调整为响应式布局-->
      <!--row是行，col是列-->
      <div>
        <!--第一行-->
        <el-row :gutter="20" style="margin-left: 1%">
          <el-col :span="3" :offset="9" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #2CBE56"></i>
            <div class="fontsize-top">空闲：03</div>
          </el-col>
          <el-col :span="3" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #999999"></i>
            <div class="fontsize-top">离床：03</div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #ffa406"></i>
            <div class="fontsize-top">计划内离床：03</div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #df0003"></i>
            <div class="fontsize-top">离床超时：03</div>
          </el-col>
        </el-row>
        <!--第二行-->
        <el-row style="margin-left: -3%">
          <el-col :span="2">
            <div style="font-size: 20px;text-align: right">楼层：</div>
          </el-col>
          <el-col :span="3">
            <el-select v-model="value" placeholder="请选择楼层" clearable @change="handleChange">
              <el-option
                  v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                  style="font-size: 20px"
              />
            </el-select>
          </el-col>
          <el-col :span="4" :push="1" style="display: flex;margin-left: 1%">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #1f61ff"></i>
            <div class="fontsize-top">总床数：27</div>
          </el-col>
        </el-row>
        <!--第三行-->
        <el-row :gutter="20" style="margin-left: 1%">
          <el-col :span="3" :offset="9" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #000000"></i>
            <div class="fontsize-top">有人：12</div>
          </el-col>
          <el-col :span="3" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #409EFF"></i>
            <div class="fontsize-top">外出：12</div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #a0a224"></i>
            <div class="fontsize-top">离开：12</div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
            <div class="fontsize-top">退住：12</div>
          </el-col>
        </el-row>
      </div>


      <!--图示上半部分-->
      <div style="margin-top: 30px;height: 200px">
        <el-row :gutter="2">
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2101</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col-plus">电梯房</div>
          </el-col>
          <el-col :span="4">
            <div class="grid-content ep-bg-purple"/>
            <div class="col-plus" style="background-color: #a8ccff">洗衣房</div>
          </el-col>
          <el-col :span="4">
            <div class="grid-content ep-bg-purple"/>
            <div class="col-plus" style="background-color: #96ea8d">活动中心</div>
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2102</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2103</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2104</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col-plus" style="background-color: #feb966">走道</div>
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2105</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2106</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
        </el-row>
      </div>

      <!--图示下半部分-->
      <div style="height: 200px;margin-top: 2px">
        <el-row :gutter="2">
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2107</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2108</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2109</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2110</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2111</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2112</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2113</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2114</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2115</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2116</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2117</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">2118</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize" v-for="item in bedInfoData">{{ item.roomNumber }}-{{ item.bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
        </el-row>
      </div>


    </div>


  </div>
</template>


<script setup>
import axios from "axios";
import {onMounted, ref} from 'vue'

const value = ref('')// 用于存储选择的值

const options = [
  {
    value: '1',
    label: '一楼',
  },
  {
    value: '2',
    label: '二楼',
  },
  {
    value: '3',
    label: '三楼',
  }
]

const bedInfoData = ref("");

const handleChange = () => {
  // 发送 GET 请求到后端
  axios.get('http://localhost:9090/bed-info/selectBedInfoByFloor', {
    params: {
      floor: value.value // 将选择的值作为参数传递
    }
  })
      .then(response => {
        console.log('从后端成功获取信息:', response.data);
        bedInfoData.value = response.data;
        console.log('打印bedInfoData的内容:',bedInfoData.value);
      })
      .catch(error => {
        console.error('错误:', error);
      });
}


// const getBedInfoByFloor = async () => {
//   try {
//     const response = await axios.get('http://localhost:9090/bed-info/selectBedInfoByFloor');
//     console.log('接收到数据：', response.data);
//     bedInfoData.value = response.data;
//     // console.log('将数据赋值给bedInfoData：',bedInfoData)
//     console.log(options);
//   } catch (error) {
//     console.error('接收数据时出错：', error);
//   }
// }
// onMounted(() => {
//   getBedInfoByFloor();
// })


</script>


<style>
.one {
  color: red;
}

.two {
  color: blue;
}

.col {
  background-color: #1f61ff;
  color: #ffffff;
  text-align: center;
  font-weight: 600;
  font-size: 16px;
  height: 20px;
}

.col-plus {
  background-color: #18f0e9;
  color: #fff;
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 600;
  font-size: 16px
}

.bed-icon-box {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 180px

}

.fontsize {
  font-size: clamp(12px, 20px, 1vw);
}

.fontsize-icon {
  font-size: clamp(24px, 40px, 2vw);
}

.fontsize-top {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: clamp(12px, 20px, 1vw);
  margin-left: 10px;
}

.grey-background-col {
  background-color: rgba(224, 223, 223, 0.5)
}


</style>