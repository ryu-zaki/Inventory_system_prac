const organizedTable= (data) => {

    const organizedData  =  
           data.reduce((acc, item) => {
             if (!acc[item.product_name]) {
               acc[item.product_name] = {
                 product_name: item.product_name,
                 recipe_id: item.recipe_id,
                 base_price: item.base_price,
                 ingredients: [],
                 packaging: [],
                 syrup: [] // prepare category
               };
             }
             // classify into category
             const entry = {
               item_id: item.item_id,
               name: item.name,
               quantity: item.quantity,
               unit: item.unit,
               stock_quantity: item.stock_quantity,
               reorder_level: item.reorder_level
             };
         
             if (item.category === 'Ingredient') {
               acc[item.product_name].ingredients.push(entry);
             } else if (item.category === 'Packaging') {
               acc[item.product_name].packaging.push(entry);
             } else if (item.category === 'Syrup') {
               acc[item.product_name].syrup.push(entry);
             }
         
             return acc;
           }, {});

    return Object.values(organizedData);

}



module.exports = organizedTable;