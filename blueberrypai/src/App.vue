<template>
  <div id="app">
    <v-head></v-head>
    <!--登录注册模态框-->
    <Loginbox></Loginbox>
    <article>
    <transition name="fade"> 
      <router-view></router-view>
    </transition>
    </article>
    <v-foot></v-foot>
    <Btmbar></Btmbar>
  </div>
</template>

<script>
import Header from './components/Header/Header'
import Footer from './components/Footer/Footer'
import Loginbox from './components/Loginbox/Loginbox'
import Btmbar from './components/Footer/Btmbar'

export default {
  name: 'app',
  data() {
    return {
      isloginmodal: 'false',
      addPlayList: []
    }
  },
  methods: {

  },
  components: {
    'v-head': Header,
    'v-foot': Footer,
    "Loginbox": Loginbox,
    "Btmbar": Btmbar
  },
  mounted() {
    this.$http.get('/getSession')
      .then(res => {
        this.$store.commit('setloginStaus', res.data.state);
      }).catch(err => {
        console.log(err)
      });
      var islock=localStorage.getItem('lockbtnStus');
      this.$store.commit('setlockbtnStus', islock);   

      // var id=localStorage.getItem('currlistid');
      // var api=localStorage.getItem('currlistapi');
      // console.log(id,api); console.log(localStorage);
      // if(id!=undefined && api!=undefined){
      //   this.$http.post("http://localhost:3000"+api, { "id":id})
      //     .then(res => {
      //       this.$store.commit('addToplaylist', res.data);
      //     }).catch(err => {
      //         console.log(err)
      //     })  
      // }
       
  }
}
</script>

<style>
@import url(./style/init.css);
article {
  min-height: 450px;
  width: 100%;
  overflow: hidden;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .3s
}
.fade-enter, .fade-leave-active {
  opacity: 0
}
</style>
