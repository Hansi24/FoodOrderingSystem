import { Request, Response, NextFunction } from 'express';
import { addToCart, getCartByUserId, clearCart, clearFoodItemInsideCard } from '../dao/cart-dao';
import { Util } from '../utils/util'; // Utility helper for response handling

// Add Items to Cart
export const addToCartHandler = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const userId = req.user.userId;
        console.log(userId);
        if(!userId){
            throw new Error('User not found');
        } // Cart ID (user's cart or session-based cart)
        const { items } = req.body; // Array of { foodId, qty }

        const cart = await addToCart(userId, items);
        return Util.sendSuccess(res, cart, 'Items added to cart successfully');
    } catch (error) {
        next(error);
    }
};

// Get Cart by userId
export const getCartHandler = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const userId = req.user.userId; // Get userId from URL params
        const cart = await getCartByUserId(userId);
        return Util.sendSuccess(res, cart, 'Cart retrieved successfully');
    } catch (error) {
        next(error);
    }
};

// Clear Cart
export const clearCartHandler = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const userId = req.body.userId; 
        await clearCart(userId);
        return Util.sendSuccess(res, null, 'Cart cleared successfully');
    } catch (error) {
        next(error);
    }
};
// Clear item inside Cart
export const clearItemCartHandler = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const userId = req.body.userId; 
        const foodId = req.body.foodId; 
        await clearFoodItemInsideCard(userId, foodId);
        return Util.sendSuccess(res, null, 'inside card item cleared successfully');
    } catch (error) {
        next(error);
    }
};
