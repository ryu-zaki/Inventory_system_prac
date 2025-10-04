import React from 'react';

const Dropdown = ({ data, setInitialValue }) => {

    const [isView, setIsView] =  React.useState(false);
    const [initialData, setInitialData] = React.useState({});

    return (
        <section>
            <div className="flex border-b-[#aaa] relative border-b pb-2 items-center justify-between">
               <div onClick={() => setIsView(prev => !prev)} className="absolute peer inset-0 z-10 cursor-pointer"></div>
               <p className="text-sm peer-hover:font-semibold" >{data.name}</p>
               <img className="w-5" src="angle-small-down.png" alt="" />
            </div>
            
            {
                isView && (
                   <div className="flex max-h-[8em] overflow-x-hidden overflow-y-auto flex-col gap-2 py-2">

                     {
                      (() => {
                         const props = []
                            for (let x in data) {
                              props.push(<IndividualProp setInitialValue={setInitialValue} key={x} name={x} value={data[x]} />)
                              }
                             return props
                      })()
                     }

                   </div>
                )
            }

            
        </section>
    )
}

const IndividualProp = ({name, value, setInitialValue}) => {
  
    const changeInput = ({target}) => {

    const {id, value} = target;

    setInitialValue(prev => {
      
      return {
        ...prev,
        ingredients: [ ...prev.ingredients, { [id]: value } ]
      }
    })
    
    } 

    return (
      <section className="flex justify-between mx-2 items-center relative before:absolute before:bg-[#222] before:w-full before:h-[.5px] before:-z-10">
        <p className="bg-white z-10 pr-2">{name}</p>
        
        <input onChange={changeInput} id={name} value={value} className="bg-[#eee] py-1 px-2 z-10 w-[40%] rounded-md"  />
      </section>
    )
}

export default Dropdown;