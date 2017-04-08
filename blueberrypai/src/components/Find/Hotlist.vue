<template>
    <div class="movement">
        <!--标题-->
        <a class="p-title"
           href="#">
            <span class="p-title-c">热门歌单</span>
            <div class="icon"><img src="" alt=""></div>
            <span class="p-title-e">MOVEMENT</span>
        </a>
        <!--主体-->
        <div class="main">
            <ul class="clearFix">
               
                <li class="playlist__item"
                             
                    v-for="(item,index) in hostlist">
                    <div class="playlist__item_box">
                        <div class="playlist__cover mod_cover">
                            <img class="playlist__pic"
                                 v-bind:src="item.AlbumCover" />
                            <i class="mod_cover__mask"></i>
                             <!--绑定点击事件，添加到播放列表-->
                            <i class="mod_cover__icon_play js_play" 
                               v-on:click="addtolist(index)"></i>
                        </div>
                        <h4 class="playlist__title" @click="goToSongmenu(index)">
                                <span class="playlist__title_txt">{{item.AlbumTitle}}</span>
                                <a href="javascript:;" class="btn_operate_menu"></a>
                		 </h4>
                        <div class="playlist__other">
                            播放量：{{item.playcount}}万 
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    
    </div>
</template>    
<script>
export default {
    name: 'hotlist',
    props:{
        hostlist:[Array]
    },
    methods: {
        // 点击跳转至歌单页面
        goToSongmenu(id){
            window.scrollTo(0,0);
            this.$router.push("/songmenu");
            localStorage.setItem('currlistid',id);
            localStorage.setItem('currlistapi',"/recommend");
        },
        addtolist(id){
            this.$http.post('http://localhost:3000/recommend',{'id':id} )
                .then(res => {
                    var data = res.data;//获取的歌曲列表集合
                    this.$store.commit('addToplaylist',data);  //vuex控制全局的playlist
                    this.$store.commit('setCursonginfo', 0);
                }).catch(err => {
                    console.log(err)
                })
        }
    }
}
</script>
<style scoped>
.movement {
    width: 1200px;
    margin: 0 auto 50px;
}


/*主体*/

ul>li.playlist__item:hover {
    background: #31c27c;
}

ul>li:hover .playlist__other {
    color: #c1e9d5;
}

.playlist__cover:hover .playlist__pic {
    -webkit-transform: scale(1.07) translateZ(0);
    -webkit-transition: -webkit-transform .75s cubic-bezier(0, 1, .75, 1);
    transform: scale(1.07) translateZ(0);
    transition: transform .75s cubic-bezier(0, 1, .75, 1);
}

.mod_cover:hover .mod_cover__mask {
    opacity: .2;
    filter: alpha(opacity=20);
    -webkit-transition: opacity .5s;
    transition: opacity .5s;
}

.mod_cover:hover .mod_cover__icon_play {
    background: 0 0\9;
    filter: progid:dximagetransform.microsoft.alphaimageloader(src="http://imgcache.gtimg.cn/mediastyle/yqq/img/cover_play.png", sizingmethod="crop") alpha(opacity=90);
    opacity: .9;
    -webkit-transform: scale(1);
    -webkit-transition-property: opacity, -webkit-transform;
    -webkit-transition-duration: .5s;
    transform: scale(1);
    transition-property: opacity, transform;
    transition-duration: .5s;
    cursor: pointer;
}

.playlist__item:hover .btn_operate_menu {
    opacity: 1;
    -webkit-transition-duration: .3s;
    transition-duration: .3s;
}

ul>li {
    float: left;
    background: rgba(0, 0, 0, .8);
    font-size: 16px;
    padding-bottom: 0;
    width: 300px;
    height: 465px;
    overflow: hidden;
}

ul>li:nth-child(even) {
    background-color: #414141;
}

.playlist__item_box {
    margin-right: 0;
    position: relative;
}

.playlist__cover {
    margin-bottom: 57px;
    position: relative;
    display: block;
    height: 300px;
    overflow: hidden;
}

.mod_cover {
    zoom: 1;
}

.playlist__pic {
    border: 0 none;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    -webkit-transform: scale(1) translateZ(0);
    -webkit-transition: -webkit-transform .75s;
    transform: scale(1) translateZ(0);
    transition: transform .75s;
}

.mod_cover__mask {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: #000;
    opacity: 0;
    filter: alpha(opacity=0);
    -webkit-transition: opacity .5s;
    transition: opacity .5s;
}

.mod_cover__icon_play {
    background-image: url("../../image/indexImg/cover_play.png");
}

.mod_cover__icon_play {
    position: absolute;
    left: 50%;
    top: 50%;
    margin: -35px;
    width: 70px;
    height: 70px;
    filter: alpha(opacity=0);
    opacity: 0;
    -webkit-transform: scale(.7);
    -webkit-transition-property: opacity, -webkit-transform;
    -webkit-transition-duration: .5s;
    transform: scale(.7);
    transition-property: opacity, transform;
    transition-duration: .5s;
    zoom: 1;
}

.playlist__title {
    position: relative;
    max-width: 75%;
    padding: 0 26px;
    height: 22px;
    text-align: center;
    margin: 0 auto;
    cursor: pointer;
}

.playlist__title_txt {
    color: #fff;
    display: inline-block;
    max-width: 100%;
    font-weight: 400;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 22px;
}

.btn_operate_menu {
    bottom: 23px;
    top: 2px;
    display: inline-block;
    background-position: -180px -100px;
    right: 0;
    opacity: 0;
    -webkit-transition-property: opacity;
    -webkit-transition-duration: .3s;
    transition-property: opacity;
    transition-duration: .3s;
    position: absolute;
    width: 20px;
    height: 20px;
    background-image: url(../../image/indexImg/icon_sprite.png);
    background-position: -180px -100px;
}

.playlist__other {
    line-height: 20px;
    margin-bottom: 57px;
    color: #999;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 22px;
    text-align: center;
}


/*<!--标题-->*/

.movement .p-title {
    width: 140px;
    margin: 40px auto;
    display: block;
    text-align: center;
    color: #292929;
}

.p-title .p-title-c {
    font-size: 35px;
    display: block;
    margin-bottom: 10px;
    position: relative;
}

.p-title .icon {
    text-align: center;
    position: relative;
}

.p-title .icon img {
    margin-bottom: 5px;
}

.p-title .p-title-e {
    font-size: 16px;
    display: block;
    font-family: Arial;
    margin-bottom: 5px;
    position: relative;
}

.p-title .icon::before {
    content: "";
    display: block;
    width: 48px;
    height: 2px;
    position: absolute;
    left: -40px;
    top: 8px;
    background: #e0e0e0;
}

.p-title .icon::after {
    content: "";
    display: block;
    width: 48px;
    height: 2px;
    position: absolute;
    right: -35px;
    top: 8px;
    background: #e0e0e0;
}
</style>