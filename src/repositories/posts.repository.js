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

export async function deletePostDB(postId) {

    await db.query(`
    DELETE FROM posts WHERE id = $1;
  `, [postId]);
   await db.query(`DEELETE FROM postHashtag WHERE postId = $1`, [postId]);

    await db.query(`DELETE FROM likes WHERE postId = $1`, [postId]);
    
}

export function updatePostDB(link , message, postId) {
    

    return db.query(`
    UPDATE posts SET link = $1 , message = $2
    WHERE id = $3 
    
    `,[link, message ,postId] 
    )



}
