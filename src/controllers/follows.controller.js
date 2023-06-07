import { deleteFollowersDB, postFollowersDB } from "../repositories/follows.repository.js";

export async function postFollowers(req, res){
    const { userId } = res.locals;
    const { followedId } = req.body;
    try{
        await postFollowersDB(userId, followedId);
        res.sendStatus(201);
    }catch (err) {
        res.status(500).send(err.message);
      }
}

export async function deleteFollowers(req, res){
    const { userId } = res.locals;
    const { followedId } = req.params;
    try{
        await deleteFollowersDB(userId, followedId);
        res.sendStatus(204);
    }catch (err) {
        res.status(500).send(err.message);
      }
}