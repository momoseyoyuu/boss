<template>
  <div style="margin-top: 15px;width:100%">
    <!-- 搜索框及添加用户区域 -->
    <el-card>
      <el-row :gutter="5">
        <el-col :span="10">
          <!-- 搜索与添加区域 -->
          <el-input placeholder="请输入内容" class="input-with-select" clearable>
            <el-button slot="append" icon="el-icon-search" @click="getuser"></el-button>
          </el-input>
        </el-col>
        <el-col :span="1">
          <el-button
            type="primary"
            style="margin-left: 16px;"
            @click="centerDialogVisible = true"
          >添加用户</el-button>
        </el-col>
      </el-row>
    </el-card>
    <!-- 用户列表区域 -->
    <el-table :data="tableData" border style="width: 100%;margin-top:15px">
      <el-table-column type="index" label="序号" width="60" align="center"></el-table-column>
      <el-table-column prop="username" label="姓名" span="1" align="center"></el-table-column>
      <el-table-column prop="mobile" label="手机号码" span="1" align="center"></el-table-column>
      <el-table-column prop="email" label="邮箱" span="1" align="center"></el-table-column>
      <el-table-column prop="operate" label="操作" span="1" align="center">
        <!-- 操作按钮及按钮文字提示 -->
        <el-tooltip
          class="item"
          effect="dark"
          content="编辑"
          placement="top"
          :enterable="false"
          transition="none"
        >
          <el-button type="primary" icon="el-icon-edit" size="mini" @click="editDialogVisible=true"></el-button>
        </el-tooltip>
        <el-tooltip
          class="item"
          effect="dark"
          content="删除"
          placement="top"
          :enterable="false"
          transition="none"
        >
          <el-button type="danger" icon="el-icon-delete" size="mini" @click="deleteUser"></el-button>
        </el-tooltip>
      </el-table-column>
    </el-table>

    <!-- 用户列表底部导航菜单 -->
    <div class="block" style="margin-top:15px;display:flex;justify-content:flex-end">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage4"
        :page-sizes="[1,10,20,50,100]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </div>

    <!-- 添加用户的对话框 -->
    <el-dialog title="添加用户" :visible.sync="centerDialogVisible" width="30%" center>
      <el-form
        :model="addUserList"
        status-icon
        :rules="addUserRules"
        ref="addUserList"
        label-width="80px"
        label-position="left"
      >
        <el-form-item label="用户名" prop="username">
          <el-input type="text" v-model="addUserList.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input type="password" v-model="addUserList.password" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号码" prop="mobile">
          <el-input v-model="addUserList.mobile"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="addUserList.email"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
          <el-button @click="resetForm('addUserList')">重置</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentPage1: 5,
      currentPage2: 5,
      currentPage3: 5,
      currentPage4: 4,
      centerDialogVisible: false,
      pageSize: 1,
      // 用户名输入框内容
      input: "",
      // 搜索框内容
      search: "",
      // 数据条数
      total: 100,
      // 添加用户数据
      addUserList: { username: "", password: "", mobile: "", email: "" },
      // 用户数据验证规则
      addUserRules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { min: 3, max: 10, message: "长度在3到10个字符", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, max: 18, message: "长度在6到10个字符", trigger: "blur" }
        ],
        email: [{ required: true, message: "请输入邮箱", trigger: "blur" }],
        mobile: [
          { required: true, message: "请输入手机号码", trigger: "blur" },
          { min: 11, max: 11, message: "请输入正确的手机号码", trigger: "blur" }
        ]
      },
      // 用户假数据
      tableData: [
        {
          id: 1,
          username: "yoyuu",
          mobile: "13377693233",
          email: "13377693233@189.cn"
        },
        {
          id: 2,
          username: "李四",
          mobile: "13377693333",
          email: "13377693333@189.cn"
        },
        {
          id: 3,
          username: "李四",
          mobile: "13377693333",
          email: "13377693333@189.cn"
        },
        {
          id: 4,
          username: "李四",
          mobile: "13377693333",
          email: "13377693333@189.cn"
        }
      ]
    };
  },
  methods: {
    // 获取页面大小
    handleSizeChange(val) {
      console.log(`每页 ${val} 条`);
      this.pageSize = val;
    },
    // 获取当前页码
    handleCurrentChange(val) {
      console.log(`当前页: ${val}`);
    },
    deleteUser() {
      console.log(this);
    },
    resetForm(addUserList) {
      this.$refs[addUserList].resetFields();
    },
    // 获取网格单元信息
    async getgridcells() {
      const token = window.sessionStorage.getItem("token");
      const { data: res } = await this.$http.get("/gridcells/" + token);
      console.log(res);
    }
  }
};
</script>

<style lang="less">
.searchBtn {
  padding: 21px 0px;
}

.el-menu-item-group__title {
  padding: 0 !important;
}
.el-table {
  text-align: center !important;
}

.el-dialog__title {
  font-size: 24px !important;
}
</style>