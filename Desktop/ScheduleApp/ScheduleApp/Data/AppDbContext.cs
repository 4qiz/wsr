using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using ScheduleApp.Models;

namespace ScheduleApp.Data;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Cabinet> Cabinets { get; set; }

    public virtual DbSet<Doctor> Doctors { get; set; }

    public virtual DbSet<Event> Events { get; set; }

    public virtual DbSet<EventRecipe> EventRecipes { get; set; }

    public virtual DbSet<EventResult> EventResults { get; set; }

    public virtual DbSet<EventType> EventTypes { get; set; }

    public virtual DbSet<Hospitalization> Hospitalizations { get; set; }

    public virtual DbSet<HospitalizationRoom> HospitalizationRooms { get; set; }

    public virtual DbSet<Patient> Patients { get; set; }

    public virtual DbSet<RegistrationStaff> RegistrationStaffs { get; set; }

    public virtual DbSet<ScheduleItem> ScheduleItems { get; set; }

    public virtual DbSet<ScheduleMonth> ScheduleMonths { get; set; }

    public virtual DbSet<ScheduleWorkDayTemplate> ScheduleWorkDayTemplates { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserHasPatient> UserHasPatients { get; set; }

    public virtual DbSet<WorkHour> WorkHours { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=sql.bsite.net\\MSSQL2016;User ID=wsr2024_SampleDB;Password=567.tyu.;Trust Server Certificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Cabinet>(entity =>
        {
            entity.ToTable("Cabinet");
        });

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

        modelBuilder.Entity<Event>(entity =>
        {
            entity.HasKey(e => e.EventId).HasName("PK_Therapy");

            entity.ToTable("Event");

            entity.HasIndex(e => e.HospitalizationCode, "UQ_HospitalizationCode").IsUnique();

            entity.Property(e => e.EventId).ValueGeneratedNever();
            entity.Property(e => e.Diagnosis).HasMaxLength(1000);
            entity.Property(e => e.Price).HasColumnType("decimal(15, 2)");
            entity.Property(e => e.Recomendations).HasMaxLength(1000);
            entity.Property(e => e.Title).HasMaxLength(100);

            entity.HasOne(d => d.DirectionToEventNavigation).WithMany(p => p.InverseDirectionToEventNavigation)
                .HasForeignKey(d => d.DirectionToEvent)
                .HasConstraintName("FK_Event_Event");

            entity.HasOne(d => d.HospitalizationCodeNavigation).WithOne(p => p.Event)
                .HasForeignKey<Event>(d => d.HospitalizationCode)
                .HasConstraintName("FK_Event_Hospitalization");

            entity.HasOne(d => d.Type).WithMany(p => p.Events)
                .HasForeignKey(d => d.TypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Event_EventType");
        });

        modelBuilder.Entity<EventRecipe>(entity =>
        {
            entity.HasKey(e => e.TherapyRecipeId).HasName("PK_TherapyRecipe");

            entity.ToTable("EventRecipe");

            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.Dosage).HasMaxLength(50);
            entity.Property(e => e.Title).HasMaxLength(50);

            entity.HasOne(d => d.Therapy).WithMany(p => p.EventRecipes)
                .HasForeignKey(d => d.TherapyId)
                .HasConstraintName("FK_TherapyRecipe_Therapy");
        });

        modelBuilder.Entity<EventResult>(entity =>
        {
            entity.HasKey(e => e.TherapyResultId).HasName("PK_TherapyResult");

            entity.ToTable("EventResult");

            entity.Property(e => e.Description).HasMaxLength(1000);
            entity.Property(e => e.Title).HasMaxLength(100);

            entity.HasOne(d => d.Therapy).WithMany(p => p.EventResults)
                .HasForeignKey(d => d.TherapyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TherapyResult_Therapy");
        });

        modelBuilder.Entity<EventType>(entity =>
        {
            entity.HasKey(e => e.TypeId).HasName("PK_TherapyType");

            entity.ToTable("EventType");

            entity.HasIndex(e => e.Title, "UQ_TherapyType").IsUnique();

            entity.Property(e => e.Title).HasMaxLength(100);
        });

        modelBuilder.Entity<Hospitalization>(entity =>
        {
            entity.HasKey(e => e.HospitalizationCode).HasName("PK_Hospitalization_1");

            entity.ToTable("Hospitalization");

            entity.HasIndex(e => e.HospitalizationCode, "UQ_Hospitalization").IsUnique();

            entity.Property(e => e.HospitalizationCode).ValueGeneratedNever();
            entity.Property(e => e.CancelReason).HasMaxLength(100);
            entity.Property(e => e.Department).HasMaxLength(100);
            entity.Property(e => e.EndDate).HasColumnType("datetime");
            entity.Property(e => e.Goal).HasMaxLength(500);
            entity.Property(e => e.Price).HasColumnType("decimal(15, 2)");
            entity.Property(e => e.StartDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.HospitalizationRoom).WithMany(p => p.Hospitalizations)
                .HasForeignKey(d => d.HospitalizationRoomId)
                .HasConstraintName("FK_Hospitalization_HospitalizationRoom");
        });

        modelBuilder.Entity<HospitalizationRoom>(entity =>
        {
            entity.ToTable("HospitalizationRoom");

            entity.Property(e => e.BedCode)
                .HasMaxLength(2)
                .IsFixedLength();
        });

        modelBuilder.Entity<Patient>(entity =>
        {
            entity.ToTable("Patient");

            entity.HasIndex(e => e.Passport, "IX_PatientPassport").IsUnique();

            entity.HasIndex(e => e.InsurancePolicyNumber, "UQ_Patient").IsUnique();

            entity.Property(e => e.Address).HasMaxLength(100);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.InsuranceCompany).HasMaxLength(100);
            entity.Property(e => e.Job).HasMaxLength(200);
            entity.Property(e => e.Passport)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.PassportIssuedBy).HasMaxLength(100);
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(11)
                .IsFixedLength();
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

        modelBuilder.Entity<ScheduleItem>(entity =>
        {
            entity.HasKey(e => e.ScheduleId).HasName("PK_Schedule1");

            entity.ToTable("ScheduleItem");

            entity.Property(e => e.ScheduleId).ValueGeneratedNever();
            entity.Property(e => e.EventEndDate).HasColumnType("datetime");
            entity.Property(e => e.EventStartDate).HasColumnType("datetime");

            entity.HasOne(d => d.Cabinet).WithMany(p => p.ScheduleItems)
                .HasForeignKey(d => d.CabinetId)
                .HasConstraintName("FK_Schedule_Cabinet");

            entity.HasOne(d => d.Doctor).WithMany(p => p.ScheduleItems)
                .HasForeignKey(d => d.DoctorId)
                .HasConstraintName("FK_Schedule_Doctor");

            entity.HasOne(d => d.Event).WithMany(p => p.ScheduleItems)
                .HasForeignKey(d => d.EventId)
                .HasConstraintName("FK_Schedule_Event");

            entity.HasOne(d => d.Patient).WithMany(p => p.ScheduleItems)
                .HasForeignKey(d => d.PatientId)
                .HasConstraintName("FK_Schedule_Patient");

            entity.HasOne(d => d.ScheduleMonth).WithMany(p => p.ScheduleItems)
                .HasForeignKey(d => d.ScheduleMonthId)
                .HasConstraintName("FK_Schedule_ScheduleMonth");
        });

        modelBuilder.Entity<ScheduleMonth>(entity =>
        {
            entity.ToTable("ScheduleMonth");

            entity.Property(e => e.ScheduleMonthId).ValueGeneratedNever();
            entity.Property(e => e.Year).HasDefaultValueSql("(datepart(year,getdate()))");
        });

        modelBuilder.Entity<ScheduleWorkDayTemplate>(entity =>
        {
            entity.HasKey(e => e.ScheduleTemplateId);

            entity.ToTable("ScheduleWorkDayTemplate");

            entity.Property(e => e.Title).HasMaxLength(50);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.Login).HasMaxLength(100);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Patronymic).HasMaxLength(50);
            entity.Property(e => e.RegistrationDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.SurName).HasMaxLength(50);
        });

        modelBuilder.Entity<UserHasPatient>(entity =>
        {
            entity.HasKey(e => new { e.UserId, e.PatientId });

            entity.ToTable("UserHasPatient");

            entity.HasIndex(e => e.PatientId, "IX_Patient").IsUnique();

            entity.HasIndex(e => e.UserId, "UQ_UserHasPatient").IsUnique();

            entity.HasOne(d => d.Patient).WithOne(p => p.UserHasPatient)
                .HasForeignKey<UserHasPatient>(d => d.PatientId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserHasPatient_Patient");

            entity.HasOne(d => d.User).WithOne(p => p.UserHasPatient)
                .HasForeignKey<UserHasPatient>(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserHasPatient_User");
        });

        modelBuilder.Entity<WorkHour>(entity =>
        {
            entity.HasKey(e => e.WorkHoursId);

            entity.Property(e => e.WorkHoursId).ValueGeneratedNever();

            entity.HasOne(d => d.ScheduleTemplate).WithMany(p => p.WorkHours)
                .HasForeignKey(d => d.ScheduleTemplateId)
                .HasConstraintName("FK_WorkHours_ScheduleWorkDayTemplate");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
