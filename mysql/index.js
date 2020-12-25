const mysql = require("mysql")

const pool = mysql.createPool({
    host: '',
    port: '3306',
    user: '',
    password: '',
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