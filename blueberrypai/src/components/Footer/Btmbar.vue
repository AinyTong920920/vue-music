<template>
    <div class="btmbar">
    
        <div class="m-playbar" id="playbar"
             v-bind:class="{'m-playbar-lock':lockbtnStus,'m-playbar-unlock':!lockbtnStus}">
    
            <div class="updn">
    
                <div class="left f-fl lockbtn"
                     @click="changeLockStus">
    
                    <a href="javascript:;"
                       class="btn"></a>
                </div>
    
                <div class="right f-fl"></div>
    
            </div>
    
            <div class="bg"></div>
    
            <div class="wrap"
                 id="g_player">
    
                <div class="btns">
    
                    <a href="javascript:;"
                       class="prv"
                       @click="playpre"
                       id="prv">上一首</a>
    
                    <a href="javascript:;"
                       class="ply"
                       @click="ply_pas"
                       id="ply">播放/暂停</a>
    
                    <a href="javascript:;"
                       class="nxt"
                       @click="playnext"
                       id="nxt">下一首</a>
    
                </div>
    
                <div class="head "><img :src="cursonginfo.albumcover">
    
                    <a href="javascript:;"
                       class="mask"></a>
    
                </div>
    
                <!--播放条-->
    
                <div class="play"
                     id="play">
                    <div class=" words">
                        <a href="javascript:;"
                           class="f-thide name fc1 f-fl">{{cursonginfo.author}}</a>
                        <span class="by f-thide f-fl">
                                        <span >
                                         <a class="" href="javascript:;">{{cursonginfo.songname}}</a>
                                       </span>
                        </span>
                        <!--音频播放器-->
                        <audio v-bind:src="cursonginfo.src"
                               @ended="playnext"
                               @play="playStus"
                               @pause="pauseStus"
                               @timeupdate="timeUpdate"
                               id="audio"
                               autoplay></audio>
                    </div>
    
                    <div class="m-pbar"
                         id="m-pbar">
    
                        <div class="barbg"
                             @click="clickplay">
                            <!--当前播放位置标识-->
                            <div class="cur"
                                 id="cur"><span class="btn f-tdn"></span></div>
                        </div>
                        <span class=" time"><em>{{curtime}}</em> / {{duratime}}</span>
    
                    </div>
    
                </div>
    
                <div class="oper f-fl">
                    <a href="javascript:;"
                       class="icn icn-add "
                       title="收藏">收藏</a>
    
                </div>
    
                <div class="ctrl f-fl f-pr" id="ctrl">
                    <!--音量控制-->
                    <div class="m-vol"
                         id="m-vol"
                         v-show="volShow">
    
                        <div class="barbg"></div>
    
                        <div class="vbg"
                             @click="clickVol">
    
                            <div class="curr"
                                 id="curVol"></div>
    
                            <span class="btn"
                                  id="curVol_ico"></span></div>
    
                    </div>
    
                    <a href="javascript:;"
                       @click="volhandler"
                       class="icn icn-vol"></a>
    
                    <a href="javascript:;"
                       class="icn icn-loop"
                       title="循环"></a>
                    <!--列表歌曲数量-->
                    <span class="add f-pr"
                          @click="playMenuShow">               
                                <a href="javascript:;"  class="icn icn-list s-fc3">
                                {{playlist.length}}</a>               
                        </span>
                </div>
    
            </div>
    
            <!--播放列表展示框-->
    
            <div class="list"
                 v-show="listShowHide"
                 id="g_playlist">
    
                <div class="listhd">
                    <!--列表歌曲数量-->
                    <h4>播放列表(<span class="listnum">{{playlist.length}}</span>)</h4>
                    <!--点击清空歌曲列表-->
                    <a href="javascript:;"
                       class="clear"
                       @click="clearlisthandel"><span class="ico icn-del"></span></a>
    
                </div>
    
                <div class="listbd">
    
                    <ul>
                        <!--playlist是vuex里定义的state属性-->
                        <!-- 遍历给ul添加列表歌曲 -->
                        <li v-for="(item,index) in playlist"
                            v-bind:class="{'cur':item.songid==cursonginfo.songid}"
                            @click="playthis(index)"
                            v-bind:id="item.songid">
    
                            <div class="col-left">
    
                                <i class="playicn"></i><span class="songname">{{item.songname}}</span>
    
                            </div>
    
                            <div class="col-right">
    
                                <span class="singer">{{item.author}}</span><span class="songlength"></span>
    
                            </div>
    
                        </li>
    
                    </ul>
    
                </div>
    
            </div>
    
        </div>
    
    </div>
