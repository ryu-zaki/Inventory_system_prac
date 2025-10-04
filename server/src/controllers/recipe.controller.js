const recipeServices = require('../services/recipeServices.service');

const getRecipes = async (req, res) => {

    try {
       
       const result = await recipeServices.findRecipes();
       res.json(result);
    }

    catch(err) {
        console.error(err.message);
    }
}

module.exports = { getRecipes }