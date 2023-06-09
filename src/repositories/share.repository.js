import { db } from "../database/database.connection.js";

export async function getOriginalPost(originalPostId) {
    return db.query(`SELECT * FROM posts WHERE id=$1`,[originalPostId]);
}

export function createRepostDB(link, message, userId, linkTitle, linkImage, linkDescription, reposte, originalId, repostBy) {
    return db.query(`INSERT INTO 
    posts (link, message, "userId", "linkTitle", "linkImage", "linkDescription", "repost", "originalId", "repostBy") 
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING id
    ;`, [link, message, userId, linkTitle, linkImage, linkDescription, reposte, originalId, repostBy]);
}