</template>
<script>

export default {

    name: 'Btmplaybar',
    data() {
        return {
            index: 0,
            volShow: false,
            listShowHide: false,
            curtime: '00:00',
            duratime:"00:00"
        }
    },
    methods: {
        clickplay(e) {
            if (this.$store.state.playlist.length) {
                var targLength = e.clientX - play.offsetLeft - g_player.offsetLeft;
                cur.style.width = (targLength / 490).toFixed(2) * 100 + '%';
                audio.currentTime = (targLength / 490) * audio.duration;
            }
        },
        clickVol(e) {
            var btm=document.getElementsByClassName("btmbar")[0];
            var targHeight=btm.offsetTop-50-e.clientY;
            
            if(targHeight>90){
                curVol.style.height="90px";
                curVol_ico.style.bottom="80px";
            }else{
                curVol.style.height=targHeight+"px";
                curVol_ico.style.bottom=targHeight-10+"px";
            }
            
            audio.volume = targHeight/105;
        },
        timeUpdate() {
            cur.style.width = (audio.currentTime / audio.duration).toFixed(2) * 100 + '%';
            if (this.$store.state.playlist.length) {
                this.duratime=this.timeFormat((audio.duration / 60).toFixed(2))
                this.curtime = this.timeFormat((audio.currentTime / 60).toFixed(2));
            }
        },
        volhandler() {
            this.volShow = !this.volShow;
        },
        playStus() {
            ply.className = "pas";
        },
        pauseStus() {
            ply.className = "ply";
        },
        playthis: function (index) {
            this.index = index;
            this.$store.commit('setCursonginfo', index);
        },
        playnext: function () {
            if (this.$store.state.playlist.length > 0) {
                if (this.index < this.$store.state.playlist.length - 1) {
                    this.index += 1;
                } else {
                    this.index = 0;
                }
                this.$store.commit('setCursonginfo', this.index);
            }

        },
        ply_pas() {
            if (this.$store.state.playlist.length > 0) {
                if (ply.className == "pas") {
                    audio.pause();
                } else {
                    audio.play();
                }
            }
        },
        playpre() {
            if (this.$store.state.playlist.length > 0) {
                if (this.index > 0) {
                    this.index -= 1;
                } else {
                    this.index = this.$store.state.playlist.length - 1;
                }
                this.$store.commit('setCursonginfo', this.index);
            }
        },
        clearlisthandel() {
            this.$store.commit('clearPlaylist');
            audio.pause();
        },
        changeLockStus() {// 播放条是否固定
            if (this.lockbtnStus) {
                this.volShow = false;
                this.listShowHide = false;
            }
            localStorage.setItem('lockbtnStus', !this.lockbtnStus);
            this.$store.commit('setlockbtnStus', !this.lockbtnStus);
        },
        playMenuShow() {//歌曲列表框的隐藏
            this.listShowHide = !this.listShowHide;
        },
        timeFormat(time) {//时间格式化函数
            var result = '';
            if (time > 0) {
                var minScd = time.split('.');
                var min = minScd[0], scd = minScd[1];
                //分钟的判断
                if (scd > 59) {
                    min = parseInt(min) + 1;
                }
                if (min < 10) {
                    min = '0' + min;
                }
                //秒的判断
                scd = scd % 60;
                if (scd < 10) {
                    scd = '0' + scd;
                }
                result = min + ':' + scd;
            } else {
                result = '00:00';
            }
            return result;
        }

    },
    computed: {
        playlist() {
            return this.$store.state.playlist
        },
        cursonginfo() {
            if (this.$store.state.playlist.length > 0) {
                this.$store.commit('setCursonginfo', this.index);
            }
            return this.$store.state.cursonginfo;
        },
        lockbtnStus() {
            return this.$store.state.lockbtnStus
        }

    },
    mounted() {
        var audio = document.getElementById("audio");
        var ply = document.getElementById('ply');
        var cur = document.getElementById('cur');
        var play = document.getElementById('play');
        var g_player = document.getElementById('g_player');
        var curVol = document.getElementById('curVol');
        
        //音量调节
        // 初始化
        audio.volume = .7;
        curVol.style.height = audio.volume * 100 - 10 + "px";
    }

}
</script>
<style scoped>
.btmbar {

    position: fixed;

    _position: absolute;

    zoom: 1;

    bottom: 0;

    left: 0;

    right: 0;

    height: 0;

    width: 100%;

    z-index: 999;

    font-size: 12px;
}
.m-playbar {

    position: absolute;

    zoom: 1;

    top: -53px;

    left: 0;

    width: 100%;

    height: 53px;

    margin: 0 auto;
}



