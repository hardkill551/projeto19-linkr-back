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

export async function getUserPost(req, res){
    const { id } = req.params;
    try{
        const post = await getUserPost(id);
        res.send(post.rows);
    }catch (err) {
        res.status(500).send(err.message);
    }
}