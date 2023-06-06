import { Router } from "express";
import userRoutes from "./user.routes.js";
import postsRouter from "./posts.routes.js";
import likesRouter from "./likes.routes.js";
import tagRouter from "./hashtag.routes.js";

const router = Router();
router.use(postsRouter);
router.use(userRoutes);
router.use(likesRouter)
router.use(tagRouter);

export default router;
