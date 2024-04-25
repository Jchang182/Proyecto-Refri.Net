using System.ComponentModel.DataAnnotations;

namespace ProyectoRefri.Models
{
    public class UsuarioModel
    {
        [Required]
        [Display(Name = "Id")]
        public int idUsuario { get; set; }

        [Required]
        [Display(Name = "Nombres")]
        public string nombres { get; set; }

        [Required]
        [Display(Name = "Apellidos")]
        public string apellidos { get; set; }

        [Required]
        [Display(Name = "Email")]
        public string email { get; set; }

        [Required]
        [Display(Name = "Telefono")]
        public string telefono { get; set; }

        [Required]
        [Display(Name = "password")]
        public string contrasena { get; set; }

        [Required]
        [Display(Name = "tipo Usuario")]
        public int tipoUsuario { get; set; }

        [Required]
        [Display(Name = "estado")]
        public int estado { get; set; }

        [Required]
        [Display(Name = "idMembrecia")]
        public int idMembrecia { get; set; }



    }
}
