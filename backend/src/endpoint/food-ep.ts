import { Request, Response, NextFunction } from 'express';
import { addFood, catFoodItems, getAllFood, searchedFoodItems } from '../dao/food-dao';  // Function that adds food to DB
import { Util } from '../utils/util';
import { IFood } from '../schema/Food';

export const addFoodItem = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    const { foodName, description, price, category } = req.body;
    const imageFile = req.file;
    try {
        if (!imageFile) {
            throw new Error('Image file is required');
        }
        const foodItem = await addFood({ foodName, description, price, category }, imageFile);
        return Util.sendSuccess(res, foodItem, 'Food item added successfully');
    } catch (error) {
        next(error);
    }
};
export const getAllFoodItem = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
        const foodItem:IFood[] = await getAllFood();
        return Util.sendSuccess(res, foodItem, 'Food item added successfully');
    } catch (error) {
        next(error);
    }
};

export const searchFood = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const keyword = req.query.keyword as string;
        const searchFoodItems = await searchedFoodItems(keyword);
        Util.sendSuccess(res, searchFoodItems, 'Food items searched successfully');
    } catch (error) {
        next(error);
    }
};
export const catFood = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const category = req.query.cat as string;
        const catFoods = await catFoodItems(category);
        Util.sendSuccess(res, catFoods, 'Food items list by category');
    } catch (error) {
        next(error);
    }
};