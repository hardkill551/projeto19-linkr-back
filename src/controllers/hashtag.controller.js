import { getTags, getPostsByTag } from "../repositories/tagRepository.js";

export async function getTrending(req, res) {
  try {
    const trendingTags = await getTags();
    return res.status(200).send(trendingTags.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getTaggedPosts(req, res) {
  const tagId = Number(req.params.id);
  try {
    const posts = await getPostsByTag(tagId);
    res.send(posts.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
}
