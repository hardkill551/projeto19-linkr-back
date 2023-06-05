import { createPostDB, getAllPostsDB,deletePostDB,updatePostDB } from "../repositories/posts.repository.js";
import urlMetadata from "url-metadata";

export async function getPosts(req, res) {
    try {
        const postData = [];
        const posts = await getAllPostsDB();

        for (const post of posts.rows) {
            const id = post.id;
            const link = post.link;
            const message = post.message;
            const name = post.name;
            const picture = post.picture;
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
            const obj = { id, message, name, picture, link, linkTitle, linkImage, linkDescription };
            postData.push(obj);
        }

        res.send(postData);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function createPost(req, res) {
    const { link, message } = req.body;
    const { userId } = res.locals

    try {
        await createPostDB(link, message, userId);
        res.sendStatus(201);
    }
    catch (err) {
        res.status(500).send(err.message);
    }
}

export async function deletePost(req, res) {
    const { postID } = req.params;
    
  
    try {
        await deletePostDB(postID)
  
      res.sendStatus(204); 
    } catch (error) {
      console.log(error);
      return res.status(500).send(error.message);
    }
}  

export async function updatePost(req, res) {
    const { link, message } = req.body;
    const { userId } = res.locals

    try {
        await updatePostDB(link, message, userId);
        res.sendStatus(201);
    }
    catch (err) {
        res.status(500).send(err.message);
    }

}