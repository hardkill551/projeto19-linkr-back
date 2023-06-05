import { Router } from "express";
<<<<<<< HEAD
import { createPost, getPosts,deletePost, updatePost } from "../controllers/posts.controller.js";
=======
import { createPost, getPosts, getUserPost } from "../controllers/posts.controller.js";
>>>>>>> 660788b92efb7153c07c9ec2b3e0c3d8d97e1fb4
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postSchema } from "../schemas/posts.schemas.js";
import { validateToken } from "../middlewares/auth.middleware.js";

const postsRouter = Router();

postsRouter.get("/posts", getPosts);
<<<<<<< HEAD
postsRouter.post("/posts", validateAuth, validateSchema(postSchema), createPost);
postsRouter.delete("/posts", validateAuth, deletePost);
postsRouter.put("/posts", validateAuth, validateSchema(postSchema), updatePost);
=======
postsRouter.post("/posts", validateToken, validateSchema(postSchema), createPost);
postsRouter.get("/posts/:id",validateToken, getUserPost);
>>>>>>> 660788b92efb7153c07c9ec2b3e0c3d8d97e1fb4

export default postsRouter;