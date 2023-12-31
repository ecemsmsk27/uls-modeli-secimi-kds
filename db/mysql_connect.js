const mysql = require("mysql");
require("dotenv/config");
var dbConn = mysql.createConnection({
  user: "root",
  password: "",
  host: "localhost",
  database: "uls_modeli_secimi_kds",
});
dbConn.connect((err) => {
  if (!err) {
    console.log("Veritabanına Bağlandı");
  } else {
    console.log("Bağlantı Hatası" + err);
  }
});
module.exports = dbConn;
