import { Router } from "express";
import { deleteFollowers, getFollowers, postFollowers } from "../controllers/follows.controller.js";
import { validateToken } from "../middlewares/auth.middleware.js";

const followsRouter = Router();

followsRouter.post("/followers",validateToken, postFollowers);
followsRouter.delete("/followers/:followedId", validateToken, deleteFollowers);
followsRouter.get("/followers",validateToken, getFollowers);

export default followsRouter;