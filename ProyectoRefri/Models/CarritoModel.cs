using System.ComponentModel.DataAnnotations;

namespace ProyectoRefri.Models
{
    public class CarritoModel
    {
        [Required]public int IdDetalleCarrito { get; set; }
        [Required]public int idCarrito { get; set; }
        [Required]public ProductoModel? idProducto { get; set; }
        [Required]public int cantidad { get; set; }
        [Required]public decimal precioTotal { get; set; }
    }
}
