<template>
    <div class="unlogin">
        <div class="section_inner clearFix " v-bind:class="{'play':!active}">
            <h2 class="unlogin__tit"></h2>
            <div class="unlogin__desc"></div>
            <a href="javascript:;"
                @click="loginHandler"
               class="mod_btn_green  unlogin__btn js_login">立即登录</a>
        </div>
    </div>
</template>
<script>
export default {

    name: 'unlogin',

    props: {},
    data() {
        return {
            // active:this.$store.state.islogin
        }
    },
    methods:{
        loginHandler(){
            if(!this.$store.state.islogin){//未登录时点击显示登录框
               this.$store.commit('setloginShow', true); 
            }
        }
    },
    computed:{
        active(){
            return this.$store.state.islogin;
        }
    }

}
</script>
<style scoped>
@media screen and (max-height: 800px) {
    .unlogin {
        height: 622px;
    }
    .unlogin__tit {
        margin-top: 210px;
    }
}

.unlogin {
    background: url(../../image/indexImg/bg_profile_unlogin.jpg) 50% no-repeat;
    background-size: cover;
    overflow: hidden;
}

.section_inner {
    max-width: 1200px;
    margin: 0 auto;
    position: relative;
}

.unlogin__desc,
.unlogin__tit {
    opacity: 1;
    width: 735px;
    height: 64px;
    background-image: url(../../image/indexImg/profile_tit.png);
    margin-left: auto;
    margin-right: auto;
    background-position: 0 0;
    -webkit-transform: translate(0, 0);
    -webkit-transition-delay: .1s;
    -webkit-transition: all 1s;
}

.play .unlogin__btn,
.play .unlogin__desc,
.play .unlogin__tit {
    opacity: 1;
    -webkit-transform: translate(0, 0);
}

.unlogin__btn,
.unlogin__desc,
.unlogin__tit {
    opacity: 0;
    -webkit-transform: translate(0, 60px);
    -webkit-transition: all 1s;
}

.unlogin__desc {
    width: 345px;
    height: 30px;
    background-position: 0 -70px;
    margin-top: 30px;
    margin-bottom: 36px;
}

.unlogin__btn {
    display: block;
    font-size: 20px;
    height: 48px;
    line-height: 48px;
    width: 150px;
    text-align: center;
    margin: 0 auto;
    -webkit-transition-delay: .3s;
    line-height: 49px;
}

.mod_btn_green {
    border: 1px solid #31c27c;
    background-color: #31c27c;
    color: #fff;
    overflow: hidden;
}
</style>