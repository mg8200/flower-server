const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const jwtDecode = require("jwt-decode");


// 将商品加入购物车
r.post("/joinCar", (req, res) => {
    let obj = req.body.data;
    let uid = jwtDecode(obj.token).id;
    let arr = {};
    arr.uid = uid;
    arr.goods_id = obj.goods_id;
    arr.price = obj.price;
    arr.count = obj.count;
    let sql1 = "select * from shoppingCar where uid=? and goods_id=?"
    getdata(sql1, [uid, obj.goods_id], data => {
        if (data.length > 0) {
            let sql3 = "update shoppingCar set count=count+? where uid = ? and goods_id=?"
            getdata(sql3, [obj.count, uid, obj.goods_id], result => {
                res.send({
                    code: 201,
                    msg: "商品数量增加"
                })
            })
        } else {
            let sql2 = "INSERT INTO shoppingCar SET ?"
            getdata(sql2, [arr], data => {
                if (data.affectedRows > 0) {
                    res.send({
                        code: 200,
                        msg: "加入成功"
                    })
                } else {
                    res.send({
                        code: 400,
                        msg: "加入失败"
                    })
                }
            })
        }
    })
})

// 查询用户购物车商品数量
r.get("/getCarCount/:token", (req, res) => {
    let token = req.params.token;
    let uid = jwtDecode(token).id;
    let sql = "select * from shoppingCar where uid=?"
    getdata(sql, [uid], data => {
        res.send({
            data: data.length
        })
    })
})

// 查询用户购物车的数据
r.get("/getCarData/:token", (req, res) => {
    let token = req.params.token;
    let uid = jwtDecode(token).id;
    console.log("用户查询了购物车")
    console.log(uid)
    let sql = "select c.*,g.name,g.src,g.price as g_price,g.original_price,g.material from shoppingCar c JOIN `user` u on c.uid=u.id join goods g on g.id=c.goods_id where c.uid=?"
    getdata(sql, [uid], result => {
        if (result.length > 0) {
            res.send({
                code: 200,
                msg: "查询成功",
                data: result
            })
        } else {
            res.send({
                code: 400,
                msg: "查询失败，该用户还没有添加商品",
                data: []
            })
        }
    })
})

// 通过id删除购物车中某一件商品
r.post("/deleteItem",(req,res)=>{
    let id =req.body.id;
    console.log("id：",id)
    let sql ="DELETE FROM shoppingCar WHERE id=?"
    getdata(sql,[id],result=>{
        if(result.affectedRows>0){
            res.send({
                code:200,
                msg:"删除成功"
            })
        }
        else{
            res.send({
                code:400,
                msg:"删除失败"
            })
        }
    })
})


module.exports = r