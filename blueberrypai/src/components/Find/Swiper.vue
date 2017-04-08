<template>
    <div id="swiper">
        <div class="section_inner">
            <div class="index__hd">
                <h2 class="index__tit">
                                <i class="index__tit_sprite">
                                </i>
                            </h2>
                <i class="index__line index__line--left">
                            </i>
                <i class="index__line index__line--right">
                            </i>
            </div>
            <!-- Swiper -->
            <div class="swiper-container">
                <div class="swiper-wrapper clearFix">
                    <div class="playlist__item swiper-slide"
                         v-bind:id="item.id"
                         v-for="item in newsonglist">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover">
                                <img class="playlist__pic"
                                     v-bind:src="item.AlbumCover" />
                                <i class="mod_cover__mask"></i>
                                <!--点击发送请求，设置全局的playlist，播放歌曲-->
                                <i v-on:click="clickList(item.id)"
                                   class="mod_cover__icon_play js_play">
                                 </i>
                            </div>
                            <!--点击跳转到songmenu页面-->
                            <a @click="goToSongmenu(item.id)" href="javascript:scroll(0,0)" class="playlist_txtbox">
                                <h4 class="playlist__title">
                                            <span class="playlist__title_txt">
                                                {{item.AlbumTitle}}
                                            </span>
                                            <a class="btn_operate_menu" href="javascript:;">
                                            </a>
                                        </h4>
                                <div class="playlist__other">
                                    {{item.author}}
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Add Pagination -->
                <!--<div class="swiper-pagination"></div>-->
                <!--前进后按钮-->
                <!-- <div class="swiper-button-next swiper-button">
                        <span class="btn_arrow">
                                    <i>
                                    </i>
                                </span>
                    </div>
                    <div class="swiper-button-prev swiper-button">
                        <span class="btn_arrow">
                                    <i>
                                    </i>
                                </span>
                    </div> -->
            </div>
        </div>
    </div>
</template>
<script>
import Swiper from './../../../static/swiper/swiper.min.js'
require('./../../../static/swiper/swiper.min.css')

export default {
    name: "newsonglist",
    props: {
        newsonglist: [Array]
    },
    data() {
        return {

        }
    },
    methods: {
        // 点击跳转至歌单页面
        goToSongmenu(id){
            this.$router.push("/songmenu");
            localStorage.setItem('currlistid',id);
            localStorage.setItem('currlistapi',"/newsonglist");
        },
        clickList(id) {
            this.$http.post('http://localhost:3000/newsonglist', { "id": id })
                .then(res => {
                    var data = res.data;//获取的歌曲列表集合
                    this.$store.commit('addToplaylist', data);  //vuex控制全局的playlist
                }).catch(err => {
                    console.log(err)
                })
        }
    },
    mounted() {
        var swiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            slidesPerView: 5,
            slidesPerGroup: 5,
            centeredSlides: true,
            loop: true,
            grabCursor: true,
            speed: 300,
            loopAdditionalSlides: 1,
            prevButton: '.swiper-button-prev',
            nextButton: '.swiper-button-next',

        });
    }
}
</script>
<style scoped="">
.playlist_txtbox{
    cursor: pointer;
}
.swiper-container {
    width: 100%;
    height: 100%;
    padding: 0;
    border: none;
}

.swiper-slide {
    text-align: center;
    font-size: 18px;
    background: #fff;

    /* Center slide text vertically */
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
    margin: 0 !important;
}

#swiper {
    height: 734px;
    background: url(../../image/indexImg/bg_index_new.jpg) 50% 0 repeat-x;
    position: relative;
}

.swiper-button {
    width: 0px;
    height: 120px;
    position: absolute;
    display: block;
    background: #ccc;
    top: 100px;
    line-height: 120px;
    text-align: center;
    color: #fff;
    font-weight: bold;
    font-size: 30px;
    opacity: 0;
    transition: width 1s;
    z-index: 99;
}

.swiper-button:hover {
    background: rgba(16, 157, 89, 0.78);
}

#swiper:hover .swiper-button {
    width: 80px;
    opacity: 1;
}

#swiper:hover span.btn_arrow {
    opacity: 1;
}

.swiper-button-prev {
    left: 0;
}

.swiper-button-next {
    right: 0;
}

span.btn_arrow {
    width: 50px;
    height: 100px;
    display: block;
    position: absolute;
    left: 10px;
    top: 10px;
    opacity: 0;
    transition: 0.5s;
    z-index: 99;
    background: url(../../image/indexImg/bannerBtn.png) no-repeat 0 0;
}

.swiper-button-next span.btn_arrow {
    background-position: -50px 0;
}

.section_inner {
    z-index: 2;
    max-width: 1500px;
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
    width: 193px;
    background-position: 0 0;
    display: block;
    margin: 0 auto;
    height: 48px;
    background-image: url(../../image/indexImg/index_tit.png);
}

.index__line {
    position: absolute;
    top: 104px;
    width: 72px;
    height: 1px;
    opacity: .3;
    filter: alpha(opacity=30);
    background-color: #eee;
}

.index__line--right {
    right: 0;
}

.index__line--left {
    left: 0;
}

.swiper-wrapper .playlist__item:hover {
    background: #31c27c;
}

.swiper-wrapper .playlist__item:hover .playlist__other {
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

.swiper-wrapper div.playlist__item {
    float: left;
    background: rgba(0, 0, 0, .7);
    font-size: 16px;
    padding-bottom: 0;
    width: 300px;
    height: 465px;
    overflow: hidden;
}

div.playlist__item:nth-child(even) {
    background: rgba(0, 0, 0, .8);
}

.playlist__item_box {
    margin-right: 0;
    position: relative;
    height: 465px;
    overflow: hidden;
}

.playlist__cover {
    margin-bottom: 57px;
    position: relative;
    display: block;
    height: 300px;
    width: 300px;
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
    display: inline-block;
    position: relative;
    max-width: 75%;
    padding: 0 26px;
    height: 22px;
    cursor: pointer;
    margin-bottom: 0;
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
    right: -5px;
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