<template>
  <div>
    <h2 style="margin-left: 10px;margin-bottom: 10px">
      检查申请
    </h2>
    <hr/>
    <el-tag type="success" style="font-size: 20px;width: 500px;height: 30px;margin-top: 10px">
      <h5 style="margin-top: 5px">
        本项目金额合计:
        {{ 360.00 }}元
      </h5>
    </el-tag>
    <br>
    <!--    表格    -->
    <el-button style="margin-top: 10px" type="primary" @click="">新增项目</el-button>
    <el-table
        :data="medicalTechnologyList"
        style="width: 100%"
    >
      <el-table-column label="医技项目" width="180">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <el-icon>
              <timer/>
            </el-icon>
            <span style="margin-left: 10px">{{ scope.row.techName }}</span>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="检查部位" width="180">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #reference>
              <el-tag>{{ scope.row.checkPosition }}</el-tag>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="开立时间" width="180">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #reference>
              <el-tag>{{ scope.row.creationTime }}</el-tag>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="单价" width="180">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #reference>
              <el-tag>{{ scope.row.techPrice }}</el-tag>
            </template>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column align="right">
        <template #header>
          <el-input v-model="search" size="small" placeholder="search"/>
        </template>
        <template #default="scope">
          <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
            编辑
          </el-button>
          <el-button
              size="small"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination background layout="prev, pager, next" :total="1000"/>
    <el-form :model="checkRequestForm" label-width="auto" style="max-width: 95%">
      <el-form-item label="检验目的" style="margin-top: 10px">
        <el-input v-model="checkRequestForm.checkInfo" type="textarea"/>
      </el-form-item>
    </el-form>
    <!-- 下半部分---------------------------------------------------------------->
    <h2 style="margin-left: 10px;margin-bottom: 10px">
      处置申请
    </h2>
    <hr/>
    <el-tag type="success" style="font-size: 20px;width: 500px;height: 30px;margin-top: 10px">
      <h5 style="margin-top: 5px">
        本项目金额合计:
        {{ 360.00 }}元
      </h5>
    </el-tag>
    <br>
    <!--    表格-->
    <el-button style="margin-top: 10px" type="primary" @click="">新增项目</el-button>

    <el-table
        :data="disposalLists"
        style="width: 100%"
    >
      <el-table-column label="处置项目" width="180">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #reference>
              <el-tag>{{ scope.row.name }}</el-tag>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="检查部位" width="180">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #reference>
              <el-tag>{{ scope.row.position }}</el-tag>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="开立时间" width="180">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #reference>
              <el-tag>{{ scope.row.creationTime }}</el-tag>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="单价" width="180">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #reference>
              <el-tag>{{ scope.row.price }}</el-tag>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column align="right">
        <template #header>
          <el-input v-model="search" size="small" placeholder="search"/>
        </template>
        <template #default="scope">
          <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
            编辑
          </el-button>
          <el-button
              size="small"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination background layout="prev, pager, next" :total="1000"/>

    <el-form :model="checkRequestForm" label-width="auto" style="max-width: 95%">
      <el-form-item label="处置目的" style="margin-top: 10px">
        <el-input v-model="checkRequestForm.checkInfo" type="textarea"/>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
export default {
  name: "检查申请",


  data() {
    return {
      sumMoney: '',
      checkRequestForm: {
        registerId: '',
        // 挂号ID

        medicalTechnologyId: '',
        // 医技ID

        checkPosition: '',
        // 检查部位

        checkInfo: '',
        // 检查目的

        creationTime: '',
        // 开立时间
      },
      medicalTechnology: {
        id: '1',
        techName: 'CT',
        techFormat: "",
        techPrice: "",
        techType: "",
        deptmentId: "",
      },

      medicalTechnologyList: [
        {
          techName: 'CT',
          techPrice: "200.00",
          techType: "影像",
          checkPosition: '胳膊',
          creationTime: '2024-11-19',
        },
        {
          techName: 'CT',
          techPrice: "200.00",
          techType: "影像",
          checkPosition: '胳膊',
          creationTime: '2024-11-19',
        }, {
          techName: 'CT',
          techPrice: "200.00",
          techType: "影像",
          checkPosition: '胳膊',
          creationTime: '2024-11-19',
        },
      ],
      disposalLists: [
        {
          name: 'CT',
          position: '胳膊',
          price: "200.00",
          creationTime: '2024-11-19',
        },
        {
          name: 'CT',
          position: '胳膊',
          price: "200.00",
          creationTime: '2024-11-19',
        }, {
          name: 'CT',
          position: '胳膊',
          price: "200.00",
          creationTime: '2024-11-19',
        }, {
          name: 'CT',
          position: '胳膊',
          price: "200.00",
          creationTime: '2024-11-19',
        }, {
          name: 'CT',
          position: '胳膊',
          price: "200.00",
          creationTime: '2024-11-19',
        }, {
          name: 'CT',
          position: '胳膊',
          price: "200.00",
          creationTime: '2024-11-19',
        },
      ],
    }
  },
  methods: {
    onSubmit() {
      console.log('submit!');
    },
    handleEdit(index, row) {
      // 传回的是索引和数据
      console.log(row)
      alert(index, row.name)
    },
    handleDelete(index, row) {
      alert(index, row)
    },
    add() {
      alert("新增")
    }
  }
}
</script>
<style scoped>

</style>