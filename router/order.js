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

// 删除订单
r.post("/deleteOrder", (req, res) => {
    let id = req.body.id
    let sql = "DELETE FROM orders WHERE id=?";
    getdata(sql, [id], result => {
        if (result.affectedRows > 0) {
            res.status(200).json({
                code: 200,
                msg: "删除成功"
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "删除失败"
            })
        }
    })
})

// 确定收货
r.post("/sureGoods", (req, res) => {
    let id = req.body.id;
    let token = req.body.token;
    let time = req.body.time;
    let uid = jwtDecode(token).id;
    let sql = "UPDATE orders SET status=5,received_time=? where id=? and uid=?"
    getdata(sql, [time, id, uid], result => {
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

// 修改订单状态为待审核
r.post("/checkPending", (req, res) => {
    let id = req.body.id;
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let sql = "UPDATE orders SET status=1 where id=? and uid=?";
    getdata(sql, [id, uid], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "提交成功",
            })
        } else {
            res.send({
                code: 400,
                msg: "提交失败",
                data: null
            })
        }
    })
})


//修改状态为完成
r.post("/reviewCompleted", (req, res) => {
    let id = req.body.id;
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let sql = "UPDATE orders SET status=6 where id=? and uid=?";
    getdata(sql, [id, uid], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "收货成功",
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

// 取消退货退款
r.post("/cancelRefund", (req, res) => {
    let id = req.body.id;
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let sql = "UPDATE orders SET status=3 where id=? and uid=?";
    getdata(sql, [id, uid], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "取消成功",
            })
        } else {
            res.send({
                code: 400,
                msg: "取消失败",
                data: null
            })
        }
    })
})

// 评论完成，增加售量
r.post("/addSales", (req, res) => {
    let token = req.body.token;
    let uid = jwtDecode(token).id;
    let good_id = req.body.id;
    let count = req.body.count;
    if (!uid) {
        res.send({
            code: 401,
            msg: "配置错误"
        })
    } else {
        let sql = "UPDATE goods SET sales=sales+?  where id=?";
        getdata(sql, [count, good_id], result => {
            if (result.affectedRows > 0) {
                res.send({
                    code: 200,
                    msg: "success",
                })
            }
        })
    }
})


// 获取待审核的订单
r.get("/auditOrderCount", (req, res) => {
    let sql = "SELECT count(*) as count FROM orders WHERE `status`=1";
    getdata(sql, [], result => {
        if (result.length > 0) {
            res.send({
                code: 200,
                data: result[0]
            })
        }
    })
})

//***************************************************************************************************************************************************************************** 
// 以下后台管理系统的接口
// 获取订单列表
r.get("/getOrderAllByLimit", (req, res) => {
    let obj = req.query;
    if (!obj.size) obj.size = 5;
    if (!obj.currentPage) obj.currentPage = 1;
    obj.page = (obj.currentPage - 1) * obj.size;
    let sql = 'SELECT * FROM orders LIMIT ?,?'
    let all = 'SELECT COUNT(*) as count FROM orders';
    getdata(all, [], result => {
        let count = result[0].count;
        getdata(sql, [obj.page, parseInt(obj.size)], data => {
            if (data.length > 0) {
                res.status(200).json({
                    code: 200,
                    msg: "获取数据成功",
                    data: {
                        data,
                        size: obj.size,
                        total: count,
                    }
                })
            } else {
                res.send({
                    code: 400,
                    msg: "获取数据为空",
                    data: []
                })
            }
        })
    })
})

// 修改订单数据
r.post("/changeOrderData", (req, res) => {
    let obj = req.body.obj;
    let id = obj.id;
    let sql = `UPDATE orders SET ? where id=?`;
    getdata(sql, [obj, id], result => {
        if (result.affectedRows > 0) {
            res.status(200).json({
                code: 200,
                msg: "数据修改成功",
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "数据修改失败",
            })
        }
    })
})

// 修改订单的状态
r.post("/changeOrderStatus", (req, res) => {
    let status = req.body.status;
    let id = req.body.id;
    let sql = `UPDATE orders SET status=? where id=?`;
    getdata(sql, [status, id], result => {
        if (result.affectedRows > 0) {
            res.status(200).json({
                code: 200,
                msg: "订单状态修改成功",
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "订单状态修改失败",
            })
        }
    })
})


// 删除订单
r.post("/deleteOrder", (req, res) => {
    let id = req.body.id;
    let sql = "DELETE FROM orders WHERE id=?";
    getdata(sql, [id], result => {
        if (result.affectedRows > 0) {
            res.status(200).json({
                code: 200,
                msg: "订单删除成功",
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "订单删除失败",
            })
        }
    })
})

// 按id来搜索某个订单
r.get("/searchOrder", (req, res) => {
    let obj =req.query
    let keyword = req.query.keyword;
    if (!obj.size) obj.size = 5;
    if (!obj.currentPage) obj.currentPage = 1;
    obj.page = (obj.currentPage - 1) * obj.size;
    let sql = `select * from orders where id LIKE '%${keyword}%' LIMIT ?,?`;
    let all = `select count(*) as count from orders where id LIKE '%${keyword}%'`
    getdata(all, [], data => {
        let count = data[0].count;
        getdata(sql, [obj.page, parseInt(obj.size)], result => {
            if (result.length > 0) {
                res.status(200).json({
                    code: 200,
                    msg: `共查询到${result.length}条数据`,
                    data: {
                        data:result,
                        size: obj.size,
                        total: count,
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
})

// 按订单状态进行获取订单数据
r.get("/selectOrderByStatus", (req, res) => {
    let obj =req.query
    let status = req.query.status;
    if (!obj.size) obj.size = 5;
    if (!obj.currentPage) obj.currentPage = 1;
    obj.page = (obj.currentPage - 1) * obj.size;
    let sql = `select * from orders where status=? LIMIT ?,?`;
    let all = `select count(*) as count from orders where status=?`
    getdata(all, [status], data => {
        let count = data[0].count;
        getdata(sql, [status,obj.page, parseInt(obj.size)], result => {
            if (result.length > 0) {
                res.status(200).json({
                    code: 200,
                    msg: `共查询到${result.length}条数据`,
                    data: {
                        data:result,
                        size: obj.size,
                        total: count,
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
})


module.exports = r