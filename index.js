const express = require("express")
const app = express();
const debug = require("debug")("my-application")
const bodyParser = require("body-parser")
const home = require("./router/home")
const information = require("./router/information")
const goods = require("./router/goods")
const user = require("./router/user")
const shoppingCar = require("./router/shoppingCar")
const order = require("./router/order")
const comments = require("./router/comments");
const config=require("./config")

app.listen(3000, (req, res) => {
    debug("服务器已启动端口3030")
})

app.all('*', function (req, res, next) {
    res.header("Access-Control-Allow-Origin", req.headers.origin);
    // res.header("Access-Control-Allow-Origin", '*');
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
    res.header("Access-Control-Allow-Credentials", "true");
    res.header("X-Powered-By", ' 3.2.1')
    if (req.method === "OPTIONS") res.send(200); /*让options请求快速返回*/
    else next();
})


app.use(express.static('./public'));
app.use(bodyParser.json())
app.use("/home", home)
app.use("/information", information)
app.use("/goods", goods)
app.use("/user", user)
app.use("/shoppingCar", shoppingCar)
app.use("/order", order)
app.use("/comments", comments)