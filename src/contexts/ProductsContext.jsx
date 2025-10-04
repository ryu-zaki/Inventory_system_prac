import React from 'react';

const ComponentContext = React.createContext();


const ProductContext = ({ children }) => {
    
    const [productsInfo, setProductsInfo] = React.useState([]);
    
    const changeProductInfo = ({ target }, recipeID) => {

        const {id: inputID} = target;  

        setProductsInfo(prev => {
            const obj = prev.find((value) => value.recipe_id === recipeID);
            
            return 
        })
          
    }
    
    return ( 
        <ComponentContext.Provider value={{ productsInfo, setProductsInfo }}>
           {
             children
           }
        </ComponentContext.Provider>
    )
}

export const useProducts = () => {

    return React.useContext(ComponentContext);
};

export default ProductContext;