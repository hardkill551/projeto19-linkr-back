import joi from "joi";

export const likesSchema = joi.object({
    postId: joi.number().required(),
    userId: joi.number().required()
})