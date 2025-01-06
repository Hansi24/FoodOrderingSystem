import { NextFunction, Request, Response } from 'express';
import { createUser, login } from '../dao/user-dao';
import { Util } from '../utils/util';

// Create new user
export const registerUser = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    const { name, email, password, phoneNumber, address } = req.body;

    try {
        const credentialDetails = await createUser({ name, email, password, phoneNumber, address });
        return Util.sendSuccess(res, credentialDetails, "user registered successfully");
    } catch (error) {
        next(error);
    }
};
export const loginUser = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    const { email, password } = req.body;
    try {
        const credentialDetails = await login({  email, password });
        return Util.sendSuccess(res, credentialDetails, "user login successfully");
    } catch (error) {
        next(error);
    }
};


