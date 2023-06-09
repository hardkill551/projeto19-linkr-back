import { createPostDB, createPostHashtagDB, getAllPostsDB, getUserPostDB, getIdHashtag, createHashtagDB, sameUserPost, deletePosts, updatePosts, deletePostHashtagDB } from "../repositories/posts.repository.js";
import urlMetadata from "url-metadata";

export async function getPosts(req, res) {
  try {
    const { userId } = res.locals;
    
    const posts = await getAllPostsDB(userId);
    res.send(posts.rows);
  } catch (err) {
    console.log(err)
    res.status(500).send(err.message);
  }
}

export async function createPost(req, res) {
  const { link, message } = req.body;
  const { userId } = res.locals

  try {
    let linkTitle;
    let linkImage;
    let linkDescription;
    try {
      const metadata = await urlMetadata(link);
      linkTitle = metadata.title;
      linkImage = metadata.image;
      linkDescription = metadata.description;
    } catch (err) {
      console.log(err);
    }

    const postIdRequest = await createPostDB(link, message, userId, linkTitle, linkImage, linkDescription);
    const postId = postIdRequest.rows[0].id;

    if (message) {
      const regex = /#(\w+)/g;
      const hashtags = [];
      let match;
      while ((match = regex.exec(message))) {
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

          await createPostHashtagDB(postId, hashtagId);
        })
      }
    }
    res.sendStatus(201);
  }
  catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getUserPost(req, res) {
  const { id } = req.params;
  try {
    const result = await getUserPostDB(id);

    if (result.rows.length === 0 || result.rows[0].id === null) {
      const response = {
        name: result.rows[0].name,
        picture: result.rows[0].picture,
        postsUser: []
      };
      return res.send(response);
    }
    const formattedResult = result.rows.map(item => {
      return {
        name: item.name,
        picture: item.picture,
        postUser: {
          id: item.id,
          link: item.link,
          message: item.message,
          userId: item.userId,
          picture: item.picture,
          like_count: item.like_count,
          linkDescription: item.linkDescription,
          linkImage: item.linkImage,
          linkTitle: item.linkTitle,
          liked_by: item.liked_by,
          commentsCount: item.commentsCount,
          commentsData: item.commentsData
        }
      };
    });

    const response = {
      name: formattedResult[0].name,
      picture: formattedResult[0].picture,
      postsUser: formattedResult.map(item => item.postUser)
    };

    res.send(response);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
export async function deletePost(req, res) {
  const {postId} = req.body
  try {
      const userLike = await sameUserPost(res.locals.userId, postId)
      if (userLike.rowCount === 0) return res.sendStatus(404)
      await deletePosts(postId)
      res.sendStatus(201);
  } catch (err) {
      res.status(500).send(err.message);
  }
}
export async function updatePost(req, res) {
  const {id, description} = req.body
  try {
    await deletePostHashtagDB(id);
      const userLike = await sameUserPost(res.locals.userId, id)
      
      if (userLike.rowCount === 0) return res.sendStatus(404)
      
      await updatePosts(id, description)
        const regex = /#(\w+)/g;
        const hashtags = [];
        let match;
        while ((match = regex.exec(description))) {
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
            await createPostHashtagDB(id, hashtagId);
            
          })
        }
      
      res.sendStatus(201);
  } catch (err) {
      res.status(500).send(err.message);
  }
}