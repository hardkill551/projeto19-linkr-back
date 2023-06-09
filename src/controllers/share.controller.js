import { createHashtagDB, createPostHashtagDB, getIdHashtag } from "../repositories/posts.repository.js";
import { createRepostDB, getOriginalPost } from "../repositories/share.repository.js";

export async function sharePost(req, res) {
    const { userId } = res.locals
    const { postId } = req.body
    try { 
        const reposte = true
        const respostBy = userId
        const originalPost = await getOriginalPost(postId)
        const originalId = originalPost.rows[0].id
        const createRepost = await createRepostDB(originalPost.rows[0].link, originalPost.rows[0].message, originalPost.rows[0].userId, originalPost.rows[0].linkTitle, originalPost.rows[0].linkImage, originalPost.rows[0].linkDescription, reposte, originalId, respostBy);
        const repostId = createRepost.rows[0].id;
        if (originalPost.rows[0].message) {
            const regex = /#(\w+)/g;
            const hashtags = [];
            let match;
            while ((match = regex.exec(originalPost.rows[0].message))) {
              const hashtag = match[1].toLowerCase();
              hashtags.push(hashtag);
            }
      
            if (hashtags.length > 0) {
              let hashtagId;
              hashtags.forEach(async hashtag => {
                const hashtagIdRequest = await getIdHashtag(hashtag);
      
                if (hashtagIdRequest.rowCount > 0) {
                  hashtagId = hashtagIdRequest.rows[0].id;
                } else {
                  const hashtagCreated = await createHashtagDB(hashtag);
                  hashtagId = hashtagCreated.rows[0].id;
                }
      
                await createPostHashtagDB(repostId, hashtagId);
              })
            }
          }
        res.sendStatus(201);
    } catch (err) {
        res.status(500).send(err.message);

    }
  }