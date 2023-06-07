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
    COUNT(DISTINCT likes.id) AS like_count,
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
