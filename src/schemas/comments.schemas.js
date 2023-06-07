import joi from "joi";

export const commentSchema = joi.object({
    postId: joi.number().required(),
    comment: joi.string().max(120).required()
})