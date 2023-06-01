import { db } from "../database/database.connection.js";

export function getAllPostsDB() {
    return db.query(`SELECT 
    posts.*, users.name, users.picture
    FROM posts 
    JOIN users ON users.id = posts."userId"
    ORDER BY id desc LIMIT 20;`);
}

export function createPostDB(link, message, userId) {
    return db.query(`INSERT INTO posts (link, message, "userId") VALUES ($1, $2, $3);`, [link, message, userId]);
}