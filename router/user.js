const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const jwt = require("jsonwebtoken")
const config = require("../config")
const jwtDecode = require("jwt-decode");
const {
    result
} = require("lodash");

// 登录
r.post("/login", (req, res) => {
    let username = req.body.username;
    let password = req.body.password;
    let arr = [username, password]
    let sql = "select * from user where username = ? and password = ?"
    getdata(sql, arr, result => {
        if (result.length > 0) {
            const token = jwt.sign({
                id: result[0].id,
                username: result[0].username
            }, config.jwtSecret);
            res.send({
                code: 200,
                msg: "登录成功",
                token
            })
        }
    })
})

// 注册
r.post("/reg", (req, res) => {
    let obj = req.body;
    let arr1 = [obj.username]
    let sql1 = "select * from user where username = ?"
    getdata(sql1, arr1, (data) => {
        if (data.length > 0) {
            res.send({
                code: 400,
                msg: "用户名已存在"
            })
        } else {
            let sql2 = "INSERT INTO user SET ?";
            let arr2 = [obj.username, obj.password]
            getdata(sql2, [obj], (data) => {
                if (data.affectedRows > 0) {
                    res.send({
                        code: 200,
                        msg: "注册成功"
                    })
                }
            })
        }
    })
})

// 获取用户的地址列表
r.post("/getAddress", (req, res) => {
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let sql = "select * from address where uid=?"
    getdata(sql, [uid], result => {
        if (result.length > 0) {
            res.send({
                code: 200,
                msg: "获取成功",
                data: result
            })
        } else {
            res.send({
                code: 400,
                msg: "获取失败"
            })
        }
    })
})

// 通过id获取用户的地址列表
r.get("/getAddress/:id", (req, res) => {
    let id = req.params.id
    let sql = "select * from address where id =?";
    getdata(sql, [id], result => {
        if (result.length > 0) {
            res.send({
                code: 200,
                msg: "获取成功",
                data: result
            })
        } else {
            res.send({
                code: 400,
                msg: "获取失败"
            })
        }
    })
})

// 通过id修改用户收货地址

r.post("/changeAddress", (req, res) => {
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let obj = req.body.obj
    let id = obj.id;
    // let sql ="update address set name=?,address=?,tel=?,isDefault=? where id=? and uid=?"
    let sql = "update address set ? where id=? and uid=?"
    getdata(sql, [obj, id, uid], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "修改成功"
            })
        } else {
            res.send({
                code: 400,
                msg: "修改失败"
            })
        }
    })
})


// 通过id删除用户收货地址
r.post("/deleteAddress", (req, res) => {
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let id = req.body.id;
    let sql = "DELETE FROM address WHERE id=? and uid=?"
    getdata(sql, [id, uid], result => {
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

// 添加用户收货地址
r.post("/addAddress", (req, res) => {
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let obj = req.body.obj
    obj.uid=uid
    console.log(obj)
    let sql = "INSERT INTO address SET ?"
    getdata(sql, [obj], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "添加成功"
            })
        } else {
            res.send({
                code: 400,
                msg: "添加失败"
            })
        }
    })
})



module.exports = r