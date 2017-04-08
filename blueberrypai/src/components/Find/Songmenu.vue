<template>
	<div class="songmenu">
		<div class="main">
			<div class="mod_data">
				<span class="data__cover">
			                <img id="albumImg" :src="songmenu[0].albumcover" class="data__photo">
			                <i class="data__cover_mask"></i>
			            </span>
				<div class="data__cont">
					<div class="data__name">
						<h1 class="data__name_txt">{{songmenu[0].songname}}</h1>
					</div>
	
					<div class="data__singer">
						<i class="icon_singer"></i>
						<a href="javascript:;"
						   class="data__singer_txt">{{songmenu[0].author}}</a>
					</div>
	
					<ul class="data__info">
	
						<li>标签：pop</li>
	
						<li>播放量：29.5万</li>
					</ul>
	
					<div class="data__actions">
						<a href="javascript:;"
							@click="playlist"
						   class="mod_btn_green js_all_play"><i class="mod_btn_green__icon_play"></i>播放全部</a>
	
						<a href="javascript:;"
						   class="mod_btn js_fav_album"><i class="mod_btn__icon_like"></i>收藏</a>
					</div>
				</div>
			</div>
			<div class="detail_layout">
				<div class="detail_layout__main">
					<div class="mod_songlist">
						<ul class="songlist__header">
							<li class="songlist__header_name">歌曲</li>
							<li class="songlist__header_author">歌手</li>
							<li class="songlist__header_opt">专辑</li>
						</ul>	
						<ul class="songlist__list" v-for="(list,index) in songmenu">	
							<li>
								<div class="songlist__item">
									<div class="songlist__number">{{index+1}}</div>
									<div class="songlist__songname" v-bind:id="list.songid"
									 @click="goToSongDetail(list.songid)">
										<span class="songlist__songname_txt">{{list.songname}}</span>
										<i class="songlist__icon songlist__icon_exclusive"></i>
									</div>
									<div class="songlist__artist">
										{{list.author}}
									</div>
									<div class="songlist__opt">{{list.album}}</div>
									<div class="songlist__other">
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="detail_layout__other">
					<div class="mod_about"
					     id="album_desc">
						<h3 class="about__tit">简介</h3>
						<div class="about__cont">
							<p>这个歌单创建于去年，与其说是歌单，不如说是我个人的一个小音乐库，里边全是我自己喜欢的英文歌曲，虽然有些歌我连演唱者都不熟悉，但是就是那一瞬的旋律，深深打动我的心！
								不知道这些歌当中是否有歌曲带给你们灵魂震撼的声音，只希望听到的人，不用去在乎歌词所表达的意思，全身心的用耳朵体会这些优美的旋律！但愿你们的眼睛，只看得到笑容！但愿这些歌曲，带给你们幸福的感觉！</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
	export default{
		name:'songmenu',
		data(){
			return{
				songmenu:[{}]
			}
		},
		methods:{
			goToSongDetail(id){
				window.scrollTo(0,0);
	            this.$router.push("/singlesong");
	            localStorage.setItem('currsongid',id);
	            localStorage.setItem('currsongapi',"/playOneSong");
			},
			playlist(){
				var id=localStorage.getItem('currlistid');
				var api=localStorage.getItem('currlistapi');
				this.$http.post('http://localhost:3000'+api, { "id":id})
                .then(res => {
                    this.$store.commit('addToplaylist', res.data);  
                }).catch(err => {
                    console.log(err)
                })
			}
		},
		mounted(){
			var id=localStorage.getItem('currlistid');
			var api=localStorage.getItem('currlistapi');
			this.$http.post('http://localhost:3000'+api, { "id":id})
                .then(res => {
                    this.songmenu=res.data;
                }).catch(err => {
                    console.log(err)
                })
		}
	}

</script>
<style scoped>
.main {
	z-index: 2;
	min-height: 600px;
}

.main,
.section_inner {
	max-width: 1200px;
	margin: 0 auto;
	position: relative;
}

.mod_data {
	padding-left: 340px;
}

.data__cover {
	position: absolute;
	left: 0;
	top: 0;
	width: 250px;
	height: 250px;
}

.data__photo {
	width: 100%;
	height: 100%;
}

.data__cover_mask {
	position: absolute;
	left: 0;
	top: 0;
	width: 300px;
	height: 266px;
	background: url(../../image/album_cover.png) 0 0 no-repeat;
}

.mod_data {
	position: relative;
	height: 250px;
	padding-left: 305px;
	margin-bottom: 35px;
}

.data__cont {
	padding-top: 13px;
}

.data__name {
	overflow: hidden;
	height: 50px;
	line-height: 50px;
}

.data__name_txt {
	float: left;
	font-size: 31px;
	line-height: 50px;
	font-weight: 400;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 70%;
	margin-right: 10px;
}

.data__singer {
	height: 24px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 90%;
}

.icon_singer {
	float: left;
	width: 16px;
	height: 16px;
	background: url(../../image/icon_sprite.png) -20px -240px;
	margin: 5px 7px 0 0;
}

