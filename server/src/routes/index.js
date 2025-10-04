const express = require('express');
const router = express.Router();
const recipeRoute = require('./recipes.route');

router.use('/data', recipeRoute);


module.exports = router;