<template>
  <div>
    <div class="card" style="padding: 15px;padding-left: 30px">
      <div>
        <hr style="margin: 10px">
        <el-icon>
          <Notebook/>
        </el-icon>
        <i class="el-icon-notebook-1" style="margin-left: 30px;font-size: 20px"></i>
        <span style="margin-left: 5px;font-size: 20px;font-weight: bolder">床位示意图</span>
        <hr style="margin: 10px">
      </div>
    </div>

    <div class="card" style="margin-top: 30px">
      <!--调整为响应式布局-->
      <!--row是行，col是列-->
      <div>
        <!--第一行-->
        <el-row :gutter="20" style="margin-left: 1%" class="fontBed">
          <el-col :span="3" :offset="9" style="display: flex">
            <i class="iconfont icon-bed" :style="{color: bedColor[1]}"></i>
            <div class="fontsize-top">空闲：<div class="fontsize-top" v-if="countData">{{ countData[0].count }}</div></div>
          </el-col>
          <el-col :span="3" style="display: flex">
            <i class="iconfont icon-bed" :style="{color: bedColor[2]}"></i>
            <div class="fontsize-top">离床：<div class="fontsize-top" v-if="countData">{{ countData[1].count }}</div></div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" :style="{color: bedColor[3]}"></i>
            <div class="fontsize-top">计划内离床：<div class="fontsize-top" v-if="countData">{{ countData[2].count }}</div></div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" :style="{color: bedColor[4]}"></i>
            <div class="fontsize-top">离床超时：<div class="fontsize-top" v-if="countData">{{ countData[3].count }}</div></div>
          </el-col>
        </el-row>
        <!--第二行-->
        <el-row style="margin-left: -3%">
          <el-col :span="2">
            <div style="font-size: 20px;text-align: right">楼层：</div>
          </el-col>
          <el-col :span="3">
            <el-select v-model="value" placeholder="请选择楼层" clearable @change="() => { handleChange(); countBedStatus(); }">
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
        <el-row :gutter="20" style="margin-left: 1%" class="fontBed">
          <el-col :span="3" :offset="9" style="display: flex">
            <i class="iconfont icon-bed" :style="{color: bedColor[5]}"></i>
            <div class="fontsize-top">有人：<div class="fontsize-top" v-if="countData">{{ countData[4].count }}</div></div>
          </el-col>
          <el-col :span="3" style="display: flex">
            <i class="iconfont icon-bed" :style="{color: bedColor[6]}"></i>
            <div class="fontsize-top">外出：<div class="fontsize-top" v-if="countData">{{ countData[5].count }}</div></div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" :style="{color: bedColor[7]}"></i>
            <div class="fontsize-top">离开：<div class="fontsize-top" v-if="countData">{{ countData[6].count }}</div></div>
          </el-col>
          <el-col :span="4" style="display: flex">
            <i class="iconfont icon-bed" :style="{color: bedColor[8]}"></i>
            <div class="fontsize-top">退住：<div class="fontsize-top" v-if="countData">{{ countData[7].count }}</div></div>
          </el-col>
        </el-row>
      </div>

      <!--图示上半部分-->
      <div style="margin-top: 30px;height: 200px">
        <el-row :gutter="2">
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}101</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[0]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[0].roomNumber }}-{{ bedInfoData[0].bedNumber }}</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[1]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[1].roomNumber }}-{{ bedInfoData[1].bedNumber }}</div>
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
            <div class="col">{{ value }}102</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[2]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[2].roomNumber }}-{{ bedInfoData[2].bedNumber }}</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[3]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[3].roomNumber }}-{{ bedInfoData[3].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}103</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[4]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[4].roomNumber }}-{{ bedInfoData[4].bedNumber }}</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[5]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[5].roomNumber }}-{{ bedInfoData[5].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}104</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[6]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[6].roomNumber }}-{{ bedInfoData[6].bedNumber }}</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[7]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[7].roomNumber }}-{{ bedInfoData[7].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col-plus" style="background-color: #feb966">走道</div>
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}105</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[8]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[8].roomNumber }}-{{ bedInfoData[8].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}106</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[9]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[9].roomNumber }}-{{ bedInfoData[9].bedNumber }}</div>
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
            <div class="col">{{ value }}107</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[10]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[10].roomNumber }}-{{ bedInfoData[10].bedNumber }}</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[11]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[11].roomNumber }}-{{ bedInfoData[11].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}108</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[12]]}"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[12].roomNumber }}-{{ bedInfoData[12].bedNumber }}</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #999999"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[13].roomNumber }}-{{ bedInfoData[13].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}109</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df0003"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[14].roomNumber }}-{{ bedInfoData[14].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}110</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #ffa406"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[15].roomNumber }}-{{ bedInfoData[15].bedNumber }}</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #ffa406"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[16].roomNumber }}-{{ bedInfoData[16].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}111</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #000000"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[17].roomNumber }}-{{ bedInfoData[17].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}112</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #a0a224"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[18].roomNumber }}-{{ bedInfoData[18].bedNumber }}</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #409EFF"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[19].roomNumber }}-{{ bedInfoData[19].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}113</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #df007e"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[20].roomNumber }}-{{ bedInfoData[20].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}114</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #2CBE56"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[21].roomNumber }}-{{ bedInfoData[21].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}115</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #2CBE56"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[22].roomNumber }}-{{ bedInfoData[22].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}116</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
              <i class="iconfont icon-bed fontsize-icon" style="color: #999999"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[23].roomNumber }}-{{ bedInfoData[23].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}117</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box">
              <i class="iconfont icon-bed fontsize-icon" style="color: #ffa406"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[24].roomNumber }}-{{ bedInfoData[24].bedNumber }}</div>
              <br>
              <i class="iconfont icon-bed fontsize-icon" style="color: #df0003"></i>
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[25].roomNumber }}-{{ bedInfoData[25].bedNumber }}</div>
            </div>
            <!--展示床位状态的模块-->
          </el-col>
          <el-col :span="2">
            <div class="grid-content ep-bg-purple"/>
            <div class="col">{{ value }}118</div>
            <!--展示床位状态的模块-->
            <div class="bed-icon-box grey-background-col">
