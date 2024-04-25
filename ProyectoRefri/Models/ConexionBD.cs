using System;
using System.Configuration;
using System.Data.SqlClient;

using Microsoft.Data.SqlClient;

namespace ProyectoRefri.Models
{
    public class ConexionBD
    {
        private readonly string connectionString;

        public ConexionBD()
        {
            this.connectionString = ObtenerCadenaConexion();
        }

        private string ObtenerCadenaConexion()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
            return connectionString;
        }

        public void Conectar()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    Console.WriteLine("Conexión exitosa a la base de datos");
                    // Aquí puedes realizar operaciones con la base de datos
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error al conectar a la base de datos: " + ex.Message);
                }
            }
        }
    }
}