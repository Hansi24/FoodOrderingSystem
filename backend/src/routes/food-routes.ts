import { Router } from 'express';
import { Util } from '../utils/util';
import { addFoodItem, catFood, getAllFoodItem, searchFood } from '../endpoint/food-ep';
import { Helper } from '../utils/helper';
import upload from '../utils/multerMiddleware';

const router = Router();

router.post('/add-food', Helper.verifyToken, upload.single('image'), Util.withErrorHandling(addFoodItem));
router.get('/all-food', Helper.verifyToken, Util.withErrorHandling(getAllFoodItem));
router.post('/search-food', Helper.verifyToken, Util.withErrorHandling(searchFood));
router.post('/cat-food', Helper.verifyToken, Util.withErrorHandling(catFood));
export default router;
