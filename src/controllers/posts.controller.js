import { createPostDB, createPostHashtagDB, getAllPostsDB, getIdHashtag, createHashtagDB } from "../repositories/posts.repository.js";
import urlMetadata from "url-metadata";

export async function getPosts(req, res) {
    try {
        const posts = await getAllPostsDB();

        res.send(posts.rows);
    } catch (err) {
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
                    console.log(hashtagIdRequest)

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
