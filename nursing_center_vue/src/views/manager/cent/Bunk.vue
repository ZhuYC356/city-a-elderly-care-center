<template>
  <div>
    <div class="card" style="padding: 15px;padding-left: 30px">
      <h1>床位示意图</h1>
    </div>

    <div class="card" style="margin-top: 30px">

      <div style="display: flex;margin-top: 20px">

        <div style="font-size: 20px;margin-left: 10px">楼层：</div>

        <div class="flex">
          <el-select v-model="value" placeholder="请选择楼层" style="width: 180px;">
            <el-option
                v-for="item in options"
                :key="item.value"
                :label="item.label"
                :value="item.value"
                style="font-size: 20px"
            />
          </el-select>
        </div>

        <!--<i class="iconfont icon-hbed" :class="className" @click="change" style="font-size: 30px;margin-left: 50px;"/>-->
        <i class="iconfont icon-bed" style="font-size: 30px;margin-left: 7%;color: #1f61ff"/>
        <div style="font-size: 20px;margin-left: 10px">总床数：27</div>

        <!--分成上下两行-->
        <div style="margin-left: 10px;height: 64px;margin-top: -22px">
          <!--上半部分-->
          <div style="display: flex;margin-bottom: 20px">
            <i class="iconfont icon-bed" style="font-size: 30px;margin-left: 7%;color: #2CBE56"/>
            <div style="font-size: 20px;margin-left: 10px;width: 150px">空闲：03</div>

            <i class="iconfont icon-bed" style="font-size: 30px;margin-left: 7%;color: #999999"/>
            <div style="font-size: 20px;margin-left: 10px;width: 150px">离床：12</div>

            <i class="iconfont icon-bed" style="font-size: 30px;margin-left: 7%;color: #ffa406"/>
            <div style="font-size: 20px;margin-left: 10px;width: 220px">计划内离床：03</div>

            <i class="iconfont icon-bed" style="font-size: 30px;margin-left: 7%;color: #df0003"/>
            <div style="font-size: 20px;margin-left: 10px;width: 220px">离床超时：03</div>
          </div>
          <!--下半部分-->
          <div style="display: flex;">
            <i class="iconfont icon-bed" style="font-size: 30px;margin-left: 7%;color: #000000"/>
            <div style="font-size: 20px;margin-left: 10px;width: 150px">有人：12</div>

            <i class="iconfont icon-bed" style="font-size: 30px;margin-left: 7%;color: #409EFF"/>
            <div style="font-size: 20px;margin-left: 10px;width: 150px">外出：12</div>

            <i class="iconfont icon-bed" style="font-size: 30px;margin-left: 7%;color: #a0a224"/>
            <div style="font-size: 20px;margin-left: 10px;width: 220px">离开：12</div>

            <i class="iconfont icon-bed" style="font-size: 30px;margin-left: 7%;color: #df007e"/>
            <div style="font-size: 20px;margin-left: 10px;width: 220px">退住：12</div>
          </div>

        </div>

      </div>

      <!--图示部分-->
      <div style="margin-top: 50px;height: 200px">
        <el-row :gutter="2">
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2101</div>
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
            <div class="col">2101</div>
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2101</div>
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2101</div>
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col-plus" style="background-color: #feb966">走道</div>
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2101</div>
          </el-col>
          <el-col :span="2"><div class="grid-content ep-bg-purple" />
            <div class="col">2101</div>
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
  font-size: 16px
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




</style>