<template>
  <div class="login_container">
    <div class="logo">
      <img src="../assets/chinatelecom.png" class="logo" />
    </div>
    <div class="login_box">
      <!-- 头像区域 -->
      <div class="avatar_box">
        <h1>电信业务支撑系统</h1>
        <!-- <img src="../assets/logo.png" alt /> -->
      </div>
      <!-- 登录表单区域 -->
      <el-form class="login_form" :model="loginForm" :rules="loginFormRules" ref="loginFormRef">
        <!-- 用户名 -->
        <el-form-item prop="username">
          <el-input prefix-icon="el-icon-user" placeholder="请输入用户名" v-model="loginForm.username"></el-input>
        </el-form-item>
        <!-- 密码 -->
        <el-form-item prop="password">
          <el-input
            prefix-icon="el-icon-lock"
            placeholder="请输入密码"
            v-model="loginForm.password"
            show-password
          ></el-input>
        </el-form-item>
        <!-- 按钮 -->
        <el-form-item class="btns">
          <el-button type="primary" @click="login">登录</el-button>
          <!-- 点击重置按钮，重置登录表单 -->
          <el-button type="info" @click="resetLoginForm">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 登录表单的数据绑定对象
      loginForm: {
        username: "",
        password: ""
      },
      //   登录表单的验证规则对象
      loginFormRules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
          // { min: 2, max: 10, message: "长度在3到10个字符", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" }
          // { min: 6, max: 18, message: "长度在6到10个字符", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    // 清空输入框用户名密码
    resetLoginForm() {
      this.$refs.loginFormRef.resetFields();
    },

    // 登录验证
    login() {
      this.$refs.loginFormRef.validate(async valid => {
        if (!valid) return this.$message.error("用户名或密码格式错误");
        const { data: res } = await this.$http.post("login", this.loginForm);
        if (
          this.loginForm.username == res[0].username &&
          this.loginForm.password == res[0].password
        ) {
          this.$message.success("登录成功");
          this.$router.push("/home");
          // 将账号对应的虚拟网格单元编码保存到sessionStorage中
          // console.log(res[0].townid);
          window.sessionStorage.setItem("token", res[0].townid);
        } else {
          this.$message.error("用户名或密码错误，请重新输入");
        }
      });
    }
  }
};
</script>

<style lang="less" scoped>
.logo {
  position: absolute;
  left: 2%;
  top: 2%;
}

.logo > img {
  width: 280px;
  height: 80px;
}
.login_container {
  background-image: url("../assets/loginbackground.png");
  background-repeat: no-repeat;
  background-size: 100% 100%;
  height: 100%;
}

.login_box {
  width: 450px;
  height: 300px;
  background-color: rgba(255, 255, 255, 0.85);
  //   box-shadow: 0 0 10px #dddddd;
  border-radius: 15px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}

.avatar_box {
  h1 {
    background: linear-gradient(to right, #283048, #414345);
    background-clip: text;
    color: transparent;
  }
}

.login_form {
  position: absolute;
  bottom: 0;
  width: 100%;
  padding: 0 20px;
  box-sizing: border-box;
}

.btns {
  display: flex;
  justify-content: flex-end;
}
</style>