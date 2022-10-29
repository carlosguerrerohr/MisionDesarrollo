package co.edu.unab.apirestg66.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import co.edu.unab.apirestg66.models.PacienteModel;
// CRUD Create, Read, Update, Delete
@Repository
public interface PacienteRepository extends CrudRepository<PacienteModel,Integer>{
    public ArrayList<PacienteModel> findByEdadLessThan(int edad);
    public ArrayList<PacienteModel> findByApellido(String apellido);
}
