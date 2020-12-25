const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const multer = require("multer")
const uuid = require('uuid');

// 获取侧板导航栏内容
r.get("/getNav", (req, res) => {
    let sql = "select * from cat"
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

//获取根据catid获取文章列表 
r.get("/getArticleLists/:catid", (req, res) => {
    let catid = req.params.catid;
    console.log("catid:", catid)
    let sql = "select * from information where catid=?"
    getdata(sql, [catid], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})
// 获取文章详情
r.get("/getArticleitem/:id", (req, res) => {
    let id = req.params.id;
    let sql = "select * from information where id=?"
    getdata(sql, [id], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data[0]
            })
        }
    })
})

// 点击前往增加阅读数量
r.get("/addReading/:id", (req, res) => {
    let id = req.params.id;
    let sql = "UPDATE information SET viewed_count=viewed_count+1  where id=?";
    getdata(sql, [id], result => {
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "success",
            })
        }
    })
})



//***************************************************************************************************************************************************************************** 
// 以下是后台管理系统接口

// 获取所有的资讯列表
r.get("/getAllInformation", (req, res) => {
    let catid = req.query.catid;
    let obj = req.query;
    if (!obj.size) obj.size = 3;
    if (!obj.currentPage) obj.currentPage = 1;
    obj.page = (obj.currentPage - 1) * obj.size;
    let sql;
    let all = 'select * from information'
    getdata(all, [], data => {
        if (catid == 0) {
            sql = 'select * from information LIMIT ?,?';
            getdata(sql, [obj.page, parseInt(obj.size)], result => {
                if (result.length > 0) {
                    res.send({
                        code: 200,
                        msg: "获取成功",
                        data: result,
                        size: obj.size,
                        total: data.length,
                    })
                } else {
                    res.send({
                        code: 400,
                        msg: "获取失败",
                        data: []
                    })
                }
            })
        } else {
            sql = 'select * from information where catid=? LIMIT ?,?'
            let sql2 = 'select * from information where catid=?'
            getdata(sql2, [catid], datas => {
                getdata(sql, [catid, obj.page, parseInt(obj.size)], result => {
                    if (result.length > 0) {
                        res.send({
                            code: 200,
                            msg: "获取成功",
                            data: result,
                            size: obj.size,
                            total: datas.length,
                        })
                    } else {
                        res.send({
                            code: 400,
                            msg: "获取失败",
                            data: []
                        })
                    }
                })
            })

        }
    })
})
// 上传资讯标题图片
// 设置存储规则
let titleImgRuler = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/img/information')
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
const titleImgUpload = multer({
    storage: titleImgRuler
})
r.post('/uploadTitleImgUpload', titleImgUpload.array('titleImgupload'), (req, res) => {
    let index = req.files[0].originalname.lastIndexOf('.');
    let filename = req.files[0].filename;
    let destination = req.files[0].destination.replace('public', '')
    let filesSrc = destination + '/' + filename;
    res.send({
        code: 200,
        msg: "标题图片上传完成",
        src: filesSrc
    })
})



// 富文本上传图片
let editorRuler = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/img/information')
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
const editorUpload = multer({
    storage: editorRuler
})
r.post('/editorUpload', editorUpload.array('editorUpload'), (req, res) => {
    let index = req.files[0].originalname.lastIndexOf('.');
    let filename = req.files[0].filename;
    let destination = req.files[0].destination.replace('public', '')
    let filesSrc = destination + '/' + filename;
    console.log(filesSrc)
    res.send({
        // errno 即错误代码，0 表示没有错误。
        //       如果有错误，errno != 0，可通过下文中的监听函数 fail 拿到该错误码进行自定义处理
        "errno": 0,
        // data 是一个数组，返回图片的线上地址
        "data": [
            `http://www.minggang.top:8000${filesSrc}`,
        ]
    })
})

// 提交修改的内容
r.post("/submitChangeContent", (req, res) => {
    let obj = req.body.obj;
    let id = obj.id;
    let sql = `UPDATE information SET ? where id=?`
    var arr = [obj, id]
    getdata(sql, arr, result => {
        console.log(result)
        if (result.affectedRows > 0) {
            res.send({
                code: 200,
                msg: "数据修改成功"
            })
        } else {
            res.send({
                code: 400,
                msg: "数据修改失败"
            })
        }
    })
})

// 删除根据id删除文章
r.post("/deleteArticle", (req, res) => {
    let id = req.body.id;
    let sql = "DELETE FROM information WHERE id=?"
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

// 创建文章
r.post("/addInformation", (req, res) => {
    let obj = req.body.obj;
    let sql = "INSERT INTO information set ?";
    getdata(sql, [obj], result => {
        if (result.affectedRows > 0) {
            res.status(200).json({
                code: 200,
                msg: "创建文章成功"
            })
        }else{
            res.status(400).json({
                code:400,
                msg:"创建文章失败"
            })
        }
    })
})

// 增加分类
r.post("/addCategoryName",(req,res)=>{
    let categoryName =req.body.categoryName;
    let sql ="INSERT INTO cat VALUES(null,?)";
    getdata(sql,[categoryName],result=>{
        if(result.affectedRows>0){
            res.status(200).json({
                code:200,
                msg:"添加成功"
            })
        }
        else{
            res.status(400).json({
                code:400,
                msg:"添加失败"
            })
        }
    })
})

module.exports = r