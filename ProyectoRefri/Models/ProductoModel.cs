using System.ComponentModel.DataAnnotations;

namespace ProyectoRefri.Models
{
    public class ProductoModel
    {
        [Required][Display (Name ="Id")]
        public string idProducto{get;set;}
        [Required][Display(Name = "Nombre")]
        public string nombre { get; set; }
        [Required][Display(Name = "Precio")]
        public float precio { get; set; }
        [Required][Display(Name = "Stock")]
        public Int32 stock { get; set; }
        [Display(Name = "Descripcion")]
        public string descripcion { get; set; }
        [Required][Display(Name = "Imagen")]
        public string imagen { get; set; }
        [Display(Name = "Estado")]
        public int estado { get; set; }


    }
}
