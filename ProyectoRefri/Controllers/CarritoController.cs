using Microsoft.AspNetCore.Mvc;

namespace ProyectoRefri.Controllers
{
    public class CarritoController : Controller
    {
        private readonly IConfiguration _confi;

        public CarritoController(IConfiguration confi)
        {
            _confi = confi;
        }

        public ActionResult ListarCarrito() 
        {
            return View();
        }

        public IActionResult Index()
        {
            return View();
        }
    }
}
