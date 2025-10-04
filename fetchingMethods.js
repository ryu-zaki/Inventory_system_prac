
const fetchRecipes = async () => {

     try {
      const data = await fetch('http://localhost:3001/data/all-recipes');
      const json = await data.json();
      
      return json;
    }

    catch(err) {
      console.log(err.message);
      
    }

}

export {fetchRecipes};