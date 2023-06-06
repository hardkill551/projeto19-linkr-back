import { db } from "../database/database.connection.js";

export async function getHashtags() {
  return db.query(
    `SELECT COUNT("postHashtag"."hashtagId") as "hashtagCount", hashtag.hashtag
      FROM "postHashtag"
      JOIN hashtag ON "postHashtag"."hashtagId" = hashtag.id
      GROUP BY hashtag.hashtag
      ORDER BY "hashtagCount" DESC
      LIMIT 10;`
  );
}

export async function getPostsByHashtagDB(hashtag) {
  return db.query(
    `SELECT 
    posts.*,
    users.name,
    users.picture,
    hashtag.hashtag,
    COUNT(likes.id) AS like_count,
    ARRAY(
      SELECT u.name
      FROM likes l
      JOIN users u ON l."userId" = u.id
      WHERE l."postId" = posts.id
  ) AS liked_by
    FROM posts 
    JOIN users ON users.id = posts."userId"
    JOIN "postHashtag" ON posts.id = "postHashtag"."postId"
    JOIN hashtag ON hashtag.id = "postHashtag"."hashtagId"
    LEFT JOIN likes ON likes."postId" = posts.id
    WHERE hashtag.hashtag = $1
    GROUP BY posts.id, users.name, users.picture, hashtag.hashtag
    ORDER BY posts.id DESC
    LIMIT 20;`,
    [hashtag]
  );
}
