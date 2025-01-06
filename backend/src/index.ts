import express, { Application } from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import connectDB from './config/db';
import userRoutes from './routes/user-routes';
import morgan from 'morgan';
import bodyParser from 'body-parser';
import { Helper } from './utils/helper';
import foodRoutes from './routes/food-routes';
import cartRoutes from './routes/cart-routes';
import session from 'express-session';
import { config } from './config/config';
import orderRoutes from './routes/order-routes';


dotenv.config();
connectDB();
const app: Application = express();

app.use(cors());
app.use(express.json());
app.use(session({
  secret: config.JWT_SECRET,
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));
app.use(morgan('dev'));
app.use(bodyParser.json());
app.use('/uploads', express.static('uploads'));
app.use('/auth', userRoutes);
app.use('/api', Helper.verifyToken);
app.use('/api/food', Helper.verifyToken,  foodRoutes);
app.use('/api/cart', Helper.verifyToken, cartRoutes);
app.use('/api/order', Helper.verifyToken, orderRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
