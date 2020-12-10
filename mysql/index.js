const mysql = require("mysql")

const pool = mysql.createPool({
    host: '101.132.151.184',
    port: '3306',
    user: 'root',
    password: '19980601mg',
    database: 'flowersbaking',
    connectionLimit: '15'
})

const getData = function (sql, arr, callback) {
    pool.query(sql, arr, function (err, result) {
        if (err) {
            console.log(new Error(err));
            return
        }
        callback(result)
    })
}

module.exports = getData;