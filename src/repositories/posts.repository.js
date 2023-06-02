import { db } from "../database/database.connection.js";

export function getAllPostsDB() {
    return db.query(`SELECT 
    posts.*,
    users.name,
    users.picture,
    COUNT(likes.id) AS like_count
FROM posts 
JOIN users ON users.id = posts."userId"
LEFT JOIN likes ON likes."postId" = posts.id
GROUP BY posts.id, users.name, users.picture
ORDER BY posts.id DESC
LIMIT 20;`);
}

export function createPostDB(link, message, userId, linkTitle, linkImage, linkDescription) {
    return db.query(`INSERT INTO 
    posts (link, message, "userId", "linkTitle", "linkImage", "linkDescription") 
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id
    ;`, [link, message, userId, linkTitle, linkImage, linkDescription]);
}

export function getIdHashtag(hashtag) {
    return db.query(`SELECT id FROM hashtag WHERE hashtag=$1;`, [hashtag]);
}

export function createHashtagDB(hashtag) {
    return db.query(`INSERT INTO hashtag (hashtag) VALUES ($1) RETURNING id;`, [hashtag]);

}

export function createPostHashtagDB(postId, hashtagId) {
    return db.query(`INSERT INTO "postHashtag" ("postId", "hashtagId") VALUES ($1, $2);`, [postId, hashtagId]);
}

export function getUserPostDB(id) {
    return db.query(`SELECT 
    posts.*, users.name, users.picture
    FROM posts 
    JOIN users ON users.id = posts."userId"
    WHERE users.id = $1
    ORDER BY id desc LIMIT 20;`, [id])
}