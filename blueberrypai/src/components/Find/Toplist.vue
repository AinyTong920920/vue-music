<template>
    <div class="toplist_box">
        <div class="section_inner">
            <div class="index__hd">
                <h2 class="index__tit"><i class="index__tit_sprite"></i></h2>
            </div>
            <a href="javascipt:;"
               class="index__more index__more--white">全部<i class="icon_index_arrow"></i></a>
            <div class="mod_toplist">
                <ul class="toplist__list">
    
                    <li class="toplist__item toplist__item--pop mod_cover">
                        <div class="toplist__bg"></div>
                        <i class="mod_cover__mask"></i>
                        <i class="mod_cover__icon_play js_play_toplist"  v-on:click="addtolist(2)"></i>
                        <i class="toplist__line"></i>
                        <h3 class="toplist__hd">
                            <a  @click="goToSongmenu(2)" href="javascript:scroll(0,0)" 
                            class="toplist__tit js_toplist" >
                                <i class="toplist__tit_top"></i>
                            <div class="toplist__tit_pop">流行指数</div></a>
                       </h3>
                        <ul class="toplist__songlist">
                            <li class="toplist__song"
                                v-for="(item,index) in poplist">
                                <div class="toplist__number">{{index+1}}</div>
                                <div class="toplist__songname">
                                   {{item.songname}}
                                </div>
                                <div class="toplist__artist">
                                    <a href="javascript:;"
                                       class="js_singer">{{item.author}}</a>
                                </div>
                            </li>
                        </ul>
                    </li>
    
                    <li class="toplist__item toplist__item--new mod_cover">
                        <div class="toplist__bg"></div>
                        <i class="mod_cover__mask"></i>
                        <i class="mod_cover__icon_play js_play_toplist"  v-on:click="addtolist(0)"></i>
                        <i class="toplist__line"></i>
                        <h3 class="toplist__hd">
                            <a  @click="goToSongmenu(0)" href="javascript:scroll(0,0)" 
                             class="toplist__tit js_toplist" >
                                <i class="toplist__tit_top"></i><div class="toplist__tit_pop">热歌</div>
                                </a>
                        </h3>
                        <ul class="toplist__songlist">
    
                            <li class="toplist__song"
                                v-for="(item,index) in hotlist">
                                <div class="toplist__number">{{index+1}}</div>
                                <div class="toplist__songname">
                                   {{item.songname}}
                                </div>
                                <div class="toplist__artist">
                                    <a href="javascript:;"
                                       class="js_singer">{{item.author}}</a>
                                </div>
                            </li>
                        </ul>
                    </li>
    
                    <li class="toplist__item toplist__item--hot mod_cover">
                        <div class="toplist__bg"></div>
                        <i class="mod_cover__mask"></i>
                        <i class="mod_cover__icon_play js_play_toplist"  v-on:click="addtolist(1)"></i>
                        <i class="toplist__line"></i>
                        <h3 class="toplist__hd">
                            <a @click="goToSongmenu(1)" href="javascript:scroll(0,0)" 
                            class="toplist__tit js_toplist">
                            <i class="toplist__tit_top"></i><div class="toplist__tit_pop">新歌</div></a></h3>
                        <ul class="toplist__songlist">
    
                            <li class="toplist__song"
                                v-for="(item,index) in newlist">
                                <div class="toplist__number">{{index+1}}</div>
                                <div class="toplist__songname">
                                    {{item.songname}}
                                </div>
                                <div class="toplist__artist">
                                    <a href="javascript:;"
                                       class="js_singer">{{item.author}}</a>
                                </div>
                            </li>
                        </ul>
                    </li>
    
                    <li class="toplist__item toplist__item--high mod_cover">
                        <div class="toplist__bg"></div>
                        <i class="mod_cover__mask"></i>
                        <!--绑定点击事件，添加到播放列表-->
                        <i class="mod_cover__icon_play js_play_toplist"
                           v-on:click="addtolist(3)"></i>
                        <i class="toplist__line"></i>
                        <h3 class="toplist__hd">
                            <a @click="goToSongmenu(1)" href="javascript:scroll(0,0)"
                            class="toplist__tit js_toplist" >
                                <i class="toplist__tit_top"></i><div class="toplist__tit_pop">原创</div></a></h3>
                        <ul class="toplist__songlist">
    
                            <li class="toplist__song"
                                v-for="(item,index) in originallist">
                                <div class="toplist__number">{{index+1}}</div>
                                <div class="toplist__songname">
                                    {{item.songname}}
                                </div>
                                <div class="toplist__artist">
                                    <a href="javascript:;"
                                       class="js_singer">{{item.author}}</a>
                                </div>
                            </li>
                        </ul>
                    </li>
    
                </ul>
            </div>
        </div>
    </div>
</template>    
<script>
export default {

    name: 'toplist',

    props: {},
    //初始化实例后执行ajax请求
    created() {
        this.$http.get('http://localhost:3000/toplist')
            .then(res => {
                this.poplist = res.data.poplist.slice(0, 4);
                this.hotlist = res.data.hotlist.slice(0, 4);
                this.newlist = res.data.newlist.slice(0, 4);
                this.originallist = res.data.originallist.slice(0, 4);

            }).catch(err => {
                console.log(err)
            })
    },
    data() {
        return {
            poplist: [],
            hotlist: [],
            newlist: [],
            originallist: []
        }
    },
    methods: {
        // 点击跳转至歌单页面
        goToSongmenu(id){
            this.$router.push("/songmenu");
            localStorage.setItem('currlistid',id);
            localStorage.setItem('currlistapi',"/newsonglist");
        },
        // 绑定点击事件，添加到播放列表
        addtolist(id) {
            this.$http.post('http://localhost:3000/newsonglist', { 'id': id })
                .then(res => {
                    var data = res.data;//获取的歌曲列表集合
                    this.$store.commit('addToplaylist', data);  //vuex控制全局的playlist
                }).catch(err => {
                    console.log(err)
                })
        }
    }

}
</script>
<style scoped>
.toplist_box {
    position: relative;
    background: #121212 url(../../image/indexImg/bg_index_top2.jpg) 50% 0 no-repeat;
}

