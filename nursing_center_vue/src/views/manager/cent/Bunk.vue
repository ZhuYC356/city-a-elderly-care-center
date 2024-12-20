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
            <div style="font-size: 20px;margin-left: 10px">空闲：03</div>
          </el-col>
          <el-col :span="3" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #999999"></i>
            <div style="font-size: 20px;margin-left: 10px">离床：03</div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #ffa406"></i>
            <div style="font-size: 20px;margin-left: 10px">计划内离床：03</div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #df0003"></i>
            <div style="font-size: 20px;margin-left: 10px">离床超时：03</div>
          </el-col>
        </el-row>
        <!--第二行-->
        <el-row style="margin-left: -3%">
          <el-col :span="2">
            <div style="font-size: 20px;text-align: right">楼层：</div>
          </el-col>
          <el-col :span="3">
            <el-select v-model="value" placeholder="请选择楼层">
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
            <div style="font-size: 20px;margin-left: 10px">总床数：27</div>
          </el-col>
        </el-row>
        <!--第三行-->
        <el-row :gutter="20" style="margin-left: 1%">
          <el-col :span="3" :offset="9" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #000000"></i>
            <div style="font-size: 20px;margin-left: 10px">有人：12</div>
          </el-col>
          <el-col :span="3" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #409EFF"></i>
            <div style="font-size: 20px;margin-left: 10px">外出：12</div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #a0a224"></i>
            <div style="font-size: 20px;margin-left: 10px">离开：12</div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
            <div style="font-size: 20px;margin-left: 10px">退住：12</div>
          </el-col>
        </el-row>
      </div>



      <!--图示上半部分-->
      <div style="margin-top: 30px;height: 200px">
        <el-row :gutter="2">
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2101</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col-plus">电梯房</div>
          </el-col>
          <el-col :span="4"><div class="grid-content ep-bg-purple" />
            <div class="col-plus" style="background-color: #a8ccff">洗衣房</div>
          </el-col>
          <el-col :span="4"><div class="grid-content ep-bg-purple" />
            <div class="col-plus" style="background-color: #96ea8d">活动中心</div>
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2102</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2103</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2104</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col-plus" style="background-color: #feb966">走道</div>
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2105</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2106</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
        </el-row>
      </div>

      <!--图示下半部分-->
      <div style="height: 200px;margin-top: 2px">
        <el-row :gutter="2">
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2107</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2108</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2109</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2110</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2111</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2112</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2113</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2114</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2115</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2116</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2117</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
              <br>
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2118</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed" style="font-size: 30px;color: #df007e"></i>
              <div class="fontsize">2101-1</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
        </el-row>
      </div>


    </div>


  </div>
</template>


<script setup>

import {ref} from 'vue'

const value = ref('')

const options = [
  {
    value: '一楼',
    label: '一楼',
  },
  {
    value: '二楼',
    label: '二楼',
  },
  {
    value: '三楼',
    label: '三楼',
  }
]

const className = ref("one")
const change = () => {
  className.value = ref("two")
}


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

</style>