.m-playbar .updn {

    position: relative;

    z-index: 11;
}



.m-playbar-unlock {

    top: -12px;

    transition: top .4s;

    visibility: visible;
}



.m-playbar-lock {

    top: -53px;

    visibility: visible;
}



.m-playbar .updn .left,

.m-playbar .updn .right,

.m-playbar .updn .btn,

.m-playbar .btns a,

.m-playbar .head .mask,

.m-playbar .icn,

.m-playbar .ctrl,

.m-playbar .tip,

.m-playbar .words .mv,

.m-vol .barbg,

.m-playbar .words .src {

    background: url(../../image/indexImg/playbar.png) no-repeat 0 9999px;

    _background-image: url(../../image/indexImg/playbar.png);
}



.m-playbar .bg {

    height: 53px;

    zoom: 1;

    margin-right: 67px;

    background: url(../../image/indexImg/playbar.png) no-repeat 0 9999px;

    background-position: 0 0;

    background-repeat: repeat-x;
}



.m-playbar-lock .updn .btn {

    background-position: -100px -380px;
}



.m-playbar-lock .updn .btn:hover {

    background-position: -100px -380px;
}

.m-playbar .updn .left {

    position: absolute;

    top: -14px;

    right: 15px;

    width: 52px;

    height: 67px;

    background-position: 0 -380px;
}



.m-playbar .updn .right {

    position: absolute;

    top: -1px;

    right: 0;

    width: 15px;

    height: 54px;

    background-position: -52px -393px;

    pointer-events: none;
}



.m-playbar .icn-loop {

    background-position: -3px -344px;
}



.m-playbar .wrap {

    position: absolute;

    left: 50%;

    top: 6px;

    z-index: 15;

    width: 980px;

    height: 47px;

    margin: 0 auto;

    margin-left: -490px;
}



.m-playbar .btns {

    width: 137px;

    padding: 6px 0 0 0;
}



.m-playbar .updn .btn {

    display: block;

    width: 18px;

    height: 18px;

    margin: 6px 0 0 17px;
}



.m-playbar-unlock .updn .btn:hover {

    background-position: -80px -400px;
}



.m-playbar-unlock .updn .btn {

    background-position: -80px -380px;
}



.m-playbar-lock .updn .btn {

    background-position: -100px -380px;
}



.m-playbar .btns,

.m-playbar .head,

.m-playbar .play,

.m-playbar .volum,

.m-playbar .oper {

    float: left;
}



.m-playbar .btns a {

    display: block;

    float: left;

    width: 28px;

    height: 28px;

    margin-right: 8px;

    margin-top: 5px;

    text-indent: -9999px;
}



.m-playbar .btns .ply {

    width: 36px;

    height: 36px;

    margin-top: 0;

    background-position: 0 -204px;
}

.m-playbar .btns .pas {
    width: 36px;

    height: 36px;

    margin-top: 0;
    background-position: -40px -165px;
}

.m-playbar .btns .nxt {

    background-position: -80px -130px;
}



.m-playbar .btns .prv {

    background-position: 0 -130px;
}



.m-playbar .head {

    position: relative;

    margin: 6px 15px 0 0;
}



.m-playbar .head,

.m-playbar .head img {

    width: 34px;

    height: 34px;
}



