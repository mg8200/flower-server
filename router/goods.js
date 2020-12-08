const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const jwtDecode = require("jwt-decode")

// 获取侧板导航栏内容
r.get("/getGoodsTypeName/:good_type", (req, res) => {
    let good_type = req.params.good_type;
    let sql = "select * from goods where type_id=?"
    getdata(sql, [good_type], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

// 获取类型
r.get("/getGoodsType/:good_type", (req, res) => {
    let good_type = req.params.good_type;
    let sql = "select * from good_type where good_type_id=?"
    getdata(sql, [good_type], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

// 通过id获取某一个商品的信息
r.get("/getGoodsDetails/:id", (req, res) => {
    let id = req.params.id;
    let sql = "select * from goods where id=?"
    getdata(sql, [id], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data[0]
            })
        }
    })
})

// 获取赠送类别
r.get("/getsuitable_scene/:sid", (req, res) => {
    let id = req.params.sid;
    let sql = "select * from suitable_scene where sid=?"
    getdata(sql, [id], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data[0]
            })
        }
    })
})

// 获取赠送类别数据
r.get("/getsuitable_sceneData/:word", (req, res) => {
    let id = req.params.word;
    console.log("keyWord:", id)
    let sql = `select * from goods WHERE suitable_scene LIKE '%${id}%'`
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

// 通过热门关键字查找
r.get("/getSearchhot/:keyword", (req, res) => {
    let keyword = req.params.keyword;
    let sql = `select * from goods WHERE material LIKE '%${keyword}%'`
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

// 通关关键字查找
r.get("/getSearch/:keyword", (req, res) => {
    let keyword = req.params.keyword;
    let sql = `select * from goods WHERE name LIKE '%${keyword}%'`
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})



module.exports = r