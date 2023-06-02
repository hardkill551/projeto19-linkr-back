import { Router } from "express";
import { createPost, getPosts, getUserPost } from "../controllers/posts.controller.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postSchema } from "../schemas/posts.schemas.js";
import { validateToken } from "../middlewares/auth.middleware.js";

const postsRouter = Router();

postsRouter.get("/posts", getPosts);
postsRouter.post("/posts", validateToken, validateSchema(postSchema), createPost);
postsRouter.get("/posts/:id",validateToken, getUserPost);

export default postsRouter;