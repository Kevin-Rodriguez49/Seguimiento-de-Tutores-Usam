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
    
    public partial class Maestros
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Maestros()
        {
            this.Carreras = new HashSet<Carreras>();
        }
    
        public int IdMaestro { get; set; }
        public string NombreMaestro { get; set; }
        public string Facultad { get; set; }
        public Nullable<int> IdTutor { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Carreras> Carreras { get; set; }
        public virtual Tutor Tutor { get; set; }
    }
}
