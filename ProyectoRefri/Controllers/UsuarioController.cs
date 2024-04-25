using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.IdentityModel.Tokens;
using ProyectoRefri.Models;
using System.Data;

namespace ProyectoRefri.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly IConfiguration _confi;

        public UsuarioController(IConfiguration confi)
        {
            _confi = confi;
        }


        int generarId() { 
            int id = 0;
            string connection = _confi["ConnectionStrings:cn"];
            SqlConnection cn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("usp_GenerarCodigo", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cn.Open();
            SqlDataReader dr  =  cmd.ExecuteReader();

            if (dr.Read())
            { 
                id = dr.GetInt32(0);
            }
            cn.Close();
            return id;
        }


        UsuarioModel  generarId(int id)
        {
            UsuarioModel usu = new UsuarioModel();
            string connection = _confi["ConnectionStrings:cn"];
            SqlConnection cn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("usp_BuscarUsuario", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idUsuario", id);
            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                id = dr.GetInt32(0);
            }
            cn.Close();
            return usu;
        }

        // GET: UsuarioController
        public ActionResult Index()
        {
            return View();
        }

        // GET: UsuarioController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        public ActionResult IniciarSesion()
        {
            return View();
        }
        public ActionResult Actualizar()
        {
            return View();
        }
        UsuarioModel Buscar(int id)
        {

            return null;
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult IniciarSesion(UsuarioModel usuReg)
        {
            string connection = _confi["ConnectionStrings:cn"];
            SqlConnection cn = new SqlConnection(connection);
            try
            {
                if (string.IsNullOrEmpty(usuReg.email) || string.IsNullOrEmpty(usuReg.contrasena))
                {
                    ModelState.AddModelError("","Ingrese su email y contraseña");
                }
                else
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("usp_ValidarUsuario", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Correo",usuReg.email);
                    cmd.Parameters.AddWithValue("@Contraseña", usuReg.contrasena);

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        HttpContext.Session.SetString("usuario", usuReg.idUsuario.ToString());
                        //Session["Usuario"] = usuReg;
                        return RedirectToAction("ListarCliente" , "Producto");
                    }
                }
            }
            catch
            {
                ModelState.AddModelError("", "Datos Ingresados No Validos");
            }
            finally { 
                cn.Close(); 
            }
            return RedirectToAction(nameof(IniciarSesion));
        }

        // GET: UsuarioController/Create
        public ActionResult Registrar()
        {   
            UsuarioModel usuario = new UsuarioModel();
            usuario.idUsuario = generarId();
            return View(usuario);
        }

        // POST: UsuarioController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Registrar(UsuarioModel usuario)
        {
            string connection = _confi["ConnectionStrings:cn"];
            SqlConnection cn = new SqlConnection(connection);
            string repuesta = string.Empty;
            try
            {
                SqlCommand cmd = new SqlCommand("usp_RegistrarUsuario", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idUsuario", usuario.idUsuario);
                cmd.Parameters.AddWithValue("@Nombre", usuario.nombres);
                cmd.Parameters.AddWithValue("@Apellidos", usuario.apellidos);
                cmd.Parameters.AddWithValue("@Email", usuario.email);
                cmd.Parameters.AddWithValue("@Telefono", usuario.telefono);
                cmd.Parameters.AddWithValue("@Contrasena", usuario.contrasena);
                cmd.Parameters.AddWithValue("@TipoUsuario", 1) ;
                cmd.Parameters.AddWithValue("@estado",1);
                cmd.Parameters.AddWithValue("@idMembrecia",1);
                cn.Open();
                int i  = cmd.ExecuteNonQuery();

                repuesta = string.Format("se ha insertado {0} productos " , i);
                
                return RedirectToAction(nameof(IniciarSesion));
            }
            catch
            {
                return View();
            }finally
            { cn.Close(); }

        }

    }
}
