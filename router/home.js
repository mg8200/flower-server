const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const multer = require("multer")
const uuid = require('uuid')


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
    } else {
        let sql = "select * from goods where title_id=?"
        getdata(sql, [tagId], data => {
            if (data.length > 0) {
                res.send({
                    code: 200,
                    data: data
                })
            } else {
                res.status(400).json("获取失败")
            }
        })
    }
})









//***************************************************************************************************************************************************************************** 
// 以下后台管理系统的接口
// 上传轮播图
// 设置存储规则
let ruler = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/img/home/banner')
    },
    filename: function (req, file, cb) {
        let index = file.originalname.lastIndexOf('.') + 1;
        let suffix = file.originalname.substring(index).toLocaleLowerCase()
        let mainane = uuid.v4()
        let filename = mainane + '.' + suffix
        cb(null, filename)
    }
})
// 使用自定义规则属性来来上传
const upload = multer({
    storage: ruler
})
r.post('/uploadSwiper', upload.array('upload'), (req, res) => {
    let index = req.files[0].originalname.lastIndexOf('.');
    let filename = req.files[0].filename;
    let destination = req.files[0].destination.replace('public', '')
    let filesSrc = destination + '/' + filename;
    console.log(req.files[0])
    console.log(filename)
    console.log(destination)
    let obj = {}
    obj.src = filesSrc;
    let sql = "INSERT INTO homeBanner SET ?"
    getdata(sql, [obj], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "上传成功"
            })
        }
    })
})

// 删除轮播图
r.post("/deleteSwiper", (req, res) => {
    let id = req.body.id;
    let sql = "DELETE FROM homeBanner WHERE id=?"
    getdata(sql, [id], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "删除成功"
            })
        } else {
            res.send({
                code: 400,
                msg: "删除失败"
            })
        }
    })
})

module.exports = r