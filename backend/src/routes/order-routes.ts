import { Router } from 'express';
import { placeOrder } from '../endpoint/order-ep';

const router = Router();

// Create a new order (POST /order)
router.post('/order-place', placeOrder);

export default router;
