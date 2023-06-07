import { createCommentDB } from "../repositories/comments.repository.js";

export async function createComment(req, res) {
    const { postId, comment } = req.body;
    const { userId } = res.locals;
    try {
        await createCommentDB(comment, postId, userId);
        res.sendStatus(201);
    }
    catch (err) {
        res.status(500).send(err.message);
    }
}