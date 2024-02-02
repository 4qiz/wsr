using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using RegistrationWebApp.Models;

namespace RegistrationWebApp.Data;

public partial class ApplicationDbContext : DbContext
{
    public ApplicationDbContext()
    {
    }

    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Doctor> Doctors { get; set; }

    public virtual DbSet<Hospitalization> Hospitalizations { get; set; }

    public virtual DbSet<InsurancePolicy> InsurancePolicies { get; set; }

    public virtual DbSet<MedicalCard> MedicalCards { get; set; }

    public virtual DbSet<Patient> Patients { get; set; }

    public virtual DbSet<RegistrationStaff> RegistrationStaffs { get; set; }

    public virtual DbSet<Schedule> Schedules { get; set; }

    public virtual DbSet<Therapy> Therapies { get; set; }

    public virtual DbSet<TherapyRecipe> TherapyRecipes { get; set; }

    public virtual DbSet<TherapyResult> TherapyResults { get; set; }

    public virtual DbSet<TherapyType> TherapyTypes { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=LAKE\\SQLEXPRESS;Initial Catalog = MisChampionship;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Doctor>(entity =>
        {
            entity.HasKey(e => e.DoctorId).HasName("PK_Doctor_1");

            entity.ToTable("Doctor");

            entity.Property(e => e.DoctorId).ValueGeneratedNever();
            entity.Property(e => e.Specialization).HasMaxLength(200);

            entity.HasOne(d => d.DoctorNavigation).WithOne(p => p.Doctor)
                .HasForeignKey<Doctor>(d => d.DoctorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Doctor_User");
        });

        modelBuilder.Entity<Hospitalization>(entity =>
        {
            entity.ToTable("Hospitalization");

            entity.HasIndex(e => e.HospitalizationCode, "UQ_Hospitalization").IsUnique();

            entity.Property(e => e.Department).HasMaxLength(100);
            entity.Property(e => e.EndDate).HasColumnType("datetime");
            entity.Property(e => e.Goal).HasMaxLength(500);
            entity.Property(e => e.HospitalizationCode).HasMaxLength(50);
            entity.Property(e => e.Price).HasColumnType("decimal(15, 2)");
            entity.Property(e => e.StartDate).HasColumnType("datetime");

            entity.HasOne(d => d.MedicalCard).WithMany(p => p.Hospitalizations)
                .HasForeignKey(d => d.MedicalCardId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Hospitalization_MedicalCard");
        });

        modelBuilder.Entity<InsurancePolicy>(entity =>
        {
            entity.ToTable("InsurancePolicy");

            entity.Property(e => e.Company).HasMaxLength(200);
            entity.Property(e => e.Number).HasMaxLength(20);
        });

        modelBuilder.Entity<MedicalCard>(entity =>
        {
            entity.ToTable("MedicalCard");

            entity.Property(e => e.MedicalCardStartDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.NextVisitDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<Patient>(entity =>
        {
            entity.ToTable("Patient");

            entity.HasIndex(e => e.MedicalCardId, "UQ_MedicalCardId").IsUnique();

            entity.HasIndex(e => e.InsurancePolicyId, "UQ_Patient").IsUnique();

            entity.Property(e => e.Address).HasMaxLength(100);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.Job).HasMaxLength(200);
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.Passport)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.Patronymic).HasMaxLength(100);
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(11)
                .IsFixedLength();
            entity.Property(e => e.SurName).HasMaxLength(100);

            entity.HasOne(d => d.InsurancePolicy).WithOne(p => p.Patient)
                .HasForeignKey<Patient>(d => d.InsurancePolicyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Patient_InsurancePolicy");

            entity.HasOne(d => d.MedicalCard).WithOne(p => p.Patient)
                .HasForeignKey<Patient>(d => d.MedicalCardId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Patient_MedicalCard");
        });

        modelBuilder.Entity<RegistrationStaff>(entity =>
        {
            entity.HasKey(e => e.UserId);

            entity.ToTable("RegistrationStaff");

            entity.Property(e => e.UserId).ValueGeneratedNever();
            entity.Property(e => e.Title).HasMaxLength(10);

            entity.HasOne(d => d.User).WithOne(p => p.RegistrationStaff)
                .HasForeignKey<RegistrationStaff>(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RegistrationStaff_User");
        });

        modelBuilder.Entity<Schedule>(entity =>
        {
            entity.ToTable("Schedule");

            entity.Property(e => e.ScheduleId).ValueGeneratedNever();
        });

        modelBuilder.Entity<Therapy>(entity =>
        {
            entity.ToTable("Therapy");

            entity.Property(e => e.TherapyId).ValueGeneratedNever();
            entity.Property(e => e.Date).HasColumnType("datetime");
            entity.Property(e => e.Diagnosis).HasMaxLength(1000);
            entity.Property(e => e.Direction).HasMaxLength(50);
            entity.Property(e => e.HospitalizationCode).HasMaxLength(50);
            entity.Property(e => e.Price).HasColumnType("decimal(15, 2)");
            entity.Property(e => e.Recomendations).HasMaxLength(1000);
            entity.Property(e => e.Title).HasMaxLength(100);

            entity.HasOne(d => d.Doctor).WithMany(p => p.Therapies)
                .HasForeignKey(d => d.DoctorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Therapy_Doctor");

            entity.HasOne(d => d.MedicalCard).WithMany(p => p.Therapies)
                .HasForeignKey(d => d.MedicalCardId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Therapy_MedicalCard");

            entity.HasOne(d => d.Type).WithMany(p => p.Therapies)
                .HasForeignKey(d => d.TypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Therapy_TherapyType");
        });

        modelBuilder.Entity<TherapyRecipe>(entity =>
        {
            entity.ToTable("TherapyRecipe");

            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.Dosage).HasMaxLength(50);
            entity.Property(e => e.Title).HasMaxLength(50);

            entity.HasOne(d => d.Therapy).WithMany(p => p.TherapyRecipes)
                .HasForeignKey(d => d.TherapyId)
                .HasConstraintName("FK_TherapyRecipe_Therapy");
        });

        modelBuilder.Entity<TherapyResult>(entity =>
        {
            entity.ToTable("TherapyResult");

            entity.Property(e => e.Description).HasMaxLength(1000);
            entity.Property(e => e.Title).HasMaxLength(100);

            entity.HasOne(d => d.Therapy).WithMany(p => p.TherapyResults)
                .HasForeignKey(d => d.TherapyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TherapyResult_Therapy");
        });

        modelBuilder.Entity<TherapyType>(entity =>
        {
            entity.HasKey(e => e.TypeId);

            entity.ToTable("TherapyType");

            entity.HasIndex(e => e.Title, "UQ_TherapyType").IsUnique();

            entity.Property(e => e.Title).HasMaxLength(100);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.Patronymic)
                .HasMaxLength(100)
                .HasDefaultValue("нет");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(11)
                .IsFixedLength();
            entity.Property(e => e.Surname).HasMaxLength(100);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
