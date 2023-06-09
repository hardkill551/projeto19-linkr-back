import jwt from "jsonwebtoken"
import { getSession } from "../repositories/sessions.repository.js"
export async function validateToken(req, res, next) {
    try {
        const { authorization } = req.headers
        
        const token = authorization?.replace("Bearer ", "")
        if (!token) return res.sendStatus(401)
        
        const user = jwt.verify(token, process.env.SECRET_KEY)
        res.locals.userId = user
        res.locals.token = token
        next()
    }
    catch (err) {
        res.status(401).send(err.message)
    }
}