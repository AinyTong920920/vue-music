<template>
    <div class="myFavoriteList">
        <div class="mod_songlist_toolbar">
            <a class="js_all_img" href="javascript:;">
                <img src="../../image/cover_like.png"/>
            </a>
            <a class="js_all_number" href="javascript:;">
                歌曲{{songlist.length}}
            </a>
            <a class="mod_btn_green js_all_play" href="javascript:;" @click="playAllsong" >
                <i class="mod_btn_green__icon_play"></i>
                播放全部
            </a>
        </div>
        <!--表头-->
        <div class="mod_songlist">
            <ul class="songlist_header">
                <li class="sheader_name">
                    歌曲
                </li>
                <li class="sheader_author">
                    歌手
                </li>
                <li class="sheader_album">
                    专辑
                </li>
                <li class="sheader_optn">
                    操作
                </li>
            </ul>
            <!--body-->
            <ul v-if="islist" class="songlist_list">
                <li v-for="song in songlist">
                    <div class="songname songname_txt" @click="goToSongDetail(song.songid)">
                        {{song.songname}}
                    </div>
                    <div class="artist">
                        {{song.author}}
                    </div>
                    <div class="album">
                        {{song.album}}
                    </div>
                    <div class="optn">
                        <span @click="clickOneSong(song.songid)" class="palyBtn" title="播放">
                        </span>
                        <!-- <span class="delBtn" title="删除"></span> -->
                    </div>
                </li>
            </ul>
            <div v-else
                 style="font-size:20px;line-height:50px;">
                您还未收藏任何歌曲！
            </div>
        </div>
    </div>
</template>
<script>
    export default{
        name:'favoritelist',
        data(){
           return{
                 songlist:[],
                 islist: false
           }
        },
        methods: {
        clickOneSong(id) {
            this.$http.post('http://localhost:3000/playOneSong', { "id": id })
                .then(res => {
                    var data = res.data;//获取的歌曲列表集合
                    this.$store.commit('addToplaylist',data);  //vuex控制全局的playlist
                }).catch(err => {
                    console.log(err)
                })
        },
        playAllsong(){
            this.$store.commit('addToplaylist',this.songlist);
        },
        goToSongDetail(id){
                window.scrollTo(0,0);
                this.$router.push("/singlesong");
                localStorage.setItem('currsongid',id);
                localStorage.setItem('currsongapi',"/playOneSong");
            }
        },
        mounted () {
            if(localStorage.getItem('mylist')){
                this.islist = true;
                this.$http.get('http://localhost:3000/mylovelist')
                .then(res => {
                    this.songlist=res.data;
                }).catch(err => {
                    console.log(err)
                })
            }else{
                this.islist = false;
            }
            
        }
    }
</script>
<style scoped>
    .js_all_img{
    display:inline-block;
    width:40px;
    height:40px;
    border-radius: 5px;
    overflow: hidden;
    margin-right: 5px;
}
.js_all_img>img{
    width:100%;
}
.palyBtn,.delBtn{
display: inline-block;
margin-top: 7px;
    width: 36px;
    height: 36px;
    background: url(../../image/icon_list_menu.png) no-repeat;
    margin-right: 10px;
}
.palyBtn{
    background-position: 0 0;
}
.palyBtn:hover{
    background-position: -40px 0;
}
.delBtn{
    background-position: 0 -160px;
}
.delBtn:hover{
    background-position: -40px -160px;
}
.songlist_header,
.songlist_list {
    overflow: hidden;
    clear: both;
    zoom: 1;
}
.songlist_header {
    color: #999;
    background-color: #fbfbfd;
}
.songlist_list{
     color: #333;
}
.songlist_header>li,
.songlist_list>li>div {
    float: left;
    height: 50px;
    line-height: 50px;
}
.songlist_list>li::after{
    width:100%;
    height:0;
    visibility: hidden;
    content:'';
    clear: both;
    zoom: 1;
}
.songlist_list>li{
     height:50px;
}   
.songlist_list>li:nth-child(even){
    background-color: #fbfbfd;

    
}
.songname_txt {
    max-width: 80%;
}

.sheader_name,
.songname {
    width: 30%;
    padding:0 30px;
    cursor: pointer;
}

.sheader_author,
.sheader_album,
.artist,
.album {
    width: 22%;
    padding-right: 30px;
}

.sheader_optn,
.optn {
    width: 10%;
    padding-left: 30px;
    cursor: pointer;
}

.mod_songlist_toolbar {
    position: relative;
    font-size: 16px;
    padding: 30px 0;
    height: 40px;
    line-height: 40px;
}

.mod_btn_green {
    border: 1px solid #31c27c;
    background-color: #31c27c;
    color: #fff;
}

.mod_playlist_text,
.mod_singer_list,
.mod_songlist {
    padding-bottom: 40px;
}

.mod_songlist {
    font-size: 14px;
}

.mod_btn,
.mod_btn_green {
    line-height: 39px;
    overflow: hidden;
}

.js_all_number {
    font-size: 16px;
    display: inline-block;
    height: 40px;
    line-height: 40px;
    vertical-align: top;
    margin-right: 40px;
    color: #31c27c;
}

.mod_btn_green:hover {
    background-color: #2caf6f;
    border-color: #2caf6f;
    color: #fff;
}

.mod_btn,
.mod_btn_green {
    border-radius: 2px;
    font-size: 14px;
    margin-right: 6px;
    padding: 0 23px;
    height: 38px;
    line-height: 38px;
    display: inline-block;
    white-space: nowrap;
}

.mod_btn_green__icon_play {
    width: 13px;
    height: 16px;
    background-position: -80px -220px;
    vertical-align: -3px;
    display: inline-block;
    margin-right: 6px;
    background-image: url(../../image/icon_sprite.png);
    background-repeat: no-repeat;
}
</style>