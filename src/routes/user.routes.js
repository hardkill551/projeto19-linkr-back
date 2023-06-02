import { Router } from "express";
import { getUser, signIn, signUp } from "../controllers/user.controllers.js";
import { loginSchema, signUpSchema } from "../schemas/user.schemas.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";

const userRoutes = Router()

userRoutes.get("/users/:letters", getUser);
userRoutes.post("/signup", validateSchema(signUpSchema), signUp)
userRoutes.post("/signin", validateSchema(loginSchema), signIn)
export default userRoutes;

