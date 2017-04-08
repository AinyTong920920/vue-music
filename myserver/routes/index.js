var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var $ = require('jquery')(require("jsdom").jsdom().defaultView);

var connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'blueberrypai'
});

// 用户注册
router.post('/register', function(req, res, next) {
    var userinfo = {};
    userinfo.username = req.body.username;
    userinfo.userpwd = req.body.pwd;
    userinfo.nickname = req.body.nick;

    connection.query('INSERT INTO `user` SET ?', userinfo, function(err, results, fields) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            res.send('zc-ok');
        }
    });
});

//用户登录验证及返回数据,设置session
router.post('/login', function(req, res, next) {
    var username = req.body.username;
    var userpwd = req.body.pwd;

    connection.query('SELECT * FROM `user` WHERE username=? And userpwd=?', [username, userpwd], function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            if (rows != '') {
                // 登录后在服务器端设置session
                req.session.userinfo = {
                    uid: rows[0].userid,
                    uname: rows[0].username
                };
            }
            res.send(rows);
        }
    });
});

// 刷新页面返回session的状态
router.get('/getSession', function(req, res, next) {
    var result = {};
    console.dir(req.session);
    if (req.session.userinfo) {
        result.state = true;
    } else {
        result.state = false;
    }
    res.send(result);
});

// 退出登录销毁session
router.get('/destorySession', function(req, res, next) {
    console.log(req.session, 123);
    req.session.destroy(function(err) {
        console.log(err);
    })
    console.log(req.session, 666);
});

// 登录成功回调：获取用户的个人基本信息--歌单
router.post('/getUserData', function(req, res, next) {
    var id = req.body.id;
    connection.query('SELECT * FROM `user` WHERE userid=?', id, function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            var data = {
                userid: rows[0].userid,
                username: rows[0].username,
                nickname: rows[0].nickname,
                level: rows[0].level,
                mylist: rows[0].mylist
            }

            res.send(data);
        }
    });
});

// 我喜欢的歌单
router.get('/mylovelist', function(req, res, next) {
    connection.query('SELECT * FROM `songlibrary` LIMIT 65 ,15', function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            res.send(rows);
        }
    });

});

// 点击歌曲播放当前歌曲
router.post('/playOneSong', function(req, res, next) {
    var id = req.body.id;
    connection.query('SELECT * FROM `songlibrary` WHERE songid=?', id, function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            res.send(rows);
        }
    });

});

// 我创建的歌单模拟返回数据
router.post('/crtlist', function(req, res, next) {
    var num = req.body.num;

    connection.query('SELECT * FROM `songlibrary` LIMIT 68,' + num, function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            res.send(rows);
        }
    });

});



/* GET home page. */
// 新歌首发，热门歌单
router.get('/', function(req, res, next) {
    connection.query('SELECT * FROM `home` ', function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            res.send(sortQuery1(rows));
        }
    });
});
// 排行榜
router.get('/toplist', function(req, res, next) {
    connection.query('SELECT * FROM `songlibrary` ', function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            res.send(sortQuery2(rows));
        }
    });
});

// 点击列表根据id获取列表数据
// 歌单详情页面
router.post('/newsonglist', function(req, res, next) {
    var index = req.body.id - 1;
    connection.query('SELECT * FROM `songlibrary` LIMIT ' + (6 * index) + ',6', function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            res.send(rows);
        }
    });

});

// 热门歌单
router.post('/hostlist', function(req, res, next) {
    var index = req.body.id + 1;
    connection.query('SELECT * FROM `songlibrary` LIMIT ' + (12 * index) + ',15', function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            res.send(rows);
        }
    });

});
// 歌单推荐
router.post('/recommend', function(req, res, next) {
    var index = req.body.id;
    connection.query('SELECT * FROM `songlibrary` LIMIT ' + (12 * index) + ',12', function(err, rows, fd) {
        if (err) {
            console.log(err);
            res.send('服务器出错');
        } else {
            res.send(rows);
        }
    });

});


// 新歌首发数据分类
function sortQuery1(rows) {
    var datas = {
        newsonglist: [],
        hostlist: []
    };

    $(rows).each(function(index, ele) {
        if (ele.mark == "newsonglist") {
            datas.newsonglist.push(ele);
        }
        if (ele.playcount != '0') {
            datas.hostlist.push(ele);
        }
    });

    return datas;
}
// 排行榜数据分类
function sortQuery2(rows) {
    var datas = {
        poplist: [],
        newlist: [],
        hotlist: [],
        originallist: []
    };

    $(rows).each(function(index, ele) {
        if (ele.type == "poplist") {
            datas.poplist.push(ele);
        }
        if (ele.type == 'newlist') {
            datas.newlist.push(ele);
        }
        if (ele.type == 'hotlist') {
            datas.hotlist.push(ele);
        }
        if (ele.type == 'originallist') {
            datas.originallist.push(ele);
        }
    });

    return datas;
}



module.exports = router;