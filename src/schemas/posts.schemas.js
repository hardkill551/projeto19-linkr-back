import joi from "joi";

export const postSchema = joi.object({
    link: joi.string().required(),
    message: joi.string().max(120).allow('')
})
export const updateSchema = joi.object({
    id:joi.number().required(),
    description: joi.string().required()
})