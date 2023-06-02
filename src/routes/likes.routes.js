import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { validateToken } from "../middlewares/auth.middleware.js";
import { likesSchema } from "../schemas/likes.schemas.js";
import {  checkPost, deleteLike, postLikes } from "../controllers/likes.controller.js";

const likesRouter = Router();


likesRouter.post("/likes", validateSchema(likesSchema), validateToken, postLikes);
likesRouter.delete("/likes", validateSchema(likesSchema), validateToken, deleteLike);
likesRouter.post("/likesCheck", validateSchema(likesSchema), validateToken, checkPost);


export default likesRouter;