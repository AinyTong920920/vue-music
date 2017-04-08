import Vue from 'vue'
import Router from 'vue-router'
import Find from '../components/Find/Find'
import Mine from '../components/Mine/Mine'
import FavoriteList from '../components/Mine/FavoriteList'
import CreateList from '../components/Mine/CreateList'
import Watch from '../components/Mine/Watch'
import Fans from '../components/Mine/Fans'
import Songmenu from "../components/Find/Songmenu";
import Singlesong from "../components/Find/Singlesong";
import MylistDetail from "../components/Mine/MylistDetail";

Vue.use(Router);

export default new Router({
    routes: [{
            path: '/',
            name: 'Find',
            component: Find,

        }, {
            path: '/songmenu',
            name: 'Songmenu',
            component: Songmenu
        }, {
            path: '/singlesong',
            name: 'Singlesong',
            component: Singlesong
        },
        {
            path: '/mylistDetail',
            name: 'MylistDetail',
            component: MylistDetail
        },
        {
            path: '/mine',
            component: Mine,
            Mineredirect: '/mine/favoritelist',
            children: [{
                    path: '',
                    component: FavoriteList
                },
                {
                    path: 'favoritelist',
                    component: FavoriteList
                },
                {
                    path: 'createlist',
                    component: CreateList
                },
                {
                    path: 'watch',
                    component: Watch
                },
                {
                    path: 'fans',
                    component: Fans
                }
            ]
        }
    ]

});