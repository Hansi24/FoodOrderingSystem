import { Schema, model, Document, Types } from 'mongoose';
import { ObjectId } from 'mongodb';

export interface IFood extends Document {
    _id: Types.ObjectId;  // Unique ID for each food item
    foodName: string;
    description: string;
    price: number;
    category: string;
    image: Types.ObjectId;  // Reference to Image collection
}

const foodSchema = new Schema<IFood>({
    foodName: { type: String, required: true },
    description: { type: String, required: true },
    price: { type: Number, required: true },
    category: { type: String, required: true },
    image: { type: Schema.Types.ObjectId, ref: 'Image', required: true },  // Reference the Image model
}, {
    timestamps: true,  // Automatically add createdAt and updatedAt fields
});

export const Food = model<IFood>('Food', foodSchema);
