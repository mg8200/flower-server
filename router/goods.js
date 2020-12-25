const getdata = require("../mysql")
const express = require("express")
const r = express.Router();
const jwtDecode = require("jwt-decode")
const multer = require("multer")
const uuid = require('uuid');
const { get } = require("./comments");

// 获取侧板导航栏内容
r.get("/getGoodsTypeName/:good_type", (req, res) => {
    let good_type = req.params.good_type;
    let sql = "select * from goods where type_id=?"
    getdata(sql, [good_type], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

// 获取类型数据
r.get("/getGoodsType/:good_type", (req, res) => {
    let good_type = req.params.good_type;
    let sql = "select * from good_type where good_type_id=?"
    getdata(sql, [good_type], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

// 通过id获取某一个商品的信息
r.get("/getGoodsDetails/:id", (req, res) => {
    let id = req.params.id;
    let sql = "select * from goods where id=?"
    getdata(sql, [id], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data[0]
            })
        }
    })
})

// 获取赠送类别
r.get("/getsuitable_scene/:sid", (req, res) => {
    let id = req.params.sid;
    let sql = "select * from suitable_scene where sid=?"
    getdata(sql, [id], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data: data[0]
            })
        }
    })
})

// 获取赠送类别数据
r.get("/getsuitable_sceneData/:word", (req, res) => {
    let id = req.params.word;
    console.log("keyWord:", id)
    let sql = `select * from goods WHERE suitable_scene LIKE '%${id}%'`
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

// 通过热门关键字查找
r.get("/getSearchhot/:keyword", (req, res) => {
    let keyword = req.params.keyword;
    let sql = `select * from goods WHERE material LIKE '%${keyword}%'`
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

// 通关关键字查找
r.get("/getSearch/:keyword", (req, res) => {
    let keyword = req.params.keyword;
    let sql = `select * from goods WHERE name LIKE '%${keyword}%'`
    getdata(sql, [], data => {
        if (data.length > 0) {
            res.send({
                code: 200,
                data
            })
        }
    })
})

//***************************************************************************************************************************************************************************** 
// 以下是后台管理系统接口

// 获取商品信息（分页）
r.get('/getGoodsByLimit', (req, res) => {
    let obj = req.query;
    if (!obj.size) obj.size = 5;
    if (!obj.currentPage) obj.currentPage = 1;
    obj.page = (obj.currentPage - 1) * obj.size;
    let sql = 'SELECT * FROM goods LIMIT ?,?'
    let sql2 = 'SELECT * FROM goods'
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

// 获取商品类别
r.get("/gootdType", (req, res) => {
    let sql = "select * from good_type"
    getdata(sql, [], result => {
        if (result.length > 0) {
            res.status(200).json({
                code: 200,
                data: result,
                msg: "获取成功"
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "获取失败"
            })
        }
    })
})

// 改变某件商品是否允许首页显示
r.post("/changeIsindexShow", (req, res) => {
    let id = req.body.id;
    let status = req.body.status;
    status = status ? 1 : 0;
    let sql = "update goods set isIndexShow=? where id =?"
    getdata(sql, [status, id], result => {
        if (result.affectedRows > 0) {
            res.status(200).json({
                code: 200,
                msg: "修改成功"
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "修改失败"
            })
        }
    })
})

// 按关键字进行搜索
r.get("/getGoodsByKeyword", (req, res) => {
    let keyword = req.query.keyword;
    let obj = req.query;
    if (!obj.size) obj.size = 5;
    if (!obj.currentPage) obj.currentPage = 1;
    obj.page = (obj.currentPage - 1) * obj.size;
    let sql1 = `select count(*) as count from goods where name LIKE '%${keyword}%' or material LIKE '%${keyword}%'`
    let sql2 = `select * from goods where name LIKE '%${keyword}%' or material LIKE '%${keyword}%' LIMIT ?,?`
    getdata(sql1, [], result => {
        getdata(sql2, [obj.page, parseInt(obj.size)], data => {
            if (data.length > 0) {
                res.status(200).json({
                    code: 200,
                    msg: "搜索成功",
                    data: {
                        data,
                        size: obj.size,
                        total: result[0].count,
                    }
                })
            } else {
                res.send({
                    code: 400,
                    msg: "搜索数据为空",
                    data: {
                        data: [],
                        size: obj.size,
                        total: result[0].count,
                    }
                })
            }
        })
    });
})

// 按类别获取数据
r.get("/getGoodsBySelect", (req, res) => {
    let title_id = req.query.id;
    let obj = req.query;
    if (!obj.size) obj.size = 5;
    if (!obj.currentPage) obj.currentPage = 1;
    obj.page = (obj.currentPage - 1) * obj.size;
    let sql = "select count(*) as count from goods where title_id=?"
    let sql2 = "select * from goods where title_id=? LIMIT ?,?"
    getdata(sql, [title_id], result => {
        getdata(sql2, [title_id, obj.page, parseInt(obj.size)], data => {
            if (data.length > 0) {
                res.status(200).json({
                    code: 200,
                    msg: "获取成功",
                    data: {
                        data,
                        size: obj.size,
                        total: result[0].count,
                    }
                })
            } else {
                res.send({
                    code: 400,
                    msg: "获取数据为空",
                    data: {
                        data: [],
                        size: obj.size,
                        total: result[0].count,
                    }
                })
            }
        })
    })
})

// 获取标题名称
r.get("/getGoodsTitle", (req, res) => {
    let sql = "select * from good_title";
    getdata(sql, [], result => {
        if (result.length > 0) {
            res.status(200).json({
                code: 200,
                msg: "获取成功",
                data: result
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "获取失败",
                data: []
            })
        }
    })
})

//获取商品适合场景列表 
r.get("/getGoodsSuitableScene", (req, res) => {
    let sql = "select * from suitable_scene";
    getdata(sql, [], result => {
        if (result.length > 0) {
            res.status(200).json({
                code: 200,
                msg: "获取成功",
                data: result
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "获取失败",
                data: []
            })
        }
    })
})

// 商品轮播图上传
// 设置存储规则
let goodsSwiperRuler = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/img/goodsSwiper')
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
const goodsSwiperUpload = multer({
    storage: goodsSwiperRuler
})
r.post('/goodsSwiperUpload', goodsSwiperUpload.array('goodsSwiperUpload'), (req, res) => {
    let filesArr = []
    req.files.forEach(item => {
        let index = item.originalname.lastIndexOf('.');
        item.filename = item.filename + item.originalname.substring(index)
        let path = item.path;
        path = path.replace(/[\\]/g, "/").replace("public", "");
        filesArr.push(path)
    })

    let filesSrc = filesArr.join()
    let len = req.files.length;
    res.send({
        code: 200,
        msg: `共成功上传${len}个轮播图`,
        src: filesSrc
    })
})


// 上传商品标题图片
// 设置存储规则
let goodsTitleRuler = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/img/goodsSwiper')
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
const goodsTitleUpload = multer({
    storage: goodsTitleRuler
})
r.post('/goodsTitleUpload', goodsTitleUpload.array('goodsTitleUpload'), (req, res) => {
    let filesArr = []
    req.files.forEach(item => {
        let index = item.originalname.lastIndexOf('.');
        item.filename = item.filename + item.originalname.substring(index)
        let path = item.path;
        path = path.replace(/[\\]/g, "/").replace("public", "");
        filesArr.push(path)
    })

    let filesSrc = filesArr.join()
    let len = req.files.length;
    res.send({
        code: 200,
        msg: `标题图片上传完成`,
        src: filesSrc
    })
})

// 上传商品详情图片
// 设置存储规则
let goodsDetailRuler = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/img/goodsdetails')
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
const goodsDetailUpload = multer({
    storage: goodsDetailRuler
})
r.post('/goodsDetailUpload', goodsDetailUpload.array('goodsDetailUpload'), (req, res) => {
    let filesArr = []
    req.files.forEach(item => {
        let index = item.originalname.lastIndexOf('.');
        item.filename = item.filename + item.originalname.substring(index)
        let path = item.path;
        path = path.replace(/[\\]/g, "/").replace("public", "");
        filesArr.push(path)
    })

    let filesSrc = filesArr.join()
    let len = req.files.length;
    res.send({
        code: 200,
        msg: `共成功上传${len}个详情图片`,
        src: filesSrc
    })
})


// 提交修改的商品内容
r.post("/changeGoods", (req, res) => {
    let obj = req.body.obj;
    let id = obj.id;
    let sql = `UPDATE goods SET ? where id=?`
    getdata(sql, [obj, id], result => {
        if (result.affectedRows > 0) {
            res.status(200).json({
                code: 200,
                msg: "修改成功"
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "修改失败"
            })
        }
    })
})

// 发布商品
r.post("/releaseGoods", (req, res) => {
    let obj = req.body.obj;
    let sql = "INSERT INTO goods set ?";
    getdata(sql, [obj], result => {
        if (result.affectedRows > 0) {
            res.status(200).json({
                code: 200,
                msg: "商品发布成功"
            })
        } else {
            res.status(400).json({
                code: 400,
                msg: "商品发布失败"
            })
        }
    })
})

// 删除商品
r.post("/deleteGoods",(req,res)=>{
    let id =req.body.id;
    let sql ="DELETE FROM goods WHERE id=?";
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

// 获取某个商品分类的商品的售量
r.get("/getGoodsSales/:titleId",(req,res)=>{
    let titleId= req.params.titleId;
    let sql ="select name,sales from goods where title_id=?"
    getdata(sql,[titleId],result=>{
        if(result.length>0){
            res.status(200).json({
                code:200,
                msg:"获取成功",
                data:result
            })
        }else{
            res.status(400).json({
                code:400,
                msg:"获取失败",
                data:[]
            })
        }
    })
})

// 增加类型
r.post("/addGoodTitleName",(req,res)=>{
    let goodTitleName =req.body.goodTitleName;
    let sql ="INSERT INTO good_title VALUES(null,?)";
    getdata(sql,[goodTitleName],result=>{
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