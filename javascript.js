function loadPacientes() {
    const options = { method: 'GET' };
    fetch('http://localhost:8080/paciente', options)
        .then(response => response.json())
        .then(response => {
            let tbody = "";
            for (let index = 0; index < response.length; index++) {
                const element = response[index];
                tbody += `<tr>
            <td>${element.idPaciente}</td>
            <td>${element.nombre}</td>
            <td>${element.apellido}</td>
            <td>${element.tipoDocumento}</td>
            <td>${element.numeroDocumento}</td>
            <td>${element.edad}</td>
            <td>${element.email}</td>
            <td><button class="btn btn-danger" onclick="eliminarPaciente(${element.idPaciente})">Eliminar</button></td>
            <td><button class="btn btn-success" onclick="editarPaciente(${element.idPaciente})">Editar</button></td>
            </tr>`
            } document.getElementById("contenido").innerHTML = tbody;
        })
        .catch(err => console.error(err));
}

function eliminarPaciente(id) {
    if (confirm("Seguro de eliminar?")) {
        const options = { method: 'DELETE' };
        fetch('http://localhost:8080/paciente/' + id, options)
            .then(response => {
                loadPacientes();
            })
            .catch(err => console.error(err));
    }

}

function guardarPaciente() {
    let idPaciente=document.getElementById("idPaciente").value;
    let nombre = document.getElementById("nombre").value;
    let apellido = document.getElementById("apellido").value;
    let tipoDocumento = document.getElementById("tipoDocumento").value;
    let email = document.getElementById("email").value;
    let numeroDocumento = document.getElementById("numeroDocumento").value;
    let edad = document.getElementById("edad").value;
    let estado=true;

    const options = {
        method: 'POST',
        headers: { "Content-type": "application/json" },
        body: JSON.stringify({idPaciente, nombre, apellido, tipoDocumento, numeroDocumento,edad, email, estado})
    };

    fetch('http://localhost:8080/paciente', options)
        //.then(response => response.json())
        .then(response => { loadPacientes(); alert("Guardado!");borrarFormulario();
    })
        .catch(err => console.error(err));
}



function editarPaciente(id){
    const options = {method: 'GET'};

fetch('http://localhost:8080/paciente/'+id, options)
  .then(response => response.json())
  .then(response => {
    
    document.getElementById("nombre").value=response.nombre;
    document.getElementById("apellido").value=response.apellido;
    document.getElementById("tipoDocumento").value = response.tipoDocumento;
    document.getElementById("email").value = response.email;
    document.getElementById("numeroDocumento").value = response.numeroDocumento;
    document.getElementById("edad").value = response.edad;
    document.getElementById("idPaciente").value=response.idPaciente;
  })
  .catch(err => console.error(err));
}
const borrarFormulario=() =>{
    document.getElementById("nombre").value="";
    document.getElementById("apellido").value="";
    document.getElementById("tipoDocumento").value ="";
    document.getElementById("email").value = "";
    document.getElementById("numeroDocumento").value = "";
    document.getElementById("edad").value = "";
    document.getElementById("idPaciente").value="";
}

loadPacientes();

