﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TutoresEntities : DbContext
    {
        public TutoresEntities()
            : base("name=TutoresEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Carreras> Carreras { get; set; }
        public virtual DbSet<Maestros> Maestros { get; set; }
        public virtual DbSet<Materias> Materias { get; set; }
        public virtual DbSet<Rol_BD> Rol_BD { get; set; }
        public virtual DbSet<Rol_Servidor> Rol_Servidor { get; set; }
        public virtual DbSet<Tipo_Usuario> Tipo_Usuario { get; set; }
        public virtual DbSet<Tutor> Tutor { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<Usuario_Rol_BD> Usuario_Rol_BD { get; set; }
        public virtual DbSet<Usuario_Rol_Servidor> Usuario_Rol_Servidor { get; set; }
    }
}