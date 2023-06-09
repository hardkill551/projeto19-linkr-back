import joi from "joi";

export const shareSchema = joi.object({
    postId: joi.number().required(),
})