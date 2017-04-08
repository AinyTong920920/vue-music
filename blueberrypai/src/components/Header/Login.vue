<template>
    <div class="login clearFix">
    
        <div class="search">
    
            <form action="">
    
                <input type="search"
                       id="infinitySearch" />
    
                <label for="infinitySearch"
                       id="search-button"></label>
    
            </form>
    
        </div>
    
        <div class="login-register">
    
            <div class="log"
               id="login"
               v-on:click="loginExitHandler">

                <span  v-if="!islogin">登录</span>

                <div  v-else class="userPicBtn">
                   <span class="userPic"><img :src="userImgsrc"></span>
                   <span id="exit"> [退出]</span>
                </div>
               </div>
            </div>
            
        </div>
    
    </div>
</template>
<script>
export default {
    name: "login",
    props: {
        
    },
    data() {
        return {
           userImgsrc:"http://on4akwtwp.bkt.clouddn.com/user.jpg"
        }
    },
    methods: {
        loginExitHandler(){
            if(!this.$store.state.islogin&&!this.$store.state.loginModelShow){//未登录时点击显示登录框
               this.$store.commit('setloginShow', true);
            }else{//退出登录，要还原登录按钮（更新islogin），隐藏用户头像和退出按钮
                  //发送请求到服务器端，销毁session
                 this.$store.commit('setloginStaus', false); 
                 localStorage.clear();
                 this.$http.get('/destorySession')
                    .then(res=>{
                        this.$store.commit('setPersonData',false);
                    }).catch(err=>{
                        console.log(err);
                    });

            }
        },
    },
    computed:{
        islogin(){//登录后，登录按钮隐藏,用户头像和退出按钮显示
            return this.$store.state.islogin;
        },

    },
    mounted(){
        // if(localStorage.getItem('userid')==1){
        //         this.userImgsrc= "http://on4akwtwp.bkt.clouddn.com/user.jpg";
        //     }else{
        //         this.userImgsrc="http://on4akwtwp.bkt.clouddn.com/p_03.png";
        //     }
    }
}
</script>
<style scoped>
    .downOption{
        position:absolute;
        width:100px;
        height:200px;
        background-color: pink;
        top:90px;
        z-index: 9999;
    }
    .userPicBtn{
        display: inline-block;
        height:35px;
    }
    .userPic{
        display: inline-block;
        width:35px;
        height:35px;
        overflow: hidden;
        border-radius: 50%;
        transform: translateY(12px);
    }
    .userPic img{
        width:100%;
        cursor: pointer;
        display: block;
    }
    #exit,#login{
        cursor: pointer;
    }

</style>