import { Router } from 'express';
import { registerUser, loginUser } from '../endpoint/user-ep';
import { Util } from '../utils/util';

const router = Router();

router.post('/register', Util.withErrorHandling(registerUser));
router.post('/login', Util.withErrorHandling(loginUser));

export default router;
