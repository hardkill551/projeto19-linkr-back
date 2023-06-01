import { Router } from "express";
import { getPosts, getUserPost } from "../controllers/posts.controller.js";

const postsRouter = Router();

postsRouter.get("/posts", getPosts);
postsRouter.get("/posts/:id", getUserPost);

export default postsRouter;