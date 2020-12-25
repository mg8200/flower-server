const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const jwtDecode = require("jwt-decode");


// 获取某件商品的评论
r.get("/getComments/:good_id", (req, res) => {
    let good_id = req.params.good_id;
    let sql = "SELECT c.*,u.username FROM comments c JOIN `user` u on c.uid=u.id WHERE c.good_id=?;"
    getdata(sql, [good_id], result => {
        res.send({
            code: 200,
            data: result
        })
    })
})

//***************************************************************************************************************************************************************************** 
// 以下是后台管理系统接口
// 提交修改的评论内容
r.post("/changeComments",(req,res)=>{
    let id =req.body.id;
    let comments = req.body.comments;
    let sql ="update comments set comments_content=? where id =?";
    getdata(sql,[comments,id],result=>{
        if(result.affectedRows>0){
            res.status(200).json({
                code:200,
                msg:"修改成功"
            })
        }else{
            res.status(400).json({
                code:400,
                msg:"修改失败"
            })
        }
    })
})

// 删除某条评论
r.post("/deleteComment",(req,res)=>{
    let id =req.body.id;
    let sql ="DELETE FROM comments WHERE id=?";
    getdata(sql,[id],result=>{
        if(result.affectedRows>0){
            res.status(200).json({
                code:200,
                msg:"删除成功"
            })
        }else{
            res.status(400).json({
                code:400,
                msg:"删除失败"
            })
        }
    })
})

module.exports = r