import { getAllPosts } from "../repositories/posts.repository.js";

export async function getPosts(req, res) {

    try {
        const posts = await getAllPosts();

        res.send(posts.rows);
    }
    catch (err) {
        res.status(500).send(err.message);
    }
}