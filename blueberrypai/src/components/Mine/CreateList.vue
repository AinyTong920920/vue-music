<template>
    <div class="createlist">
        <div class="playlist_toolbar">
            <button class="mod_btn js_create_new"><i class="mod_btn__icon_new"></i>新建歌单</button>
        </div>
        <!--表头-->
        <div class="mod_songlist">
            <ul class="songlist_header">
                <li class="sheader_name">歌单</li>
                <li class="sheader_Count">曲目数</li>
                <li class="sheader_author">创建人</li>
                <li class="sheader_optn">操作</li>
            </ul>
            <!--body-->
            <ul class="songlist_list"
                v-if="islist">
                <li v-for="(list,index) in mylist">
                    <div class="songname"
                         @click="goToSongmenu(index,list.listSongNum)">
                        <span class="playlist_cover"><img :src="list.listCover"></span>
                        <span class="songname_txt">{{list.listname}}</span>
                    </div>
                    <div class="songCount">{{list.listSongNum}}</div>
                    <div class="author">{{personData.nickname}}</div>
                    <div class="optn">
                        <span class="palyBtn"
                              @click="playlist(list.listSongNum)"
                              title="播放全部"></span>
                        <!--<span class="delBtn"
                                  title="删除"></span>-->
                    </div>
                </li>
            </ul>
            <div v-else
                 style="font-size:20px;line-height:50px;">
                {{mylist}}
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: 'createlist',
    data() {
        return {
            islist: false
        }
    },
    methods: {
        goToSongmenu(index,num) {
            window.scrollTo(0, 0);
            this.$router.push("/mylistDetail");
            
            localStorage.setItem('currlistid',index);
            localStorage.setItem('currlistNum',num);
        },
        playlist(num) {
            this.$http.post('http://localhost:3000/crtlist', { "num": num })
                .then(res => {
                    var data = res.data;//获取的歌曲列表集合
                    this.$store.commit('addToplaylist', data);
                }).catch(err => {
                    console.log(err)
                })
        }
    },
    computed: {
        personData() {
            return this.$store.state.personData;
        },
        mylist() {
            if (this.$store.state.personData.mylist) {
                this.islist = true;
                return JSON.parse(this.$store.state.personData.mylist);
            } else {
                this.islist = false;
                return '您还未创建歌单！'
            }

        }
    }
}
</script>
<style scoped>
.createlist {
    font-size: 60px;
}

.playlist_cover {
    display: inline-block;
    width: 50px;
    height: 50px;
    overflow: hidden;
    transform: translateY(-10px);
    margin-right: 15px;
}

.playlist_cover img {
    display: block;
    width: 100%;
    min-height: 50px;
}

.playlist_toolbar {

    margin-bottom: 20px;
}

.mod_btn {
    border: 1px solid #c9c9c9;
    color: #333;
    cursor: pointer;
    background-color: #fff;
}

.mod_btn:hover {
    background-color: #ededed;
}

.mod_btn__icon_new {
    width: 16px;
    height: 16px;
    display: inline-block;
    margin-right: 6px;
    background-image: url(../../image/icon_sprite.png);
    background-repeat: no-repeat;
    vertical-align: -3px;
    background-position: 0 -180px;
}

.mod_btn,
.mod_btn_green {
    line-height: 39px;
    overflow: hidden;
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


.palyBtn,
.delBtn {
    display: inline-block;
    margin-top: 20px;
    width: 36px;
    height: 36px;
    background: url(../../image/icon_list_menu.png) no-repeat;
    margin-right: 10px;
}

.palyBtn {
    background-position: 0 0;
}

.palyBtn:hover {
    background-position: -40px 0;
}

.delBtn {
    background-position: 0 -160px;
}

.delBtn:hover {
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

.songlist_list {
    color: #333;
}

.songlist_header>li {
    float: left;
    height: 50px;
    line-height: 50px;
}

.songlist_list>li>div {
    float: left;
    height: 70px;
    line-height: 70px;
}

.songlist_list>li::after {
    width: 100%;
    height: 0;
    visibility: hidden;
    content: '';
    clear: both;
    zoom: 1;
}

.songlist_list>li {
    height: 70px;
}

.songlist_list>li:nth-child(even) {
    background-color: #fbfbfd;
}

.songname_txt {
    min-width: 30%;
    max-width: 60%;
    display: inline-block;
    overflow: hidden;
}

.sheader_name,
.songname {
    width: 30%;
    padding: 0 20px;
    cursor: pointer;
}

.sheader_Count,
.sheader_author,
.songCount,
.author {
    width: 22%;
    padding-right: 30px;
}

.sheader_optn,
.optn {
    width: 10%;
    padding-left: 30px;
    cursor: pointer;
}

.mod_songlist {
    padding-bottom: 40px;
    font-size: 14px;
}
</style>