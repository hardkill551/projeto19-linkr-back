import { Router } from "express";
import { createComment } from "../controllers/comments.controller.js";
import { validateToken } from "../middlewares/auth.middleware.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { commentSchema } from "../schemas/comments.schemas.js";

const commentsRouter = Router();

commentsRouter.post("/comments", validateToken, validateSchema(commentSchema), createComment)

export default commentsRouter;
