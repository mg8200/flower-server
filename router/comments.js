const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const jwtDecode = require("jwt-decode");


// 
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




module.exports = r