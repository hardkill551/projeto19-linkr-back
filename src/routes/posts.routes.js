import { Router } from "express";
import { getPosts } from "../controllers/posts.controller.js";

const postsRouter = Router();

postsRouter.get("/posts", getPosts);

export default postsRouter;