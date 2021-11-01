const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'CAMMI',
    password: 'root',
});

module.exports = pool.promise();
