import { getHashtags, getPostsByHashtagDB } from "../repositories/hashtag.repository.js";

export async function getTrending(req, res) {
  try {
    const trendingTags = await getHashtags();
    return res.status(200).send(trendingTags.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getPostsByHashtag(req, res) {
  const { hashtag, limit } = req.params;
  try {
    const posts = await getPostsByHashtagDB(hashtag, limit);
    res.send(posts.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
