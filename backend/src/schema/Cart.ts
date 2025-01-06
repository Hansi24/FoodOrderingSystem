import mongoose, { Schema, model, Document, Types } from 'mongoose';

// Cart Item Interface
export interface ICartItem {
    foodId: Types.ObjectId; // Reference to Food model
    qty: number;            // Quantity of the food item
}

// Cart Interface
export interface ICart extends Document {
    userId: Types.ObjectId;   // Reference to User model
    items: ICartItem[];       // List of food items
    createdAt: Date;
    updatedAt: Date;
}

// Cart Item Schema
const cartItemSchema = new Schema<ICartItem>({
    foodId: { type: Schema.Types.ObjectId, ref: 'Food', required: true },
    qty: { type: Number, required: true, min: 1 },
});

// Cart Schema
const cartSchema = new Schema<ICart>(
    {
        userId: { type: Schema.Types.ObjectId, ref: 'User', required: true },
        items: [cartItemSchema], // Array of cart items
    },
    {
        timestamps: true, // Automatically add createdAt and updatedAt
    }
);

const Cart = model<ICart>('Cart', cartSchema);

export default Cart;
