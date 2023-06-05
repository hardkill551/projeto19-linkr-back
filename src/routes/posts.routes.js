import { Router } from "express";
import { createPost, getPosts,deletePost, updatePost } from "../controllers/posts.controller.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postSchema } from "../schemas/posts.schemas.js";
import {validateToken} from "../middlewares/validateToken.middleware.js";

const postsRouter = Router();

postsRouter.get("/posts", getPosts);
postsRouter.delete("/posts", validateToken, deletePost);
postsRouter.put("/posts", validateToken, validateSchema(postSchema), updatePost);
postsRouter.post("/posts", validateToken, validateSchema(postSchema), createPost);
postsRouter.get("/posts/:id", getUserPost);

export default postsRouter;