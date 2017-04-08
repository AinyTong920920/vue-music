<template>
    <div class="findpage">        
        <Newsonglist v-bind:newsonglist="newsonglist"></Newsonglist>
        <div>
            <Recommend></Recommend>
            <Toplist></Toplist>
            <Hotlist v-bind:hostlist="hostlist"></Hotlist>
        </div>
        <!-- <div class="songlistDetail">
            <router-view></router-view>
        </div> -->        
    </div>
</template>
<script>
import Newsonglist from "./Swiper";
import Hotlist from "./Hotlist";
import Toplist from "./Toplist";
import Recommend from "./Recommend";

export default {

    name: 'FindPage',

    props: {},
    components: {
        Toplist,
        Hotlist,
        Recommend,
        Newsonglist,
    },
    //初始化实例后执行ajax请求
    created() {
        this.$http.get('http://localhost:3000/')
            .then(res => {

                this.newsonglist = res.data.newsonglist;
                this.hostlist = res.data.hostlist;

            }).catch(err => {
                console.log(err)
            })
    },
    data() {
        return {
            hostlist: [],
            newsonglist: []
        }
    },
    methods: {
       
    }

}
</script>
<style scoped>
.main {
    width: 1200px;
    margin: 0 auto;
}
</style>