import { Router } from "express";
import userRoutes from "./user.routes.js";
import postsRouter from "./posts.routes.js";
import likesRouter from "./likes.routes.js";
import tagRoutes from "./hashtag.routes.js";

const router = Router();
router.use(postsRouter);
router.use(userRoutes);
router.use(likesRouter)
router.use(tagRoutes);

export default router;
