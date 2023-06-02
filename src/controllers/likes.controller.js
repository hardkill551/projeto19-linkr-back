import { deleteLikes, postLike, sameUser } from "../repositories/likes.repository.js";

export async function postLikes(req, res) {
    const {postId} = req.body
    try {
        const userLike = await sameUser(res.locals.userId, postId)
        console.log(userLike.rowCount)
        if (userLike.rowCount !== 0) return res.sendStatus(400)
        console.log(postId)
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

