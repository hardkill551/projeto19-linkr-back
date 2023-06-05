import { Router } from "express";
import { getTrending, getTaggedPosts} from "../controllers/hashtag.controller.js";

const tagRoutes = Router();

tagRoutes.get("/trending", getTrending);
tagRoutes.get("/hashtag/:id", getTaggedPosts);

export default tagRoutes;