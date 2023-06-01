import { db } from "../database/database.connection.js";

export function getUserDB(letters){
    return db.query(`
        SELECT *
        FROM users
        WHERE LOWER(name) LIKE LOWER($1 || '%');    
    `, [letters])
}