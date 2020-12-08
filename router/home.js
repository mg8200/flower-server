const getdata = require("../mysql")
const express = require("express")
const r = express.Router();


// 获取轮播图
r.get("/getBanner", (req, res) => {
    let sql = "select * from homeBanner"
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data
            })
        } else {
            res.status(400).json("获取失败")
        }
    })
})
// 获取导航栏
r.get("/homeNav", (req, res) => {
    let sql = "select * from homeNav"
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data
            })
        } else {
            res.status(400).json("获取失败")
        }
    })
})
// 获取快速导航栏
r.get("/imgNav", (req, res) => {
    let sql = "select * from imgNav"
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data
            })
        } else {
            res.status(400).json("获取失败")
        }
    })
})

// 获取模块类型名称
r.get("/getGoodsType", (req, res) => {
    let sql = "select * from good_title"
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data
            })
        } else {
            res.status(400).json("获取失败")
        }
    })
})

// 获取模块数据
r.get("/module/:tagId", (req, res) => {
    let tagId = req.params.tagId
    if (tagId == "") {
        let sql = "select * from goods"
        getdata(sql, [], data => {
            if (data.length > 0) {
                res.send({
                    code: 200,
                    data: data
                })
            } else {
                res.status(400).json("获取失败")
            }
        })
    }else{
        let sql="select * from goods where title_id=?"
        getdata(sql,[tagId],data=>{
            if(data.length>0){
                res.send({
                    code:200,
                    data:data
                })
            }else{
                res.status(400).json("获取失败")
            }
        })
    }

})

module.exports = r