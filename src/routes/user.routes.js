import { Router } from "express";
import { confirmSession, getUser, signIn, signUp } from "../controllers/user.controllers.js";
import { loginSchema, signUpSchema } from "../schemas/user.schemas.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { validateToken } from "../middlewares/auth.middleware.js";

const userRoutes = Router()

userRoutes.get("/users/:letters",validateToken, getUser);
userRoutes.post("/signup", validateSchema(signUpSchema), signUp)
userRoutes.post("/signin", validateSchema(loginSchema), signIn)
userRoutes.post("/token", validateToken, confirmSession)
export default userRoutes;

