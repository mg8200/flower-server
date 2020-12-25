const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const jwt = require("jsonwebtoken")
const config = require("../config")
const jwtDecode = require("jwt-decode");
const md5 = require("md5")

// 登录
r.post("/login", (req, res) => {
    let username = req.body.username;
    let password = req.body.password;
    password = md5(password)
    let arr = [username, password];
    let sql = "select * from user where username = ? and password = ?"
    getdata(sql, arr, result => {
        if (result.length > 0) {
            if (result[0].isOnline == 0) {
                res.send({
                    code: 400,
                    msg: "该用户已被禁用"
                })
            } else {
                const token = jwt.sign({
                    id: result[0].id,
                    username: result[0].username,
                    superPassword: result[0].superPassword,
                }, config.jwtSecret, {
                    expiresIn: "7day"
                });
                res.send({
                    code: 200,
                    msg: "登录成功",
                    token
                })
            }

        } else {
            res.send({
                code: 400,
                msg: "用户名或者密码错误"
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
            let sql2 = `INSERT INTO user VALUES(null,?,MD5(?),?,?)`
            obj.superPassword = '000000'
            obj.permissions = 0
            let arr2 = [obj.username, obj.password, obj.permissions, obj.superPassword];
            console.log(arr2)
            getdata(sql2, arr2, (data) => {
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

// 修改密码
r.post("/changePassWrod", (req, res) => {
    let token = req.body.token;
    let obj = jwtDecode(token)
    let uid = obj.id
    let password = req.body.password
    let arr = [password, uid]
    let sql = "update user set password = MD5(?) where id=?";
    getdata(sql, arr, data => {
        if (data.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "密码修改成功"
            })
        } else {
            res.send({
                code: 400,
                msg: "密码修改失败"
            })
        }
    })
})

// 修改超级密码
r.post("/changeSuperPassword", (req, res) => {
    let token = req.body.token;
    let value = req.body.value;
    let id = jwt.decode(token).id;
    let sql = "update user set superPassword =? where id=?";
    getdata(sql, [value, id], result => {
        if (result.affectedRows > 0) {
            let sql2 = 'select * from user where id=?'
            getdata(sql2, [id], data => {
                const token = jwt.sign({
                    id: data[0].id,
                    username: data[0].username,
                    superPassword: data[0].superPassword,
                }, config.jwtSecret, {
                    expiresIn: "7day"
                });
                res.status(200).json({
                    code: 200,
                    msg: "修改成功",
                    token
                })
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "修改失败"
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
    console.log(id)
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
    obj.uid = uid
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

// 检查token是否有效
r.post("/checkToken", (req, res) => {
    let token = req.body.token
    jwt.verify(token, config.jwtSecret, (err, decode) => {
        if (err) {
            res.send({
                code: 401,
                msg: "无效token或token已过期,请重新登录"
            })
        } else {
            res.status(200).json({
                code: 200,
                msg: "验证成功"
            })
        }
    })

})

//***************************************************************************************************************************************************************************** 
// 以下后台管理系统的接口

// 后台管理系统登录
r.post("/cmsLogin", (req, res) => {
    let username = req.body.username;
    let password = req.body.password;
    password = md5(password)
    let arr = [username, password]
    let sql = "select * from user where username = ? and password = ? and permissions!=0"
    getdata(sql, arr, result => {
        if (result.length > 0) {
            const token = jwt.sign({
                id: result[0].id,
                username: result[0].username,
            }, config.jwtSecret, {
                expiresIn: config.expiresIn
            });
            res.send({
                code: 200,
                msg: "登录成功",
                token
            })
        } else {
            res.send({
                code: 400,
                msg: "登录失败，你没有权限登录或用户名或者密码错误",
            })
        }
    })
})

// 获取用户列表
// size 每页显示几个
// currentPage 当前页码
r.get('/allUser', (req, res) => {
    let obj = req.query;
    if (!obj.size) obj.size = 5;
    if (!obj.currentPage) obj.currentPage = 1;
    obj.page = (obj.currentPage - 1) * obj.size;
    let sql = 'SELECT * FROM user LIMIT ?,?'
    let sql2 = 'SELECT * FROM user'
    getdata(sql2, [], result => {
        if (result.length > 0) {
            getdata(sql, [obj.page, parseInt(obj.size)], data => {
                if (data.length > 0) {
                    res.send({
                        code: 200,
                        msg: "查询成功",
                        data: {
                            data,
                            size: obj.size,
                            total: result.length,
                        }
                    })
                } else {
                    res.send({
                        code: 400,
                        msg: "查询数据为空",
                        data: []
                    })
                }
            })
        }
    })
})

// 修改用户是否允许登录
r.post("/changeOnline", (req, res) => {
    let id = req.body.id;
    if (id == 1) {
        res.send({
            code: 400,
            msg: "超级管理员账户不允许更改"
        })
        return
    }
    let status = req.body.status;
    status = status == false ? 0 : 1;
    let sql = "UPDATE user SET isOnline=? where id=?"
    getdata(sql, [status, id], result => {
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

// 编辑用户信息
r.post("/changeUserData", (req, res) => {
    let obj = req.body;
    obj.isOnline = obj.isOnline == true ? 1 : 0;
    let sql = "UPDATE user SET username=?,isOnline=?,superPassword=? where id=?";
    let arr = [obj.username, obj.isOnline, obj.superPassword, obj.id];
    getdata(sql, arr, result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "修改成功"
            })
        } else {
            res.send({
                code: 400,
                msg: "未进行修改"
            })
        }
    })
})

// 通过关键字获取用户列表
r.get('/getUserByKeyWord', (req, res) => {
    let obj = req.query;
    let keyword = req.query.keyword
    let sql = `SELECT * FROM user  WHERE username LIKE '%${keyword}%'`
    getdata(sql, [], result => {
        if (result.length > 0) {
            res.send({
                code: 200,
                msg: "查询成功",
                data: {
                    data: result,
                    total: result.length,
                }
            })
        } else {
            res.send({
                code: 400,
                msg: "查询数据为空",
                data: []
            })
        }
    })
})

// 删除用户

r.post("/deleteUser", (req, res) => {
    let id = req.body.id;
    let sql = "DELETE FROM user WHERE id=?";
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