<template>
  <el-container class="home-container" unselectable="on" onselectstart="return false">
    <el-header>
      <div class="home_title" @click="returnHome">
        <span>电信业务支撑系统</span>
        <!-- <button @click="change">测试</button> -->
      </div>
      <el-button type="info" @click="logout">退出</el-button>
    </el-header>
    <el-container>
      <el-aside :width="isCollapse ? '64px':'200px'">
        <div class="toggle-button" @click="toggleCollapse">|||</div>
        <el-menu
          :default-active="activePath"
          class="el-menu-vertical-demo"
          background-color="#545c64"
          text-color="#fff"
          active-text-color="#409BFF"
          :collapse="isCollapse"
          :collapse-transition="false"
          :router="true"
        >
          <!-- 一级菜单 -->
          <el-submenu :index="system.id + ''" v-for="system in systemList" :key="system.id">
            <template slot="title">
              <i :class="iconObj[system.id]"></i>
              <span>{{system.systemName}}</span>
            </template>
            <!-- 二级菜单 -->
            <el-menu-item-group>
              <el-menu-item
                :index="'/'+subSystem.path"
                v-for="subSystem in system.children"
                :key="subSystem.id"
              >
                <i :class="subSystem.iconObj"></i>
                <span>{{subSystem.systemName}}</span>
              </el-menu-item>
            </el-menu-item-group>
          </el-submenu>
        </el-menu>
      </el-aside>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
export default {
  data() {
    return {
      // 控制系统菜单折叠，默认收起
      isCollapse: true,
      // 左侧系统菜单数据
      systemList: [
        //   主系统菜单数据
        {
          id: 1,
          systemName: "网格单元管理系统",
          // 子系统菜单数据
          children: [
            // 用户管理菜单
            // {
            //   id: "1-1",
            //   systemName: "用户管理",
            //   path: "usermanage",
            //   iconObj: "el-icon-user"
            // },
            {
              id: "1-2",
              systemName: "网格单元管理",
              path: "gridmanage",
              iconObj: "el-icon-s-grid"
            }
          ]
        },
        { id: 2, systemName: "待开发" }
      ],
      // 菜单图标
      iconObj: {
        "1": "el-icon-office-building",
        "2": "el-icon-lock",
        "3": "el-icon-lock",
        "4": "el-icon-lock",
        "5": "el-icon-lock"
      },
      activePath: ""
      // circleUrl:
      //   "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"
    };
  },
  methods: {
    returnHome() {
      this.$router.push("./Home");
    },
    logout() {
      this.$router.push("./Login");
    },
    toggleCollapse() {
      this.isCollapse = !this.isCollapse;
    }
  }
};
</script>

<style lang="less">
.home-container {
  height: 100%;
}

.home_title {
  font-size: 24px;
  cursor: pointer;
}

.el-header {
  background-color: #3f4648;
  color: #fff;
  //   text-align: center;
  display: flex;
  justify-content: space-between;
  align-items: center;
  line-height: 60px;
  font-size: 16px;
}

.el-aside {
  background-color: #545c64;
  color: #fff;
  text-align: left;
  line-height: 200px;
  overflow-x: hidden;
  .el-menu {
    // position: absolute;
    // left: -20px;
    border-right: none;
  }
}

.el-menu--popup {
  padding: 0px !important;
}

.el-menu--popup-right-start {
  margin: 0px !important;
}

.toggle-button {
  background-color: #545c64;
  font-size: 12px;
  line-height: 24px;
  color: #fff;
  text-align: center;
  letter-spacing: 2px;
  cursor: pointer;
}

.el-button--info {
  background-color: #fcc515 !important;
  border-color: #fcc515 !important;
}
</style>