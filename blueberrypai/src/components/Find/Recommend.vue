<template>
    <div class="recommend">
        <div class="section-inner">
            <div class="index__hd">
                <h2 class="index__tit"><i class="index__tit_sprite"></i></h2>
                <i class="index__line index__line--left"></i>
                <i class="index__line index__line--right"></i>
            </div>
            <!--轮播图 开始 -->
            <div class="main_banner">
                <div class="main_banner_wrap">
                    <div class="main_banner_box"
                         id="m_box">
                        <a href="javascript:void(0)"
                           class="banner_btn js_pre">
                            <!--<span class="banner_btn_arrow"><i></i></span>-->
                        </a>
                        <a href="javascript:void(0)"
                           class="banner_btn btn_next js_next">
                            <!--<span class="banner_btn_arrow"><i></i></span>-->
                        </a>
                        <ul>
                            <li v-bind:id="'imgCard'+index"
                            @click="goToSongmenu(index)"
                                v-for="(simg,index) in slideImgs">
                                <a href="javascript:void(0)"><span></span></a>
                                <img v-bind:src="simg">
                            </li>
                        </ul>
                        <a href="javascript:void(0)"
                           class="banner_btn1 js_pre">
                            <span class="banner_btn_arrow"><i></i></span>
                        </a>
                        <a href="javascript:void(0)"
                           class="banner_btn1 btn_next js_next">
                            <span class="banner_btn_arrow"><i></i></span>
                        </a>
                    </div>
                    <!--序列号按钮-->
                    <div class="btn_list">
                        <span v-for="index in slideImgs"
                              v-bind:class="{'curr':!index}"></span>
                    </div>
                </div>
    
            </div>
        </div>
    </div>
</template>
<script>
import jquery from "../../js/jquery.js";
import swiper3d from "../../plugin/swiper3d/script.js";
export default {
    name: 'recommend',
    data() {
        return {
            slideImgs: [
                "http://on4akwtwp.bkt.clouddn.com/slide1.jpg",
                "http://on4akwtwp.bkt.clouddn.com/slide2.jpg",
                "http://on4akwtwp.bkt.clouddn.com/slide4.jpg",
                "http://on4akwtwp.bkt.clouddn.com/slide6.jpg",
                "http://on4akwtwp.bkt.clouddn.com/slide3.jpg",
                "http://on4akwtwp.bkt.clouddn.com/slide5.jpg",
            ],

        }
    },
    methods: {
          // 点击跳转至歌单页面
        goToSongmenu(id){
             window.scrollTo(0,0);
            this.$router.push("/songmenu");
            localStorage.setItem('currlistid',id);
            localStorage.setItem('currlistapi',"/recommend");
        }
    }
}
</script>
<style scoped>
@import url("../../plugin/swiper3d/style.css");
.recommend {
    position: relative;
}

.section-inner {
    height: 610px;
    z-index: 2;
    /*overflow: hidden;*/
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
    width: 193px;
    background-position: 0 -240px;
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
    background-color: #000;
}

.index__line--right {
    right: 0;
}

.index__line--left {
    left: 0;
}
</style>