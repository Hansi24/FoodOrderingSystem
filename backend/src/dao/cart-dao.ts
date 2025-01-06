import { Types } from 'mongoose';
import Cart, { ICartItem } from '../schema/Cart';

// Add Items to Cart (POST)
export const addToCart = async (userId: Types.ObjectId, items: { foodId: string; qty: number }[]) => {
    try {
        let cart = await Cart.findOne({ userId });

        if (!cart) {
            const convertedItems = items.map((item) => ({
                foodId: new Types.ObjectId(item.foodId),
                qty: item.qty
            }));

            cart = new Cart({ userId, items: convertedItems });
        } else {
            items.forEach((item) => {
                const foodItemId = new Types.ObjectId(item.foodId);

                const existingItem = cart?.items.find((i) => i.foodId.toString() === foodItemId.toString());

                if (existingItem) {
                    existingItem.qty += item.qty;
                } else {
                    cart?.items.push({ foodId: foodItemId, qty: item.qty });
                }
            });
        }
        await cart.save();
        return cart;
    } catch (error) {
        throw error;
    }
};

// Get Cart by Cart ID (GET)
export const getCartByUserId = async (userId: Types.ObjectId) => {
    try {
        const cart = await Cart.findOne({ userId }).populate('items.foodId'); // Populate food details
        return cart;
    } catch (error) {
        throw error;
    }
};

// Clear Cart (DELETE)
export const clearCart = async (userId: string) => {
    try {
        const cart = await Cart.findOneAndDelete({ userId });
        return cart;
    } catch (error) {
        throw error;
    }
};

// Clear item inside Cart (DELETE)
export const clearFoodItemInsideCard = async (userId: string, foodId: string) => {
    try {
        const foodObjectId = new Types.ObjectId(foodId);
        const cart = await Cart.findOneAndUpdate(
            { userId },
            { $pull: { items: { foodId: foodObjectId } } }, 
            { new: true } 
        );

        if (!cart) {
            throw new Error("Cart not found");
        }

        return cart; 
    } catch (error) {
        throw error;
    }
};
