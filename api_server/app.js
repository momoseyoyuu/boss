// 导入express
const express = require('express');
const app = express();
// 导入body-parser
const bodyParser = require('body-parser');
// 引入对应的路由
// const router = require('./router');
// 引入mysql
const mysql = require('mysql');
// 设置跨域访问
app.use(require('cors')());
// 挂在参数处理中间件（post）
app.use(bodyParser.urlencoded({
        extended: false
    }))
    // 处理json格式参数
app.use(bodyParser.json())
    // 使用路由
    // app.use('/', router)

// 创建数据库连接
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "123456quNA",
    database: "db"
})

db.connect((err => {
    if (err) throw err;
    console.log('连接成功');
}))

// 监听3000端口
app.listen(3000, (req, res) => {
    console.log('http://localhost:3000')
})

// 读取网格单元列表数据
app.get("/getgridcellsbycode/:code", (req, res) => {
    if (req.params.code == 1) {
        let sql = "select * from gridcells";
        db.query(sql, (err, result) => {
            if (err) {
                // console.log(err);
            } else {
                // console.log(result);
                res.send(result)
            }
        })
    } else {
        let sql = "select * from gridcells where gridcellcode='" + req.params.code + "'";
        db.query(sql, (err, result) => {
            if (err) {
                // console.log(err);
            } else {
                // console.log(result);
                res.send(result)
            }
        })
    }

})

// 验证用户名和密码是否存在
app.post("/login", (req, res) => {
    // console.log(req.body);
    let sql = "select * from users where username='" + req.body.username + "'";
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else if (result) {
            console.log(result);
            res.send(result);
        } else {
            // console.log("验证失败");
        }
    })
})

// 根据id查询网格单元信息
app.get("/getgridcellsbyid/:id", (req, res) => {
    let sql = "select * from gridcells where gridcellid='" + req.params.id + "'";
    db.query(sql, (err, result) => {
        if (err) {
            // console.log(err);
        } else {
            // console.log(result);
            res.send(result[0])
        }
    })
})

// 根据网格单元名称和网格单元编码获取符合条件的网格单元信息
app.get("/getgridcellsbyword/", (req, res) => {
    console.log(req.query);
    if (req.query.code == 1) {
        let sql = "select * from gridcells where gridcellname like '%" + req.query.query + "%'";
        db.query(sql, (err, result) => {
            if (err) {
                console.log(err);
            } else {
                console.log(result);
                res.send(result)
            }
        })
    } else {
        let sql = "select * from gridcells where gridcellname like '%" + req.query.query + "%' and gridcellcode='" + req.query.code + "'";
        db.query(sql, (err, result) => {
            if (err) {
                console.log(err);
            } else {
                console.log(result);
                res.send(result)
            }
        })
    }
})

// 获取经理人员信息
app.get("/getmanager", (req, res) => {
    let sql = "select * from manager";
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            // console.log(result);
            res.send(result);
        }
    })

})

// 根据选中的客户经理的id匹配工号信息
app.get("/getcminfo/:id", (req, res) => {
    let sql = "select * from manager where id='" + req.params.id + "'";
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            console.log(result);
            res.send(result);
        }
    })
})

// 根据选中的装维经理的id匹配工号
app.get("/getiminfo/:id", (req, res) => {
    let sql = "select * from manager where id='" + req.params.id + "'";
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            // console.log(result);
            res.send(result);
        }
    })
})

// 保存编辑的数据
app.get("/savedata/", (req, res) => {
    console.log(req.params);
    let sql = "update gridcells set customermanagername='" + req.query.customermanagername + "', customermanagerZGJN='" + req.query.customermanagerZGJN + "', customermanagerSPJN='" + req.query.customermanagerSPJN + "', installermanagername='" + req.query.installermanagername + "', installermanagerZGJN='" + req.query.installermanagerZGJN + "', installermanagerSPJN='" + req.query.installermanagerSPJN + "' where gridcellname='" + req.query.title + "'";
    // let sql = "select * from gridcells";
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            console.log(result);
            res.send("保存成功");
        }
    })
})