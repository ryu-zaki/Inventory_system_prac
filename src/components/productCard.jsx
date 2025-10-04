import React from 'react'; 
import ProductModal from './ProductModal';

const ProductCard = ({ data }) => {
    
    const [viewModal, setViewModal] = React.useState(false);
    const [productInfo, setProductInfo] = React.useState(data);

    return (
        <>
        {
            !!viewModal && <ProductModal setViewModal={setViewModal} productInfo={productInfo} />
        }
        
        <div className="product_card shadow-[0px_5px_15px_rgba(0,0,0,0.35)] p-2 rounded-xl">
            <div className="bg-[#D9A05B] rounded-lg relative p-4">
                <div onClick={() => setViewModal(prev => !prev)} className="p-2 z-10 border-white border-2 w-fit absolute top-2 right-2 cursor-pointer rounded-full hover:scale-[1.15] transition-all">
                   <img className="w-3" src={"/assets/arrow-up-right.png"} alt={""} />
                </div>
              
              <img className="w-[400px] product_img" src={`/assets/${productInfo.product_name.toLowerCase()}.png`} alt={""} />    
            </div>

            <div className="mt-5 flex justify-between p-2 pt-0">
                <h3 className="font-bold product_texts">{productInfo.product_name}</h3>
                <p className="product_texts">{productInfo.base_price}</p>
            </div>
        </div>
        </>
        
    )
}

export default ProductCard;