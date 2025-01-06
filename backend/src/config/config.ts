import dotenv from 'dotenv';

// Load environment variables from .env file
dotenv.config();

// Interface for our configuration to ensure type safety
interface Config {
    JWT_SECRET: string;
    JWT_EXPIRES_IN: string;
    DB_URI: string;
    PORT: number;
}

// Get environment variables, and assign default values if missing
const config: Config = {
    JWT_SECRET: process.env.JWT_SECRET || '11', // Provide default in case variable is missing
    JWT_EXPIRES_IN: process.env.JWT_EXPIRES_IN || '1h',
    DB_URI: process.env.DB_URI || 'mongodb://127.0.0.1:27017/food-delivery-system',
    PORT: process.env.PORT ? parseInt(process.env.PORT) : 5000, // Default port is 5000
};

// Export the config object to be used in other files
export { config };
