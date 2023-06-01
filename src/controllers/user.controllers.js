import { getUserDB } from "../repositories/user.repository.js";

export async function getUser(req, res){
    const {letters} = req.params;
    try{
        const users = await getUserDB(letters);
        res.send(users.rows)
    }catch (err) {
        res.status(500).send(err.message);
    }
}