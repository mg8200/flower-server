const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const jwtDecode = require("jwt-decode");

// 提交订单
r.post("/submitOrders", (req, res) => {
    let obj = req.body;
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    obj.obj.uid = uid;
    newObj = obj.obj
    let sql = "INSERT INTO orders SET ?"
    getdata(sql, [newObj], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "订单提交成功"
            })
        } else {
            res.send({
                code: 400,
                msg: "订单提交失败"
            })
        }
    })
})

// 获取用户的订单列表
r.post("/getOrderList", (req, res) => {
    let status = req.body.status;
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    if (status == 'all') {
        let sql = "select * from orders where uid=?"
        getdata(sql, [uid], result => {
            res.send({
                code: 200,
                msg: "获取成功",
                data: result
            })
        })
    } else {
        let sql = "select * from orders  where uid=? and status=?"
        getdata(sql, [uid, +status], result => {
            res.send({
                code: 200,
                msg: "获取成功",
                data: result
            })
        })
    }
})


// 通过id获取订单
r.get("/getOrderDetail/:id", (req, res) => {
    let id = req.params.id;
    let sql = "select * from orders where id=?"
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
                msg: "获取失败",
                data: null
            })
        }
    })
})

// 确定收货
r.post("/sureGoods", (req, res) => {
    let id = req.body.id;
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let sql = "UPDATE orders SET status=3 where id=? and uid=?"
    getdata(sql, [id, uid], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "收货成功",
                data: result
            })
        } else {
            res.send({
                code: 400,
                msg: "收货失败",
                data: null
            })
        }
    })
})

// 提交评论
r.post("/submitComments", (req, res) => {
    let id = req.body.id;
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let comments_content = req.body.comments_content
    let obj = {}
    obj.uid = uid;
    obj.good_id = id;
    obj.comments_content = comments_content
    let sql = "INSERT INTO comments SET ?"
    getdata(sql, [obj], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "订单评论成功"
            })
        } else {
            res.send({
                code: 400,
                msg: "订单评论失败"
            })
        }
    })
})

//修改状态为完成
r.post("/reviewCompleted", (req, res) => {
    let id = req.body.id;
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let sql = "UPDATE orders SET status=4 where id=? and uid=?";
    getdata(sql, [id, uid], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "收货成功",
                data: result
            })
        } else {
            res.send({
                code: 400,
                msg: "收货失败",
                data: null
            })
        }
    })
})

// 评论完成，增加售量
r.post("/addSales", (req, res) => {
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let good_id=req.body.id;
    let count=req.body.count;
    if (!uid){
        res.send({
            code:401,
            msg:"配置错误"
        })
    }else{
        let sql ="UPDATE goods SET sales=sales+?  where id=?";
        getdata(sql,[count,good_id],result=>{
            if (result.affectedRows > 0) {
                res.send({
                    code: 200,
                    msg: "success",
                })
            }
        })
    }
})


module.exports = r