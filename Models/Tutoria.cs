using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Parcial_Tutores.Models
{
    public class Tutoria
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string NombreCatedratico { get; set; }
        public string NombreFacultad { get; set; }
        public string NombreCarrera { get; set; }
        public string NombreMateria { get; set; }
        public string DiaClase { get; set; }
        public string HorarioClase { get; set; }
    }
}