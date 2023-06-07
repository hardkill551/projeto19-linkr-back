import { db } from "../database/database.connection.js";

export function getUserDB(letters, stalker) {
    return db.query(`
      SELECT u.*, 
        CASE WHEN f."followedId" IS NOT NULL THEN TRUE ELSE FALSE END AS is_followed
      FROM users AS u
      LEFT JOIN (
        SELECT "followedId"
        FROM following
        WHERE stalker = $2
      ) AS f ON f."followedId" = u.id
      WHERE LOWER(u.name) LIKE LOWER($1 || '%')
      ORDER BY is_followed DESC;
    `, [letters, stalker]);
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