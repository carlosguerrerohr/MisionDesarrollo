package co.edu.unab.apirestg66.controllers;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import co.edu.unab.apirestg66.models.PacienteModel;
import co.edu.unab.apirestg66.services.PacienteService;

@RestController
@CrossOrigin(origins = "*", methods = {RequestMethod.GET,RequestMethod.POST,RequestMethod.DELETE})
@RequestMapping(path = "/paciente")
public class PacienteController {
    @Autowired
    PacienteService pacienteService;
    
@GetMapping()
  public  Iterable<PacienteModel> getAllPacientes() {
      return pacienteService.getPacientes();
  }
@GetMapping(path ="/{id}")
public Optional<PacienteModel> getPacienteById(@PathVariable("id") int id){
  return pacienteService.getPacienteById(id);
}

@PostMapping()
public String guardarPaciente(@RequestBody PacienteModel paciente){
    return pacienteService.savePaciente(paciente);
}

@DeleteMapping(path ="/{id}")
public String deletePacienteById(@PathVariable("id") int id){
  return pacienteService.deletePaciente(id);
}

@GetMapping("/query")
public ArrayList<PacienteModel> obtenerPacientePorApellido(@RequestParam("apellido") String apellido){
    return pacienteService.getPacientesByApellido(apellido);
 
}

@GetMapping("edad/query")
public ArrayList<PacienteModel> obtenerPacientesMenoresQue(@RequestParam("edad") int edad ){
    return pacienteService.getPacientesEdadMenorQue(edad);
 
}


}
