import { Router } from "express";
import { validateToken } from "../middlewares/auth.middleware.js";
import { shareSchema } from "../schemas/share.schemas.js";
import { sharePost } from "../controllers/share.controller.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";

const shareRoutes = Router()

shareRoutes.post("/share", validateToken, validateSchema(shareSchema), sharePost);

export default shareRoutes;

