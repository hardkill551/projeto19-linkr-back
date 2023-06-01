import { Router } from "express";
import { createPost, getPosts, getUserPost } from "../controllers/posts.controller.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postSchema } from "../schemas/posts.schemas.js";
import { validateAuth } from "../middlewares/auth.middleware.js";

const postsRouter = Router();

postsRouter.get("/posts", getPosts);
postsRouter.post("/posts", validateAuth, validateSchema(postSchema), createPost);
postsRouter.get("/posts/:id", getUserPost);

export default postsRouter;