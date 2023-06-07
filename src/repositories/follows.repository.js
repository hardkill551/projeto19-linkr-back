import { db } from "../database/database.connection.js";

export function postFollowersDB(stalker, followedId){
    return db.query(`INSERT INTO following (stalker, "followedId") VALUES ($1, $2);`, [stalker, followedId])
}

export function deleteFollowersDB(stalker, followedId) {
    return db.query('DELETE FROM following WHERE stalker = $1 AND "followedId" = $2;', [stalker, followedId]);
}