.m-playbar .head,

.m-playbar .head img {

    width: 34px;

    height: 34px;
}



img,

.txt {

    border: 0;
}



.m-playbar .head .mask {

    position: absolute;

    top: 0px;

    left: 0px;

    display: block;

    width: 34px;

    height: 35px;

    background-position: 0 -80px;
}



.m-playbar .play {

    position: relative;

    width: 608px;
}



.m-playbar .words {

    height: 28px;

    overflow: hidden;

    color: #e8e8e8;

    text-shadow: 0 1px 0 #171717;

    line-height: 28px;
}



.m-playbar .words .name {

    max-width: 300px;
}

.m-playbar .words .fc1 {

    color: #e8e8e8;
}

.f-thide {

    overflow: hidden;

    text-overflow: ellipsis;

    white-space: nowrap;

    word-wrap: normal;
}



.f-fl {

    float: left;
}

.m-playbar .words .by {

    max-width: 220px;

    margin-left: 15px;

    color: #9b9b9b;
}

.m-playbar .words .by a {

    color: #9b9b9b;
    display: inline-block;
}

.m-playbar .words .src:hover {

    background-position: -130px -103px;
}

.m-playbar .words .src {

    float: left;

    width: 14px;

    height: 15px;

    margin: 7px 0 0 13px;

    background-position: -110px -103px;
}

.m-pbar,

.m-pbar .barbg {

    width: 493px;
}

.m-pbar {

    position: relative;
}

.m-pbar .barbg,

.m-pbar .cur {

    height: 9px;

    background-position: right -30px;
}

.m-pbar .barbg,

.m-pbar .cur,

.m-pbar .left {

    background: url(../../image/indexImg/statbar.png) no-repeat;

    _background-image: url(../../image/indexImg/statbar.png);
}

.m-pbar .barbg,

.m-pbar .cur {

    height: 9px;
    cursor: pointer;
    background-position: right -30px;
}

.m-pbar .cur {

    position: absolute;

    top: 0;

    left: 0;



    background-position: left -66px;
}

#cur {
    width: 1%;
}

.m-pbar .btn,

.m-vol .btn {

    background: url(../../image/indexImg/iconall.png) no-repeat;

    _background: url(../../image/indexImg/iconall.png);
}

.m-pbar .btn {

    position: absolute;

    top: -7px;

    right: -13px;

    width: 22px;

    height: 24px;

    margin-left: -11px;

    background-position: 0 -250px;

    _background-position: 0 0;

    cursor: pointer;
}

.m-pbar .time {
    position: absolute;
    top: -3px;
    right: -84px;
    color: #797979;
    text-shadow: 0 1px 0 #121212;
}

.m-pbar .time em {

    color: #a1a1a1;
}

.m-playbar .oper {

    width: 40px;
}

.m-playbar .icn-add {

    background-position: -88px -163px;
}

.m-playbar .icn {

    float: left;

    width: 25px;

    height: 25px;

    margin: 11px 2px 0 0;

    text-indent: -9999px;
}

.m-playbar .ctrl {

    position: relative;

    z-index: 10;

    width: 113px;

    padding-left: 13px;

    background-position: -147px -238px;
}

.m-vol {

    position: absolute;

    top: -113px;

    left: 9px;

    clear: both;

    width: 32px;

    height: 113px;
}

.m-vol .barbg {

    position: absolute;

    top: 0;

    left: 0;

    width: 32px;

    height: 113px;
    cursor: pointer;
    background-position: 0 -503px;
}

.m-vol .vbg {
    position: absolute;
    padding: 4px 0;
    top: 7px;
    width: 4px;
    height: 93px;
    left: 14px;
    cursor: pointer;
}

.m-vol .curr {
    position: absolute;
    bottom: 0;
    width: 4px;
    height: 65px;
    background-color: #B8180D;
}

.m-vol .btn {

    position: absolute;

    bottom: 50px;

    left: -7px;

    display: block;

    width: 18px;

    height: 20px;

    background-position: -40px -250px;

    _background-position: 0 0;

    cursor: pointer;
}



.m-vol .btn:hover {

    _background: url(../../image/indexImg/vol_btn_hvr.png) no-repeat;
}



