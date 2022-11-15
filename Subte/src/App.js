import './App.css';
import Inicio from './componentes/Inicio.js';


function App() {
  return (
    <div className='App'>
      <div className='Principio'>
        <Inicio/>
        <h1>Bienvenido a GLS</h1>
        <h2>Para empezar incie sesión</h2>
        <button type="button" class="btn btn-outline-warning" onClick={"exampleModal"}>Usuario</button>
          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  ...
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary">Save changes</button>
                </div>
              </div>
            </div>
          </div>
        <button type="button" class="btn btn-outline-warning">Administrador</button>
      </div>
    </div>
  );
}

export default App;
