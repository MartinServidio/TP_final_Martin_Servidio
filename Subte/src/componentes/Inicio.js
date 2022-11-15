import React from 'react';
import fotoIncio from '../imagenes/logo.png';

function Inicio(){
    return (
        <div className='contenedor_inicio'>
            <img src={fotoIncio} className='imagen-inicio'  alt='Foto de inicio'/>
        </div>
    );
}
export default Inicio;