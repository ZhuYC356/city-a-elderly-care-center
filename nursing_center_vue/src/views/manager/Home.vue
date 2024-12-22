<template>
  <div>
    <div class="card" style="padding: 15px">
      您好，{{ user?.name }}！欢迎使用本系统
    </div>
    <div style="display: flex; margin: 10px 0">
      <div style="width: 100%;" class="card">
        <div style="margin-bottom: 30px; font-size: 20px; font-weight: bold">公告列表</div>
        <div>
          <el-timeline reverse slot="reference">
            <el-timeline-item v-for="item in notices" :key="item.id" :timestamp="item.time">
              <el-popover
                  placement="right"
                  width="200"
                  trigger="hover"
                  :content="item.content">
                <span slot="reference">{{ item.title }}</span>
              </el-popover>
            </el-timeline-item>
          </el-timeline>
        </div>
      </div>
    </div>
    <!--        控制面板-->
    <div style="margin-top: 30px">
      <el-row :gutter="20">
        <el-col :span="6">
          <div class="card">
                <span>
                  当前入住总人数：
                </span>
            <span>
                  {{ dataFrom.sumPerson }}
                </span>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="card">
                <span>
                  今天服务完成度：
                </span>
            <span>
                   {{ dataFrom.sumService }}%
                </span>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="card">
                <span>
                  外出人数：
                </span>
            <span>
                  {{ dataFrom.sumOut }}
                </span>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="card">
                <span>
                  当前护工在岗数量：
                </span>
            <span>
                  {{ dataFrom.sumNurse }}
                </span>
          </div>
        </el-col>
      </el-row>
      <div ref="chart"></div>
    </div>
    <Foot/>
  </div>
</template>

<script>
import Foot from '@/components/Foot'
import * as echarts from "echarts";


export default {
  name: 'Home',
  data() {
    return {
      dataFrom: {
        sumPerson: 101,
        sumOut: 10,
        sumNurse: 20,
        sumService: 49
      },
      user: JSON.parse(localStorage.getItem('user')),
      notices: [
        {
          title: '欢迎使用',
          content: '欢迎使用本系统',
          time: '2024-11-11'
        },
        {
          title: '关于',
          content: '关于本系统',
          time: '2024-11-12'
        },
        {
          title: '关于',
          content: '关于本系统',
          time: '2024-11-13'
        },
        {
          title: '关于',
          content: '关于本系统',
          time: '2024-11-14'
        }

      ]
    }
  },
  components: {
    Foot
  }
}
</script>
<style scoped>
.el-row {
  margin-bottom: 20px;

  &:last-child {
    margin-bottom: 0;
  }
}

.el-col {
  border-radius: 4px;
}

.bg-purple-dark {
  background: #99a9bf;
}

.bg-purple {
  background: #d3dce6;
}

.bg-purple-light {
  background: #e5e9f2;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}
</style>
