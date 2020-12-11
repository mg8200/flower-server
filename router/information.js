const getdata = require("../mysql")
const express = require("express")
const r = express.Router();

// 获取侧板导航栏内容
r.get("/getNav", (req, res) => {
    let sql = "select * from cat"
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

//获取根据catid获取文章列表 
r.get("/getArticleLists/:catid", (req, res) => {
    let catid = req.params.catid;
    console.log("catid:", catid)
    let sql = "select * from information where catid=?"
    getdata(sql, [catid], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})
// 获取文章详情
r.get("/getArticleitem/:id", (req, res) => {
    let id = req.params.id;
    let sql = "select * from information where id=?"
    getdata(sql, [id], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data[0]
            })
        }
    })
})

// 点击前往增加阅读数量

r.get("/addReading/:id", (req, res) => {
    let id = req.params.id;
    let sql = "UPDATE information SET viewed_count=viewed_count+1  where id=?";
    getdata(sql, [id], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "success",
            })
        }
    })
})




module.exports = r