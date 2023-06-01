import { Router } from "express";
import postsRouter from "./posts.routes.js";
import userRoutes from "./user.routes.js";

const router = Router();
router.use(postsRouter);
router.use(userRoutes);


export default router;