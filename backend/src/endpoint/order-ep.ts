import { Request, Response, NextFunction } from 'express';
import { Food } from '../schema/Food';
import { addOrder } from '../dao/order-dao';
import { Util } from '../utils/util';

export const placeOrder = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    const { userId, foods } = req.body;

    try {
        let totalPrice = 0;
        for (const foodItem of foods) {
            const food = await Food.findById(foodItem.foodId);
            if (!food) {
                throw new Error(`Food item with id ${foodItem.foodId} not found`);
            }
            totalPrice += food.price * foodItem.qty; 
        }
        const order = await addOrder(userId, foods, totalPrice);
        return Util.sendSuccess(res, order,'Order placed successfully' )
    } catch (error) {
        next(error);
    }
};
