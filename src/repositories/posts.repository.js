import { db } from "../database/database.connection.js";

export function getAllPosts() {
    return db.query(`SELECT 
    posts.*, users.name, users.picture
    FROM posts 
    JOIN users ON users.id = posts."userId"
    ORDER BY id desc LIMIT 20;`);
}