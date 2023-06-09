import { deleteLikes, postLike, sameUser, whoLikeDB } from "../repositories/likes.repository.js";

export async function postLikes(req, res) {
    const {postId} = req.body
    try {
        const userLike = await sameUser(res.locals.userId, postId)
        if (userLike.rowCount !== 0) return res.sendStatus(400)
        await postLike(res.locals.userId, postId)

        res.sendStatus(201);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function deleteLike(req, res) {
    const {postId} = req.body
    try {
        const userLike = await sameUser(res.locals.userId, postId)
        if (userLike.rowCount === 0) return res.sendStatus(401)
        await deleteLikes(res.locals.userId, postId)

        res.sendStatus(201);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function checkPost(req, res) {
    const {postId} = req.body
    try {
        const userLike = await sameUser(res.locals.userId, postId)
        if (userLike.rowCount === 0) return res.status(200).send(false)
        res.sendStatus(201);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function whoLike(req, res){
    const {id} = req.params;
    try{
        const peopleWhoLike = await whoLikeDB(id);
        res.send(peopleWhoLike.rows)
    }catch (err) {
        res.status(500).send(err.message);
    }
}