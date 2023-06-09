import { Router } from "express";
import { getTrending, getPostsByHashtag } from "../controllers/hashtag.controller.js";
import { validateToken } from "../middlewares/auth.middleware.js";

const tagRouter = Router();

tagRouter.get("/trending", validateToken, getTrending);
tagRouter.get("/hashtag/:hashtag/:limit", validateToken, getPostsByHashtag);

export default tagRouter;
