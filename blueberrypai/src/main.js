// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'; //引用ajax请求插件
Vue.prototype.$http = axios;
Vue.config.productionTip = false;
import Vuex from 'vuex';
Vue.use(Vuex);

const store = new Vuex.Store({
    // 定义状态
    state: {
        islogin: false,
        playlist: {},
        lockbtnStus: false,
        loginModelShow: false,
        cursonginfo: {},
        personData: {},
    },
    mutations: {
        setloginStaus: (state, data) => { //登录状态，是否登录
            state.islogin = data;
        },
        addToplaylist: (state, data) => { //添加到播放列表
            state.playlist = data;
        },
        setlockbtnStus: (state, data) => { //底部播放器是否锁定
            state.lockbtnStus = data;
        },
        setloginShow: (state, data) => { //登录框的显示状态
            state.loginModelShow = data;
        },
        setCursonginfo: function(state, index) { //设置当前歌曲信息
            state.cursonginfo = state.playlist[index];
        },
        clearPlaylist: (state) => { //清空歌单
            state.playlist = {};
            state.cursonginfo = {};
        },
        setPersonData: (state, data) => { //设置用户数据
            state.personData = data;
        }
    }
})
new Vue({
    el: '#app',
    router,
    store,
    template: '<App/>',
    components: {
        App
    }
})