const express = require('express');
const app = express();
require('dotenv').config()

const recipesRoute = require('./src/routes'); 
const cors = require('cors');
app.use(cors());
app.use(express.json());


app.use('/', recipesRoute);

app.listen(process.env.PORT, () => console.log(`server running on PORT ${process.env.PORT}`))