import { db } from "../database/database.connection.js";

export function getAllPostsDB() {
    return db.query(`SELECT 
    posts.*,
    users.name,
    users.picture,
    COUNT(likes.id) AS like_count,
    ARRAY(
        SELECT u.name
        FROM likes l
        JOIN users u ON l."userId" = u.id
        WHERE l."postId" = posts.id
    ) AS liked_by,
	COUNT(comments.id) AS "commentsCount",
     (
        SELECT json_agg(json_build_object('comment', c.comment, 'commentAuthor', u.name, 'pictureAuthor', u.picture))
        FROM comments c
        JOIN users u ON c."userId" = u.id
        WHERE c."postId" = posts.id
    ) AS "commentsData"
    FROM posts 
    JOIN users ON users.id = posts."userId"
	LEFT JOIN comments ON comments."postId" = posts.id
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
    return db.query(
        `SELECT posts.*, users.name, users.picture,
      COUNT(likes.id) AS like_count,
      ARRAY(
          SELECT u.name
          FROM likes l
          JOIN users u ON l."userId" = u.id
          WHERE l."postId" = posts.id
      ) AS liked_by
    FROM users
    LEFT JOIN posts ON users.id = posts."userId"
    LEFT JOIN likes ON posts.id = likes."postId"
    WHERE users.id = $1
    GROUP BY posts.id, users.id
    ORDER BY posts.id DESC
    LIMIT 20;
  
  `,
        [id]
    );
}
