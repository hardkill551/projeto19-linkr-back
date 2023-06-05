import { db } from "../database/database.connection.js";

export async function getTags() {
  return db.query(
    `SELECT "hashtag" FROM "hashtags" ORDER BY  DESC LIMIT 10;`
  );
}

export async function getPostsByTag(tagId) {
  return db.query(
    `SELECT * FROM "posts" JOIN "hashtags"."hashtag" ON "hashtags"."id" = "posts"."tagId" WHERE "posts"."tagId" = $1 ORDER BY "posts"."id" DESC;`,
    [tagId]
  );
}
