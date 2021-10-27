const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'cammi_db', 
    password: '',
});

module.exports = pool.promise();