.section_inner {
    height: 830px;
    z-index: 2;
    overflow: hidden;
    max-width: 1200px;
    margin: 0 auto;
    position: relative;
}

.index__hd {
    position: relative;
    width: 490px;
    height: 48px;
    padding-top: 80px;
    margin: 0 auto 50px;
}

.index__tit {
    font-weight: 400;
    text-align: center;
}

.index__tit_sprite {
    width: 144px;
    display: block;
    margin: 0 auto;
    height: 48px;
    background-image: url(../../image/indexImg/index_tit.png);
    background-position: 0 -120px;
}

.index__more {
    top: 128px;
    position: absolute;
    right: 0;
}

.index__more--white {
    font-size: 15px;
    color: #fff;
}

.icon_index_arrow {
    display: inline-block;
    width: 7px;
    height: 12px;
    background-image: url(../../image/indexImg/icon_sprite.png);
    background-position: -40px -260px;
    margin-left: 6px;
}

.toplist__item {
    position: relative;
    float: left;
    z-index: 2;
    width: 25%;
    height: 567px;
    overflow: hidden;
}

.mod_cover {
    zoom: 1;
}

.toplist__item .toplist__bg {
    -webkit-transform: scale(1);
    -webkit-transition: -webkit-transform .75s;
    transform: scale(1);
    transition: transform .75s;
}

.toplist__item--pop .toplist__bg {
    background-position: 0 0;
}

.toplist__bg {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 567px;
    background-image: url(../../image/indexImg/bg_index_top.jpg);
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

.toplist__item .mod_cover__icon_play {
    top: 184px;
    margin-top: 0;
    margin-bottom: 0;
}

.mod_cover .mod_cover__icon_play:hover,
.mod_cover__icon_play {
    background-image: url(../../image/indexImg/cover_play.png);
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

.toplist__line {
    position: absolute;
    left: 50%;
    top: 215px;
    margin-left: -31px;
    width: 62px;
    height: 2px;
    background: rgba(255, 255, 255, .3);
}

.toplist__hd {
    position: absolute;
    top: 80px;
    left: 50%;
    margin-left: -100px;
    width: 200px;
    height: 110px;
    text-align: center;
}

.toplist__tit_top {
    display: block;
    background-image: url(../../image/indexImg/index_tit.png);
    margin-left: auto;
    margin-right: auto;
    width: 66px;
    height: 24px;
    background-position: 0 -300px;
    margin-bottom: 8px;
}

.toplist__tit_high,
.toplist__tit_hot,
.toplist__tit_new,
.toplist__tit_pop {
    height: 36px;
    line-height: 1;
    font-size: 36px;
    color: #fff;
    font-weight: 400;
}

.toplist__songlist,
.toplist__songlist a {
    color: #fff;
    font-size: 16px;
}

.toplist__songlist {
    position: absolute;
    top: 282px;
    left: 50%;
    margin-left: -90px;
    width: 180px;
    white-space: nowrap;
}

.toplist__song {
    position: relative;
    padding-left: 15px;
    margin-bottom: 10px;
}

.toplist__number {
    position: absolute;
    top: 0;
    left: 0;
}

.toplist__songname {
    overflow: hidden;
    text-overflow: ellipsis;
    margin-bottom: 2px;
}

.toplist__songlist,
.toplist__songlist a {
    color: #fff;
    font-size: 16px;
}

.toplist__artist {
    font-size: 13px;
    opacity: .5;
    filter: alpha(opacity=50);
    overflow: hidden;
    text-overflow: ellipsis;
}

.toplist__artist a {
    font-size: 13px;
}

.toplist__item--new .toplist__bg {
    background-position: -300px 0;
}

.toplist__item--hot .toplist__bg {
    background-position: -600px 0;
}

.toplist__item--high .toplist__bg {
    background-position: -900px 0;
}

.toplist__item:hover .toplist__bg {
    -webkit-transform: scale(1.06);
    -webkit-transition: -webkit-transform .75s cubic-bezier(0, 1, .75, 1);
    transform: scale(1.06);
    transition: transform .75s cubic-bezier(0, 1, .75, 1);
}

.mod_cover:hover .mod_cover__mask {
    opacity: .2;
    filter: alpha(opacity=20);
    -webkit-transition: opacity .5s;
    transition: opacity .5s;
}

.mod_cover .mod_cover__icon_play:hover {
    opacity: 1;
    filter: none;
}

.mod_cover:hover .mod_cover__icon_play {
    background: 0 0\9;
    opacity: .9;
    -webkit-transform: scale(1);
    -webkit-transition-property: opacity, -webkit-transform;
    -webkit-transition-duration: .5s;
    transform: scale(1);
    transition-property: opacity, transform;
    transition-duration: .5s;
    cursor: pointer;
}
</style>
