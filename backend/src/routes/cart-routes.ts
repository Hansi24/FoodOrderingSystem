import { Router } from 'express';
import { addToCartHandler, getCartHandler, clearCartHandler, clearItemCartHandler } from '../endpoint/cart-ep';

const router = Router();

// Add items to the cart
router.post('/add', addToCartHandler);

// Get Cart by userId
router.get('/items', getCartHandler);

// Clear Cart
router.delete('/clear', clearCartHandler);

router.delete('/clear/item', clearItemCartHandler);

export default router;
