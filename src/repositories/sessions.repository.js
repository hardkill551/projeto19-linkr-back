import { db } from "../database/database.connection.js";

export async function insertSession(token, userId) {
    return db.query(`INSERT INTO sessions(token, "userId") VALUES ($1, $2)`, [token, userId]);
}

export async function getSession(token, user){
    return db.query(`SELECT * FROM sessions WHERE token = $1 AND "userId" = $2`,[token, user])
    }