<template>
    <div class="minelogin">
        <!--背景信息-->
        <div class="user_top mod_profile">
            <div class="section_inner">
                <img class="profile__cover"
                     :src="userImgsrc">
                <h1 class="profile__tit">
                    <span class="profile__name">{{personData.nickname}}</span>
                    <img src="//i.gtimg.cn/music/icon/v1/mac/svip_g@2x.png" alt="绿钻" class="lv_icon"></a>
                    <img src="//i.gtimg.cn/music/icon/v1/mac/sui_g@2x.png?max_age=2592000" alt="付费音乐包" class="lv_icon">
                    </h1>
                <ul class="mod_user_statistic">
                    <li class="user_statistic__item">
                        <strong class="user_statistic__number js_num_follow">141</strong>
                        <span class="user_statistic__tit">关注</span>
                    </li>
                    <li class="user_statistic__item user_statistic__item--last">
                        <strong class="user_statistic__number js_num_fans">1750</strong>
                        <span class="user_statistic__tit">粉丝</span>
                    </li>
                </ul>
            </div>
        </div>
        <!--喜欢,歌单模块-->
        <div class="main main--profile">
            <!--我喜欢列表和我创建的歌单导航条-->
            <div class="mod_tab profile_nav"
                 id="nav">
                <li v-for="navli in navlist"
                    @click="toggleOn(navli.req)">
                    <router-link v-bind:to='navli.req'
                                 v-bind:class="{'mod_tab__current':isActive==navli.req}"
                                 class="mod_tab__item">
                        {{navli.nav}}
                    </router-link>
                </li>
            </div>
            <!--我喜欢的歌曲模块-->
            <router-view></router-view>
        </div>
    
    </div>
</template>
<script>
export default {
    name: 'MyMusicPage',
    data() {
        return {
            navlist:
            [{ nav: '我喜欢', req: '/mine/favoritelist' },
            { nav: '我创建的歌单', req: '/mine/createlist' },
            { nav: '关注', req: '/mine/watch' },
            { nav: '粉丝', req: '/mine/fans' }
            ],
            isActive: this.$route.path,
            userImgsrc:"http://on4akwtwp.bkt.clouddn.com/user.jpg"
        }
    },
    methods: {
        toggleOn(req) {
            this.isActive = req;
        }
    },
    computed: {
        personData() {
            return this.$store.state.personData;
        }
    },
    mounted(){
       if(localStorage.getItem('userid')!=undefined){
           this.$store.commit("setPersonData",localStorage);
       }
       // if(localStorage.getItem('userid')==1){
       //          this.userImgsrc= "http://on4akwtwp.bkt.clouddn.com/user.jpg";
       //      }else{
       //          this.userImgsrc="http://on4akwtwp.bkt.clouddn.com/p_03.png";
       //  }
    }
}
</script>
<style scoped>
.user_top {
    height: 315px;
    padding-top: 65px;
    background: url(../../image/bg_profile.jpg) 50% no-repeat;
    background-size: cover;
    text-align: center;
    color: #fff
}

.section_inner {
    max-width: 1200px;
    margin: 0 auto;
    position: relative;
}

.profile__cover {
    display: block;
    width: 102px;
    height: 102px;
    margin: 0 auto;
    border: 4px solid #fff;
    border-radius: 99px;
    background: #fff;
}

.profile__tit {
    font-size: 0;
}

.profile__name {
    font-size: 30px;
    font-weight: 400;
    line-height: 64px;
    margin-right: 4px;
}

.lv_icon {
    vertical-align: -3px;
}

.mod_profile .mod_user_statistic {
    margin-top: 4px;
}

.mod_user_statistic {
    height: 40px;
    margin: 30px 15px 26px;
    overflow: hidden;
    font-size: 0;
}

.user_statistic__item {
    display: inline-block;
    border-right: solid 1px #ededed;
    width: 33%;
    text-align: center;
}

.mod_profile .user_statistic__item {
    width: auto;
    padding: 0 25px;
    border-color: #24313d;
}

.user_statistic__number {
    display: block;
    font-size: 22px;
    line-height: 24px;
    color: #444;
    margin-top: -1px;
    font-weight: 400;
}

.user_statistic__tit {
    display: block;
    color: #999;
    font-size: 14px;
}

.mod_profile .user_statistic__number,
.mod_profile .user_statistic__tit {
    color: #fff;
}

.main {
    min-height: 500px;
    z-index: 2;
    max-width: 1200px;
    margin: 0 auto;
    position: relative;
}

.profile_nav {
    position: absolute;
    top: -56px;
    left: 0;
    width: 100%;
    margin-bottom: 0;
    width: 80%;
}

.mod_tab {
    margin-bottom: -20px;
    overflow: hidden;
    border-bottom: 0 none;
    zoom: 1;
    height: 56px;
    line-height: 56px;
}

.profile_nav .mod_tab__current,
.profile_nav .mod_tab__item:hover {
    color: #31c27c;
}

.mod_tab__item {
    color: #fff;
}

.mod_tab__current {
    color: #31c27c;
}

.mod_tab__item {
    position: relative;
    float: left;
    font-size: 16px;
    overflow: hidden;
    margin-right: 55px;
}

.mod_tab,
.mod_tab__item {
    height: 56px;
    line-height: 56px;
}
</style>