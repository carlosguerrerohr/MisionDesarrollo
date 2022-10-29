package co.edu.unab.apirestg66.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "paciente")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PacienteModel {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)//para que sea un campo AutoIncrementado
    private int idPaciente;
    private int numeroDocumento;
    private String tipoDocumento;
    private String nombre;
    private String apellido;
    private int edad;
    private String email;
    private String contraseña;
    private int idRol;   
    private boolean estado; 
}