.m-playbar .icn-vol {

    background-position: -2px -248px;
}



.m-playbar .icn-one {

    background-position: -66px -344px;
}



.m-playbar .icn {

    float: left;

    width: 25px;

    height: 25px;

    margin: 11px 2px 0 0;

    text-indent: -9999px;
}



.m-playbar .add {

    float: left;

    width: 59px;

    height: 36px;
}



.f-pr {

    position: relative;

    zoom: 1;
}



.m-playbar .icn-list {

    display: block;

    float: none;

    width: 38px;

    padding-left: 21px;

    background-position: -42px -68px;

    line-height: 27px;

    text-align: center;

    color: #666;

    text-shadow: 0 1px 0 #080707;

    text-indent: 0;

    text-decoration: none;
}



.list {

    position: absolute;

    right: 20%;

    bottom: 47px;

    _bottom: 46px;

    width: 560px;

    _width: 556px;

    height: 301px;
}



.m-playbar .listhd,

.m-playbar .listbd {

    background: url(../../image/indexImg/playlist_bg.png) no-repeat;

    _background-image: url(../../image/indexImg/playlist_bg.png);
}



.m-playbar .list .close,

.m-playbar .playicn,

.m-playbar .ico {

    background: url(../../image/indexImg/playlist.png) no-repeat 0 9999px;

    _background-image: url(../../image/indexImg/playlist.png);

    display: inline-block;
}



.m-playbar .listhd {

    background-position: 0 0;

    height: 41px;
}



.m-playbar .listhd,

.m-playbar .listbd {

    padding: 0 5px;
}



.m-playbar .listhd h4 {

    position: absolute;

    left: 25px;

    top: 0;

    height: 39px;

    line-height: 39px;

    font-size: 14px;

    color: #e2e2e2;
}



.m-playbar .listhd .clear,

.m-playbar .listhd .addall {

    position: absolute;

    left: 520px;

    top: 12px;

    height: 15px;

    line-height: 15px;

    cursor: pointer;
}



.m-playbar .listhd a {

    color: #ccc;
}



.m-playbar .icn-del {

    width: 13px;

    background-position: -51px 0;
}



.m-playbar .ico {

    height: 16px;
}



.m-playbar .listbd {

    position: absolute;

    left: 0;

    top: 41px;

    width: 550px;

    _width: 546px;

    height: 260px;

    overflow-x: hidden;
    overflow-y: auto;

    background-position: -1014px 0;

    _background-position: -1018px 0;

    background-repeat: repeat-y;
}

.m-playbar .listbd::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
    border-radius: 10px;
    background-color: #444;
}

.m-playbar .listbd::-webkit-scrollbar {
    width: 10px;
    background-color: #444;
}

.m-playbar .listbd:-webkit-scrollbar-thumb {
    border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px #ccc;
    background-color: #D62929;
}


.m-playbar .list li:hover {

    background-color: rgba(0, 0, 0, 0.4);

    _background-color: #1a1a1a;
}



.m-playbar .listhd,

.m-playbar .listbd {

    padding: 0 5px;
}



.m-playbar .listbdc {

    position: absolute;

    left: 2px;

    _left: 0;

    top: 0;

    z-index: 4;

    height: 260px;

    width: 553px;

    overflow: hidden;
}



.m-playbar .list ul {

    color: #ccc;
}



.m-playbar .list li.cur {

    background-color: rgba(0, 0, 0, 0.3);

    _background-color: #202020;
}



.m-playbar .list li {

    clear: both;

    padding: 0 15px;

    height: 35px;

    line-height: 35px;
    cursor: pointer;
}



.m-playbar .listbdc ul {

    overflow: hidden;

    clear: both;
}



.m-playbar .playicn {

    display: none;

    margin-top: 8px;

    width: 10px;

    height: 13px;

    background-position: -182px 0;
}



.m-playbar .list li.cur .playicn,

.m-playbar .list li:hover .icns,

.m-playbar .list li.z-hover1 .icns {

    display: inline-block;
}



.listbd li .col-left {

    float: left;
}



.listbd li .col-right {

    float: right;
}



.songname {

    margin-left: 15px;
}
</style>