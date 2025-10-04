import { useState } from 'react'
import ProductCard from './components/productCard'
import {fetchRecipes} from '../fetchingMethods';
import { useProducts } from './contexts/ProductsContext';
import './App.css';
import {useGSAP} from '@gsap/react';
import gsap from 'gsap';

gsap.registerPlugin(useGSAP); 

function App() {
  const { productsInfo, setProductsInfo } = useProducts();
  const [isLoading, setIsLoading] = useState(false);

  const handleClick = async () => {
   setIsLoading(true);
   const responseData = await fetchRecipes();

   setTimeout(() => {
    
     setProductsInfo(responseData);
     setIsLoading(false);
   }, 3000);
  
  }

  useGSAP(() => {
      if (!productsInfo.length) return;


       const tl = gsap.timeline({ defaults: {
        opacity: 0,
        translateY: '1.5em'
       } });

       tl.from('.product_card', { stagger: .15 })
       .from('.product_img', { stagger: .2 }, '-=.5')
       .from('.product_texts', { stagger: .15 }, '-=1')
  }, { dependencies: [productsInfo] })

   
  return (
   <div className="border text-primary h-dvh flex justify-center items-center flex-col"> 
      <h1 className="text-6xl text-[#222] font-bold mb-5">Inventory System</h1>
       
      <div className="flex flex-col items-center">
          <h2 className="text-xl">List of available products:</h2>
          <button className={`flex justify-center cursor-pointer overflow-hidden relative border border-[#aaa] mt-10 px-6 py-1 rounded-full before:absolute before:w-3 before:aspect-square before:rounded-full before:bg-primary before:bottom-0 before:scale-0 hover:before:scale-[10] before:-z-10 before:transition-all before:duration-500 hover:text-white`} onClick={handleClick}>get list</button>

      </div>
      
      
      <div className="flex w-11/12 mx-auto gap-10 mt-10 items-start min-h-[18em] relative">
       {
         !isLoading && productsInfo.map((data, index) => {
          return <ProductCard data={data} key={index}/>
        })
      }

      {
        !!isLoading && (
          <div className="absolute w-full h-full inset-0 text-[#222] flex flex-col items-center justify-center z-[9999]">
           <p className="text-xl w-fit">Fetching information...</p>
           <div className="loader mt-5"></div> 
          </div>
        )
      }
      </div>
   </div>
 
  )
}


export default App
