import { Food } from '../schema/Food';
import { Image } from '../schema/Image';
import path from 'path';

interface FoodInput {
    foodName: string;
    description: string;
    price: number;
    category: string;
}

export const addFood = async (foodData: FoodInput, imageFile: Express.Multer.File) => {
    try {
        const image = new Image({
            filename: imageFile.filename,
            url: path.join('uploads', imageFile.filename),
        });

        const savedImage = await image.save();
        const newFood = new Food({
            foodName: foodData.foodName,
            description: foodData.description,
            price: foodData.price,
            category: foodData.category,
            image: savedImage._id,
        });

        await newFood.save();
    } catch (error) {
        console.error(error);
        throw error; 
    }
};
export const getAllFood = async () => {
    try {
        const foodData = await Food.find().populate('image');
        return foodData;
    } catch (error) {
        console.error(error);
        throw error; 
    }
};
export const searchedFoodItems = async (keyword:string) => {
    try {
        console.log(keyword);
        if (!keyword) {
            const allFoods = await Food.find().populate('image'); 
            return allFoods
        }
        const regex = new RegExp(keyword as string, 'i');
        const foods = await Food.find({
            $or: [
                { foodName: regex },
                { description: regex },
                { category: regex }
            ]
        }).populate('image');
        return foods;
    } catch (error) {
        console.error(error);
        throw error; 
    }
};
export const catFoodItems = async (category:string) => {
    try {
        console.log(category);
        if (!category) {
            throw new Error('Invalid category');
        }
        const catFoods = await Food.find({category: category}).populate('image');
        return catFoods;
    } catch (error) {
        console.error(error);
        throw error; 
    }
};
