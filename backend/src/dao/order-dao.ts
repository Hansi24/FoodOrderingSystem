
import { Types } from 'mongoose';
import Order from '../schema/Order';

export const addOrder = async (userId: Types.ObjectId, foods: { foodId: Types.ObjectId; qty: number }[], totalPrice: number) => {
    try {
        const newOrder = new Order({
            userId,
            foods,
            totalPrice,
        });
        await newOrder.save();
        return newOrder;
    } catch (error) {
        throw error;
    }
};
