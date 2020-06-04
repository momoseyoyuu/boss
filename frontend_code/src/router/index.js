import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../components/Login.vue'
import Home from '../components/Home.vue'
import Welcome from '../components/Welcome.vue'
import Usermanage from '../components/Usermanage.vue'
import Gridmanage from '../components/Gridmanage.vue'

Vue.use(VueRouter)

const routes = [{
        path: '/',
        redirect: '/login'
    },
    // 登录页面组件
    {
        path: '/login',
        component: Login
    },
    // 首页页面组件
    {
        path: '/home',
        component: Home,
        redirect: '/welcome',
        children: [
            // 欢迎界面组件
            {
                path: '/welcome',
                component: Welcome
            },
            // 网格单元管理系统-用户管理组件
            {
                path: '/usermanage',
                component: Usermanage
            },
            {
                path: '/gridmanage',
                component: Gridmanage
            }
        ]
    },
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router