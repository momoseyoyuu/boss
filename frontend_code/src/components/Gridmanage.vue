<template>
  <div style="margin-top: 15px;width:100%">
    <!-- 搜索框及添加网格单元区域 -->
    <el-card>
      <el-row :gutter="5">
        <el-col :span="10">
          <!-- 搜索区域 -->
          <el-input
            placeholder="请输入网格单元名称"
            class="input-with-select"
            clearable
            v-model="queryInfo.query"
          >
            <el-button
              slot="append"
              icon="el-icon-search"
              @click="getgridcellsbyword(queryInfo.query)"
            ></el-button>
          </el-input>
        </el-col>
        <!-- 测试按钮 -->
        <!-- <el-col :span="1">
          <el-button type="primary" style="margin-left: 16px;" @click="test">功能测试</el-button>
        </el-col>-->
      </el-row>
    </el-card>
    <!-- 网格单元列表区域 -->
    <el-table :data="gridCellsData" border style="width: 100%;margin-top:15px;">
      <el-table-column prop="gridcellid" label="网格单元ID" width="100" align="center"></el-table-column>
      <el-table-column prop="gridcellname" label="网格单元名称" span="2" align="center"></el-table-column>
      <el-table-column prop="gridcellcode" label="网格单元编码" span="1" align="center"></el-table-column>
      <el-table-column prop="customermanagername" label="客户经理" span="1" align="center"></el-table-column>
      <el-table-column prop="installermanagername" label="装维经理" span="1" align="center"></el-table-column>
      <el-table-column prop="operate" label="操作" span="1" align="center">
        <!-- 操作区域 -->
        <!-- 按钮文字提示 -->
        <el-tooltip
          class="item"
          effect="dark"
          content="编辑"
          placement="top"
          :enterable="false"
          transition="none"
          slot-scope="scope"
        >
          <!-- 按钮 -->
          <el-button
            type="primary"
            icon="el-icon-edit"
            size="mini"
            @click="getgridcellsbyid(scope.row.gridcellid)"
          ></el-button>
        </el-tooltip>
      </el-table-column>
    </el-table>
    <!-- 底部导航菜单 -->
    <div class="block" style="margin-top:15px;display:flex;justify-content:flex-end">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[5,10,20,50,100]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </div>

    <!-- 编辑对话框 -->
    <el-dialog
      style="cursor:default"
      :title="GridCells.title"
      :visible.sync="editDialog"
      width="30%"
      :before-close="handleClose"
      :show-close="false"
      unselectable="on"
      onselectstart="return false;"
    >
      <!-- 客户经理信息表单 -->
      <div>
        <div class="Manager">客户经理信息</div>
        <el-form :model="GridCells" ref="GridCellsRef" label-width="80px" label-position="left">
          <el-form-item label="姓　　名">
            <!-- <el-input placeholder="请输入姓名" v-model="GridCells.customermanagername"></el-input> -->
            <!-- <el-autocomplete
              v-model="GridCells.customermanagername"
              :fetch-suggestions="querySearch"
              placeholder="请输入内容"
              :trigger-on-focus="false"
              @select="handleSelect"
            ></el-autocomplete>-->
            <el-select
              v-model="GridCells.customermanagername"
              filterable
              placeholder="请选择"
              @change="matchingcminfo(GridCells.customermanagername)"
              class="managerSelect"
            >
              <el-option
                v-for="item in managerInfo"
                :key="item.id"
                :label="item.value"
                :value="item.id"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="智改工号">
            <el-input placeholder="请输入内容" v-model="cmInfo.zgjobnumber" :disabled="true"></el-input>
          </el-form-item>
          <el-form-item label="沙盘工号">
            <el-input placeholder="请输入内容" v-model="cmInfo.spjobnumber" :disabled="true"></el-input>
          </el-form-item>
        </el-form>
      </div>
      <!-- 装维经理表单 -->
      <div style="border-top:1px solid black">
        <div class="Manager">装维经理信息</div>
        <el-form ref="form" :model="GridCells" label-width="80px" label-position="left">
          <el-form-item label="姓　　名">
            <el-select
              v-model="GridCells.installermanagername"
              filterable
              placeholder="请选择"
              @change="matchingiminfo(GridCells.installermanagername)"
              class="managerSelect"
            >
              <el-option
                v-for="item in managerInfo"
                :key="item.id"
                :label="item.value"
                :value="item.id"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="智改工号">
            <el-input placeholder="请输入内容" v-model="imInfo.zgjobnumber" :disabled="true"></el-input>
          </el-form-item>
          <el-form-item label="沙盘工号">
            <el-input placeholder="请输入内容" v-model="imInfo.spjobnumber" :disabled="true"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="handleClose">取 消</el-button>
          <el-button type="primary" @click="savedata">保 存</el-button>
        </span>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 搜索内容
      queryInfo: {
        query: "",
        code: ""
      },
      // 选择客户经理姓名后返回改客户经理的智改工号和沙盘工号
      cmInfo: [],
      // 选择客户经理姓名后返回改客户经理的智改工号和沙盘工号
      imInfo: [],

      // 所有经理信息
      managerInfo: [],
      usersname: [],
      state: "",
      // 控制编辑对话框显示与否
      editDialog: false,
      // 列表当前页码
      currentPage: 1,
      // 列表当前每页显示数据条数
      pageSize: 10,
      // 搜索框内容
      search: "",
      // 数据总条数
      total: 1,
      // 网格单元数据
      gridCellsData: [],
      // 编辑对话框表单
      GridCells: {
        title: "",
        customermanagername: "",
        customermanagerZGJN: "",
        customermanagerSPJN: "",
        installermanagername: "",
        installermanagerZGJN: "",
        installermanagerSPJN: ""
      }
    };
  },
  created() {
    this.getgridcellsbycode();
    this.getmanager();
  },

  methods: {
    // //   测试按钮
    // test() {
    //   for (var i = 1; i < 2; i++) {
    //     // console.log(i);
    //   }
    // },
    //   获取网格单元信息
    async getgridcellsbycode() {
      const token = window.sessionStorage.getItem("token");
      const { data: res } = await this.$http.get(
        "/getgridcellsbycode/" + token
      );
      this.gridCellsData = [];
      this.total = res.length;
      let i = (this.currentPage - 1) * this.pageSize;
      let j = this.currentPage * this.pageSize;
      //   console.log(i);
      //   console.log(this.total <= this.pageSize);
      //   console.log(j);

      if (this.total <= this.pageSize) {
        for (i; i < this.total; i++) {
          this.gridCellsData.push(res[i]);
          console.log(this.gridCellsData);
        }
      } else {
        for (i; i < j; i++) {
          this.gridCellsData.push(res[i]);
        }
      }

      //   console.log(this.gridCellsData);
    },

    // 根据id查询单元信息
    async getgridcellsbyid(id) {
      const { data: res } = await this.$http.get("/getgridcellsbyid/" + id);
      //   console.log(res);
      this.GridCells.title = res.gridcellname;
      this.GridCells.customermanagername = res.customermanagername;
      this.GridCells.customermanagerZGJN = res.customermanagerZGJN;
      this.GridCells.customermanagerSPJN = res.customermanagerSPJN;
      this.GridCells.installermanagername = res.installermanagername;
      this.GridCells.installermanagerZGJN = res.installermanagerZGJN;
      this.GridCells.installermanagerSPJN = res.installermanagerSPJN;
      this.cmInfo.name = this.GridCells.customermanagername;
      this.cmInfo.zgjobnumber = this.GridCells.customermanagerZGJN;
      this.cmInfo.spjobnumber = this.GridCells.customermanagerSPJN;
      this.imInfo.name = this.GridCells.installermanagername;
      this.imInfo.zgjobnumber = this.GridCells.installermanagerZGJN;
      this.imInfo.spjobnumber = this.GridCells.installermanagerSPJN;
      this.editDialog = true;
    },

    // 根据网格单元名称获取符合条件的网格单元信息
    async getgridcellsbyword(word) {
      this.queryInfo.query = word;
      this.queryInfo.code = window.sessionStorage.getItem("token");
      //   console.log(code);
      const { data: res } = await this.$http.get("/getgridcellsbyword/", {
        params: this.queryInfo
      });
      //   console.log(res);
      this.currentPage = 1;
      this.gridCellsData = [];
      this.total = res.length;
      let i = (this.currentPage - 1) * this.pageSize;
      let j = this.currentPage * this.pageSize;
      //   console.log(i);
      //   console.log(this.total <= this.pageSize);
      //   console.log(j);

      if (this.total <= this.pageSize) {
        for (i; i < this.total; i++) {
          this.gridCellsData.push(res[i]);
          console.log(this.gridCellsData);
        }
      } else {
        for (i; i < j; i++) {
          this.gridCellsData.push(res[i]);
        }
      }
    },

    // 获取页面大小
    handleSizeChange(val) {
      //   console.log(`每页 ${val} 条`);
      this.pageSize = val;
      if (this.queryInfo.query) {
        this.getgridcellsbyword(this.queryInfo.query);
      } else {
        this.getgridcellsbycode();
      }
    },
    // 获取当前页码
    handleCurrentChange(val) {
      //   console.log(`当前页: ${val}`);
      this.currentPage = val;
      if (this.queryInfo.query) {
        console.log("1");

        this.getgridcellsbyword(this.queryInfo.query);
      } else {
        this.getgridcellsbycode();
      }
    },

    // 编辑对话框-建议功能
    querySearch(queryString, cb) {
      var cmnames = this.cmnames;
      var results = queryString
        ? cmnames.filter(this.createFilter(queryString))
        : cmnames;
      // 调用 callback 返回建议列表的数据
      cb(results);
    },
    createFilter(queryString) {
      return cmname => {
        return (
          cmname.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0
        );
      };
    },
    handleSelect(item) {
      console.log(item);
    },
    // 获取所有经理信息
    async getmanager() {
      const { data: res } = await this.$http.get("getmanager");
      for (let item of res) {
        //   修改name的属性名为value
        this.managerInfo.push({
          id: item.id,
          value: item.name
        });
      }
      //   console.log(this.cmnames);
    },

    // 关闭对话框提示
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          this.editDialog = false;
        })
        .catch(_ => {});
    },

    // 根据用户选择的姓名，匹配该姓名名下的工号
    async matchingcminfo(name) {
      const { data: res } = await this.$http.get("/getcminfo/" + name);
      this.cmInfo = res[0];
      //   console.log(this.cmInfo);
    },
    // 根据用户选择的姓名，匹配该姓名名下的工号
    async matchingiminfo(name) {
      //   console.log(id);
      const { data: res } = await this.$http.get("/getiminfo/" + name);
      this.imInfo = res[0];
      //   console.log(this.cmInfo);
    },
    //   保存数据
    async savedata() {
      if (this.cmInfo.name == null) {
        this.GridCells.customermanagername = "";
        this.GridCells.customermanagerZGJN = "";
        this.GridCells.customermanagerSPJN = "";
      } else {
        this.GridCells.customermanagername = this.cmInfo.name;
        this.GridCells.customermanagerZGJN = this.cmInfo.zgjobnumber;
        this.GridCells.customermanagerSPJN = this.cmInfo.spjobnumber;
      }
      if (this.imInfo.name == null) {
        this.GridCells.installermanagername = "";
        this.GridCells.installermanagerZGJN = "";
        this.GridCells.installermanagerSPJN = "";
      } else {
        this.GridCells.installermanagername = this.imInfo.name;
        this.GridCells.installermanagerZGJN = this.imInfo.zgjobnumber;
        this.GridCells.installermanagerSPJN = this.imInfo.spjobnumber;
      }
      //   console.log(this.GridCells);
      const { data: res } = await this.$http.get("/savedata/", {
        params: this.GridCells
      });
      //   console.log(res);
      this.editDialog = false;
      this.getgridcellsbycode();
      this.$message.success("保存成功");
      //   this.getgridcellsbycode();
      //   console.log(this.GridCells);
    }
  },
  mounted() {}
};
</script>

<style lang="less">
.searchBtn {
  padding: 21px 0px;
}

.el-menu-item-group__title {
  padding: 0 !important;
}

// 对话框样式
.el-dialog {
  border-radius: 6px !important;
}

.el-dialog__header {
  margin-top: 30px;
  background-color: #409eff;
  border-radius: 6px 6px 0px 0px;
}

.el-dialog__title {
  color: #fff !important;
}

.el-dialog__body {
  padding: 15px !important;
}

.Manager {
  font-size: 24px;
  margin: 12px 0px;
  cursor: default;
}

.managerSelect {
  width: 100% !important;
}
</style>