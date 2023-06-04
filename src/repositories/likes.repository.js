import { db } from "../database/database.connection.js";

export function postLike(userId, postId) {
    return db.query(`INSERT INTO 
    likes ("postId", "userId") 
    VALUES ($1, $2);`, [postId, userId]);
}
export function deleteLikes(userId, postId) {
    return db.query(`DELETE FROM 
    likes WHERE "postId" = $1 AND "userId" = $2;`, [postId, userId]);
}
export function sameUser(userId, postId) {
    return db.query(`SELECT * FROM likes WHERE "postId" = $1 AND "userId" = $2`, [postId, userId]);
}

export function whoLikeDB(id){
    return db.query(`
        SELECT "userId", name
        FROM likes
        JOIN users ON likes."userId" = users.id
        WHERE "postId" = $1;
    `, [id])
}