using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Parcial_Tutores.Models;

namespace Parcial_Tutores.Controllers
{
    public class TutoresController : Controller
    {
        // GET: Tutores
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Tutores()
        {
            Tutoria objTutor = new Tutoria();
            objTutor.Nombre = "Erick";
            objTutor.Apellido = "Garcia";
            objTutor.NombreCatedratico = "Jorge Machado";
            objTutor.NombreFacultad = "Ciencias Empresariales";
           // objTutor.NombreMateria = "Programacion II";
            objTutor.DiaClase = "Sabados";
            objTutor.HorarioClase = "8:00";
            return View(objTutor);
        }
        public ActionResult Tutor()
        {
            Tutoria objTutor = new Tutoria();
            objTutor.Nombre = Request.Form["Nombre del Tutor"].ToString();
            return View();
        }
    }
}