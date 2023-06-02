import { Router } from "express";
import { getUser } from "../controllers/user.controllers.js";

const userRoutes = Router()

userRoutes.get("/users/:letters", getUser);

export default userRoutes;