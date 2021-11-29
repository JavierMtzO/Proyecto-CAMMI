const mysql = require('mysql2');

const pool = mysql.createPool({
    user: 'doadmin',
    password: 'pOho2KuKwY2WoHay',
    host: 'db-mysql-nyc3-18539-do-user-9351995-0.b.db.ondigitalocean.com',
    port: 25060,
    database: 'cammi',
});

module.exports = pool.promise();

