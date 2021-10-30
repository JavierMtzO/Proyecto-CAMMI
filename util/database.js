const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'cammi', 
    password: '',
});

module.exports = pool.promise();
