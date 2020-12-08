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



module.exports = r