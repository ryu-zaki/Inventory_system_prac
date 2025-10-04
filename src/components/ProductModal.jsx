import Dropdown from "./Dropdown";
import React from 'react'

const ProductModal = ({productInfo}) => {

    const [initialValue, setInitialValue] = React.useState(productInfo);


    const hanldeChangeInput = ({target}) => {
       const {id, value} = target;

       setInitialValue(prev => {

        return ({...prev, [id]: value})
       })
    }

    console.log(initialValue)


    return (
        <>
         <div onClick={() => setViewModal(false)} className="z-20 fixed inset-0 bg-[rgba(0,0,0,0.5)]"></div>
         
         <div className="w-full max-w-[46em] bg-white fixed top-1/2 left-1/2 z-20 -translate-y-1/2 -translate-x-1/2 flex overflow-hidden rounded-xl">
            <section className="flex-1">
              <div className="p-7 h-full flex flex-col justify-between">
                <div className="flex justify-between items-center">
                <img className="w-6" src="angle-left.png" alt="" />
                <img className="border-primary rounded-full p-2 border-2 w-8" src="heart.png" alt="" />
              </div>

              <div className="mx-auto flex-1 relative before:absolute before:w-full before:bottom-14 before:left-0 before:bg-linear-to-t before:from-[#fff] before:to-[rgba(0,0,0,0.0)] before:h-[7em]">
                <img className="w-full" src={"assets/latte.png"} alt="" />
              </div>

              <p className="text-sm font-semibold">Estimated products: 200 servings</p>
              </div>
            </section>
            
            <section className="flex-1 shadow-[0px_5px_15px_rgba(0,0,0,0.35)] flex flex-col justify-between pb-10 box-border">
                <div className="bg-[#F5E6D3] p-5">
                  <h2 className="text-2xl font-bold">{initialValue.product_name}</h2>
                  <p className="text-sm">Hot coffee</p>
                </div>

                <div className="p-5">
                    <div className="flex gap-5 mb-5">
                        <div className="flex-1 flex-col">
                            <label className="text-sm">Product Name:</label>
                            <input id="product_name" onChange={hanldeChangeInput} value={initialValue.product_name} className="w-full mt-2 border border-primary rounded-md py-1 px-2" />
                        </div>

                        <div className="flex-1 flex-col">
                            <label className="text-sm">Base price:</label>
                            <input id="base_price" onChange={hanldeChangeInput} value={initialValue.base_price} className="w-full py-1 px-2 mt-2 rounded-md border border-primary" />
                        </div>
                    </div> 
                     
                    
                    <div className="flex flex-col gap-4 overflow-y-auto max-h-[12em]">
                     <p className="text-sm font-bold text-gray-600">Ingredients:</p>
                     {
                      initialValue.ingredients.map((data, index) => {
                           return <Dropdown setInitialValue={setInitialValue} index={index} data={data} key={index} />
                      })
                     }

                     <p className="text-sm font-bold text-gray-600">Packaging:</p>
                     {
                      initialValue.packaging.map((data, index) => {
                           return <Dropdown setInitialValue={setInitialValue} index={index} data={data} key={index} />
                      })
                     }


                    </div>
                </div>

                <div className="flex text-sm font-semibold gap-2 items-center justify-end pr-7">
                    <button className="border text-[#CD9D00] cursor-pointer px-7 rounded-md py-1 border-[#CD9D00]">Cancel</button>
                    <button  className="px-7 rounded-md py-1 cursor-pointer text-white bg-[#CD9D00]">Save</button>
                </div>
            </section>
         </div>
        </>
    )
}

export default ProductModal;