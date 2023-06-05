import { db } from "../database/database.connection.js";

export function getUserDB(letters){
    return db.query(`
        SELECT *
        FROM users
        WHERE LOWER(name) LIKE LOWER($1 || '%');    
    `, [letters])
}

export async function getUserRepository (email) {
	return db.query('SELECT * FROM users WHERE email = $1', [email]);
}
export async function getUserRepositoryById (id) {
	return db.query('SELECT * FROM users WHERE id = $1', [id]);
}
export async function insertUser(name, email, password, picture) {
	return db.query(`INSERT INTO users(name, email, password, picture) VALUES ($1, $2, $3, $4)`, [name, email, password, picture]);
}