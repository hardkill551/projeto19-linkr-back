import { Router } from "express";
import { createPost, getPosts,deletePost, updatePost } from "../controllers/posts.controller.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postSchema } from "../schemas/posts.schemas.js";
import { validateAuth } from "../middlewares/auth.middleware.js";

const postsRouter = Router();

postsRouter.get("/posts", getPosts);
postsRouter.post("/posts", validateAuth, validateSchema(postSchema), createPost);
postsRouter.delete("/posts", validateAuth, deletePost);
postsRouter.put("/posts", validateAuth, validateSchema(postSchema), updatePost);

export default postsRouter;