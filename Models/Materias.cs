//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Parcial_Tutores.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Materias
    {
        public int IdMateria { get; set; }
        public string NombreMateria { get; set; }
        public Nullable<int> IdCarrera { get; set; }
    
        public virtual Carreras Carreras { get; set; }
    }
}
