package co.edu.unab.apirestg66.services;


import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.edu.unab.apirestg66.models.PacienteModel;
import co.edu.unab.apirestg66.repositories.PacienteRepository;

@Service
public class PacienteService {
    @Autowired
    PacienteRepository pacienteRepository;

    public Iterable<PacienteModel> getPacientes(){
        return  pacienteRepository.findAll();
    }

    public Optional<PacienteModel> getPacienteById(int id){
        return pacienteRepository.findById(id);
    }

    //el metodo "save" guarda o actualiza dependiendo de la existencia del Id en la tabla
    public String savePaciente(PacienteModel paciente){

        if(pacienteRepository.existsById(paciente.getIdPaciente())){  
            pacienteRepository.save(paciente);          
            return "Paciente Actualizado";
        }else{
            pacienteRepository.save(paciente);
            return "Paciente Guardado";
        }
       
    }

    public String deletePaciente(int id){
        try {
            pacienteRepository.deleteById(id);
            return "Borrado con exito";
        } catch (Exception e) {
            return "error";
        }
    }

    public ArrayList<PacienteModel> getPacientesEdadMenorQue(int edad){
        return pacienteRepository.findByEdadLessThan(edad);
    }

    public ArrayList<PacienteModel>getPacientesByApellido(String apellido){
        return pacienteRepository.findByApellido(apellido);
    }
}
