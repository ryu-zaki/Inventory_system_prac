const pool = require('../config/db');
const organizedTable = require('../utils/organizedTable');

exports.findRecipes = async () => {
 try {
   const [rows] = await pool.query('CALL getAllRecipes()'); 
  
   return organizedTable(rows[0]);
 }

 catch(err) {
    console.log("Error: " + err.message);
 }
 

 return rows;
}