.data__singer_txt {
	font-size: 16px;
	color: #333;
}

.data__info {
	width: 550px;
	overflow: hidden;
	padding-top: 8px;
}

.data__info>li {
	line-height: 27px;
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 14px;
}

.data__actions {
	position: absolute;
	bottom: 23px;
	font-size: 0;
}

.data__actions .mod_btn,
.data__actions .mod_btn_green {
	min-width: 74px;
	text-align: center;
}

.mod_btn.js_fav_album {
	border: 1px solid #c9c9c9;
	color: #333;
}

.mod_btn.js_fav_album:hover {
	background-color: #ededed;
}

.mod_btn_green {
	border: 1px solid #31c27c;
	background-color: #31c27c;
	color: #fff;
}

.mod_btn_green:hover {
	background-color: #2caf6f;
	border-color: #2caf6f;
	color: #fff;
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

.mod_btn_green__icon_play {
	width: 13px;
	height: 16px;
	display: inline-block;
	margin-right: 6px;
	background-image: url(../../image/icon_sprite.png);
	background-repeat: no-repeat;
	background-position: -80px -220px;
	vertical-align: -3px;
}

.mod_btn__icon_like {
	width: 16px;
	height: 16px;
	display: inline-block;
	margin-right: 6px;
	background-image: url(../../image/icon_sprite.png);
	background-repeat: no-repeat;
	background-position: -60px 0;
	vertical-align: -4px;
}

.detail_layout {
	padding-right: 343px;
}

.detail_layout::after {
	content: '';
	display: block;
	height: 0;
	width: 100%;
	visibility: none;
	overflow: hidden;
	zoom: 1;
}

.detail_layout__main {
	float: left;
	width: 100%;
	padding-bottom: 20px;
}

.mod_songlist {
	padding-bottom: 60px;
}

.mod_songlist {
	font-size: 14px;
}

.songlist__header {
	height: 50px;
	line-height: 50px;
	background-color: #fbfbfd;
	color: #999;
}

.songlist__header,
.songlist__item {
	position: relative;
	padding-left: 46px;
	padding-right: 100px;
}

.songlist__header_name,
.songlist__songname {
	float: left;
	width: 40%;
	position: relative;

}

.songlist__album,
.songlist__artist,
.songlist__header_album,
.songlist__header_author {
	float: left;
	padding-left: 20px;
	width: 20%;
}

.songlist__header_opt,
.songlist__opt {
	position: absolute;
	top: 0;
	right: 38px;
	width: 100px;
}

.songlist__list {
	overflow: hidden;
	clear: both;
}

.songlist__item {
	clear: both;
	font-size: 0;
	overflow: hidden;
}

.songlist__header,
.songlist__item {
	position: relative;
	padding-left: 46px;
	padding-right: 100px;
}

.songlist__number {
	position: absolute;
	top: 0;
	left: 10px;
	color: #999;
	width: 36px;
}

.songlist__album,
.songlist__artist,
.songlist__number,
.songlist__other,
.songlist__songname,
.songlist__opt {
	line-height: 50px;
	height: 50px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-size: 14px;
}

.songlist__header_name,
.songlist__songname {
	float: left;
	width: 54%;
	position: relative;
	cursor: pointer;
}

.songlist__songname_txt {
	float: left;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 70%;
	margin-right: 8px;
}

.songlist__album,
.songlist__artist,
.songlist__header_album,
.songlist__header_author {
	width: 20%;
	float: left;
	padding-left: 20px;
}

.songlist__opt {
	color: #999;
}


.songlist__header_other,
.songlist__other {
	position: absolute;
	top: 0;
	right: 0;
	width: 38px;
	overflow: inherit;
}

.songmenu {
	padding: 40px 0;
	background: url(../../image/bg_detail.jpg) 50% -30px repeat-x;
}

.detail_layout__other {
	float: right;
	position: relative;
	width: 290px;
	margin-right: -343px;
	padding-bottom: 20px;
}

.mod_about {
	line-height: 22px;
	margin-bottom: 25px;
	margin-top: -8px;
}

.about__tit {
	font-size: 20px;
	font-weight: 400;
	line-height: 46px;
}

.about__cont {
	min-height: 200px;
	max-height: 400px;
	overflow: hidden;
}

.other_part {
	overflow: hidden;
	margin-bottom: 10px;
}

.other_part__tit {
	font-size: 20px;
	font-weight: 400;
	line-height: 46px;
}

.mod_playlist {
	overflow: hidden;
}

.mod_playlist .playlist__list {
	margin-right: -20px;
}

.detail_layout__other .playlist__item {
	width: 33.333333%;
	padding-bottom: 14px;
}

.mod_playlist .playlist__item {
	float: left;
	width: 20%;
	padding-bottom: 44px;
	overflow: hidden;
}

.mod_playlist .playlist__item_box {
	position: relative;
	margin-right: 20px;
}
</style>