import { Router } from "express";
import { createPost, deletePost, getPosts, getUserPost, updatePost } from "../controllers/posts.controller.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postSchema, updateSchema } from "../schemas/posts.schemas.js";
import { validateToken } from "../middlewares/auth.middleware.js";
import { likesSchema } from "../schemas/likes.schemas.js";

const postsRouter = Router();

postsRouter.get("/posts/:limit",validateToken, getPosts);
postsRouter.post("/posts", validateToken, validateSchema(postSchema), createPost);
postsRouter.get("/posts/:id/:limit",validateToken, getUserPost);
postsRouter.delete("/posts", validateSchema(likesSchema), validateToken, deletePost);
postsRouter.put("/posts", validateSchema(updateSchema), validateToken, updatePost);

export default postsRouter;
