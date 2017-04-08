<template>
  <div class="header" v-on:transitClass="transitClass">
    <div class="header-in clearFix">
      <Logo></Logo>
      <Mnav v-bind:Nav="msg"></Mnav>
      <Login></Login>
    </div>
  </div>
</template>

<script>
import axios from 'axios'; //引用ajax请求插件
import Logo from './Logo'
import Mnav from './Mnav'
import Login from './Login'

export default {
  name: 'header',
  components: {
    Logo,
    Mnav,
    Login
  },
  data() {
    return {
      msg:[
        {nav:'音乐馆',req:'/'},
        {nav:'我的音乐',req:'/mine'},
        {nav:'诚品',req:'/chengpin'},
        {nav:'蓝莓酱',req:'/buleMJ'},
        {nav:'社区',req:'/shequ'}
      ]
    }
  },
  methods: {
      transitClass(data){// 我的音乐页面未登录时进入页面的过度效果
        this.$emit("transitClass",data);
      },
  }
}
</script>


<style scoped>
@import url(../../style/commonHeader.css);
</style>