<<<<<<< HEAD
              <i class="iconfont icon-bed fontsize-icon" :style="{color: bedColor[bedInfo[26]]}"></i>
=======
              <i class="iconfont icon-bed fontsize-icon" style="color: #a0a224" sc></i>
>>>>>>> origin/master
              <div class="fontsize" v-if="bedInfoData">{{ value }}{{ bedInfoData[26].roomNumber }}-{{ bedInfoData[26].bedNumber }}</div>
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
const bedColor=ref(["","#2CBE56","#999999","#ffa406","#df0003","#000000","#409EFF","#a0a224","#df007e"])
const bedInfo = ref([]);

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
        console.log('打印bedInfoData的内容:', bedInfoData.value);
        for (let i=0;i<27;i++){
          bedInfo.value[i] = bedInfoData.value[i].bedStatus;
        }
        console.log(bedInfo.value);
      })
      .catch(error => {
        console.error('错误:', error);
      });
}

// 统计各个状态的床位数量
const countData = ref("");

const countBedStatus = () => {
  // 发送 GET 请求到后端
  axios.get('http://localhost:9090/bed-info/getBedStatusCount', {
    params: {
      floor: value.value // 将选择的值作为参数传递
    }
  })
      .then(response => {
        console.log('从后端成功获取信息:', response.data);
        countData.value = response.data;
        console.log('打印countData的内容:', countData.value);
      })
      .catch(error => {
        console.error('错误:', error);
      });
}

const switchColor = (num) =>{
  switch(num){
    case 1:
      alert("1");
      break;
    case 2:
      alert("2");
      break;
    case 3:
      alert("3");
      break;
    case 4:
      alert("4");
      break;
    case 5:
      alert("5");
      break;
    case 6:
      alert("6");
      break;
    case 7:
      alert("7");
      break;
    case 8:
      alert("8");
      break;
  }
}
onMounted(() => {
  switchColor();
})


// function switchColor(num){

// }




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
.fontBed i{
  font-size: 30px;
}


//8种床位状态对应的颜色
.status-one {
  color: #2CBE56;
}

.status-two {
  color: #999999;
}

.status-three {
  color: #ffa406;
}

.status-four {
  color: #df0003;
}

.status-five {
  color: #000000;
}

.status-six {
  color: #409EFF;
}

.status-seven {
  color: #a0a224;
}

.status-eight {
  color: #df007e;
}



</style>