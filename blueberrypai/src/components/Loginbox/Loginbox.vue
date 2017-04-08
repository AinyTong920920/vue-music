<template>
    <div class="loginbox"
         v-if="loginModelShow">
        <div class="logininner">
            <h2>账号密码登录</h2>
            <div>
                <form id="loginform"
                      v-on:submit.prevent="submitHandler"
                      method="post"
                      style="margin:0px">
                    <input type="text"
                           id="username"
                           name="username"
                           v-model="userValue"
                           required
                           maxlength="20"
                           minlength="2"
                           placeholder=" 支持QQ号/邮箱/手机号登录">
                    <div style="position:relative;">
                        <input type="password"
                           required
                           id="password"
                           name="password"
                           @blur="checklevel"
                           placeholder=" 输入6-16位数字或字母"
                           v-model="pwdValue"
                           minlength="6"
                           maxlength="16">
                           <span class="leveltips" v-show="showlevel">
                               安全等级<br/>{{level}}
                           </span>
                    </div>
                    <input type="text"
                           v-if="!isShow"
                           required
                           id="nickname"
                           name="nickname"
                           placeholder=" 输入昵称"
                           v-model="nickValue"
                           minlength="2"
                           maxlength="10">
                    <div>
                        <button id="login_button"
                                v-if="isShow">登 录</button>
                        <button v-else
                                id="regist_button">注 册</button>
                        <p class="register">
                            <span @click="registerHandler">没有账号?注册一个 /</span>
                            <span @click="loginHandler">已有账号，直接登录</span>
                        </p>
                        <p v-if="tip1Show"
                           class="yztips">查找不到用户信息，重新输入或者注册新账号!</p>
                        <p v-if="tip2Show"
                           class="zctips">恭喜注册成功，现在登录!</p>
                    </div>
                    <i class="popup__icon_close sprite"
                       v-on:click="closeModal"></i>
                </form>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: 'loginbox',
    data() {
        return {
            isShow: true,
            userValue: '',
            pwdValue: '',
            nickValue: '',
            tip1Show: false,
            tip2Show: false,
            level:'',
            showlevel:false
        }
    },
    computed: {
        loginModelShow() {
            return this.$store.state.loginModelShow
        },

    },
    methods: {
        checklevel(){
            if(!this.isShow){
                this.showlevel=true;
                var reg=/^(?!([\d_])+$)(?!([a-zA-Z_]+)$)\w+$/;
                if(reg.test(this.pwdValue)){
                    this.level="强";
                }else{
                    this.level="弱";
                }
            }
            
        },
        closeModal() {
            this.$store.commit("setloginShow", false);
            this.resetFormdata();
        },
        setlocalStorage(data) {
            // 更新用户数据，并进行本地存储
            localStorage.clear();
            for (var key in data) {
                localStorage.setItem(key, data[key]);
            }
        },
        submitHandler() {
            if (this.isShow) {//登录事件

                var data = {
                    username: this.userValue,
                    pwd: this.pwdValue,
                };
                this.$http.post('/login', data)
                    .then(res => {
                        if (res.data != false) {
                            console.log('yz--ok');

                            // 登录成功，更新登录状态和隐藏登录框
                            this.$store.commit('setloginStaus', true);
                            this.$store.commit("setloginShow", false);

                            // 登录成功获取用户数据---更新全局状态
                            this.$http.post('http://localhost:3000/getUserData', { 'id': res.data[0].userid })
                                .then(res => {
                                    this.$store.commit('setPersonData', res.data);
                                    this.setlocalStorage(res.data);
                                }).catch(err => {
                                    console.log(err);
                                });

                        } else {
                            //验证失败，要重新登录，提示语显示
                            this.tip1Show = true;
                        }
                    }).catch(err => {
                        console.log(err)
                    })

            } else {//注册事件
                var data = {
                    username: this.userValue,
                    pwd: this.pwdValue,
                    nick: this.nickValue,
                };
                this.$http.post('http://localhost:3000/register', data)
                    .then(res => {
                        console.log(res.data);
                        this.tip2Show = true;
                        this.isShow = true;
                    }).catch(err => {
                        console.log(err)
                    })
            }
            // 表单提交后登录模态框隐藏,表单数据置空
            this.resetFormdata();
        },
        registerHandler() {
            this.isShow = false;
            this.resetFormdata();
        },
        loginHandler() {
            this.isShow = true;
            this.resetFormdata();
        },
        resetFormdata() {
            this.userValue = '';
            this.pwdValue = '';
            this.nickValue = "";
            this.tip1Show = false;
            this.tip2Show = false;
            this.showlevel=false;
        }
    }
}
</script>
<style scoped>
.leveltips{
    position: absolute;
    display:inline-block;
    width:60px;
    text-align: center;
    font-size: 12px;
    vertical-align: middle;
    color:#05c568;
    top:10px;
}
.register {
    color: #666;
    line-height: 50px;
    cursor: pointer;
}

.register span:hover {
    color: blue;
}

.yztips {
    color: #ff0000;
}

.zctips {
    color: blue;
}

.loginbox {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 500px;
    min-height: 400px;
    border: 1px solid #ccc;
    background-color: #fff;
    z-index: 999;
}

.logininner {
    padding: 50px 40px;
    text-align: center;
}

.logininner h2 {
    font-weight: normal;
}

#username,
#nickname,
#password {
    width: 260px;
    height: 35px;
    line-height: 35px;
    margin: 10px 0;
    border: 1px solid #ccc;
    text-indent: 10px;
}

#regist_button {
    width: 260px;
    height: 38px;
    margin-top: 10px;
    background-color: #86CE2F;
    color: #fff;
    border: none;
    font-size: 16px;
    cursor: pointer;
}

#login_button {
    width: 260px;
    height: 38px;
    margin-top: 10px;
    color: #fff;
    border: none;
    font-size: 16px;
    cursor: pointer;
    background-color: rgba(0, 122, 255, 0.61);
}

.popup__icon_close {
    position: absolute;
    top: 10px;
    right: 10px;
    width: 24px;
    height: 24px;
    overflow: hidden;
    z-index: 2;
    cursor: pointer;
    display: block;
    margin: 6px auto;
    width: 12px;
    height: 12px;
    background-image: url(../../image/indexImg/icon_popup.png);
    background-position: 0 -200px;
}
</style>