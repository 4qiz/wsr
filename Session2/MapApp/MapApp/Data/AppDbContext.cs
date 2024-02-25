using System;
using System.Collections.Generic;
using MapApp.Models;
using Microsoft.EntityFrameworkCore;

namespace MapApp.Data;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ApprovedSchedule> ApprovedSchedules { get; set; }

    public virtual DbSet<BookingToEvent> BookingToEvents { get; set; }

    public virtual DbSet<Cabinet> Cabinets { get; set; }

    public virtual DbSet<Doctor> Doctors { get; set; }

    public virtual DbSet<Event> Events { get; set; }

    public virtual DbSet<EventType> EventTypes { get; set; }

    public virtual DbSet<Hospitalization> Hospitalizations { get; set; }

    public virtual DbSet<HospitalizationRoom> HospitalizationRooms { get; set; }

    public virtual DbSet<Patient> Patients { get; set; }

    public virtual DbSet<Recipe> Recipes { get; set; }

    public virtual DbSet<RegistrationStaff> RegistrationStaffs { get; set; }

    public virtual DbSet<Result> Results { get; set; }

    public virtual DbSet<ScheduleTemplate> ScheduleTemplates { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserHasPatient> UserHasPatients { get; set; }

    public virtual DbSet<WorkHour> WorkHours { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-O7C6TBI;initial catalog = repeat_wsr;Integrated Security=True;Trust Server Certificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ApprovedSchedule>(entity =>
        {
            entity.ToTable("ApprovedSchedule");

            entity.Property(e => e.ApprovedScheduleId).ValueGeneratedNever();
        });

        modelBuilder.Entity<BookingToEvent>(entity =>
        {
            entity.ToTable("BookingToEvent");

            entity.Property(e => e.BookingToEventId).ValueGeneratedNever();
            entity.Property(e => e.EndTime).HasColumnType("datetime");
            entity.Property(e => e.StartTime).HasColumnType("datetime");

            entity.HasOne(d => d.ApprovedSchedule).WithMany(p => p.BookingToEvents)
                .HasForeignKey(d => d.ApprovedScheduleId)
                .HasConstraintName("FK_BookingToEvent_ApprovedSchedule");

            entity.HasOne(d => d.Cabinet).WithMany(p => p.BookingToEvents)
                .HasForeignKey(d => d.CabinetId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookingToEvent_Cabinet");

            entity.HasOne(d => d.Doctor).WithMany(p => p.BookingToEvents)
                .HasForeignKey(d => d.DoctorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookingToEvent_Doctor");

            entity.HasOne(d => d.Type).WithMany(p => p.BookingToEvents)
                .HasForeignKey(d => d.TypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookingToEvent_Type");
        });

        modelBuilder.Entity<Cabinet>(entity =>
        {
            entity.ToTable("Cabinet");

            entity.Property(e => e.CabinetId).ValueGeneratedNever();
        });

        modelBuilder.Entity<Doctor>(entity =>
        {
            entity.HasKey(e => e.UserId);

            entity.ToTable("Doctor");

            entity.Property(e => e.UserId).ValueGeneratedNever();
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Patronymic).HasMaxLength(50);
            entity.Property(e => e.Specialization).HasMaxLength(50);
            entity.Property(e => e.SurName).HasMaxLength(50);

            entity.HasOne(d => d.User).WithOne(p => p.Doctor)
                .HasForeignKey<Doctor>(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Doctor_User");
        });

        modelBuilder.Entity<Event>(entity =>
        {
            entity.ToTable("Event");

            entity.Property(e => e.Date)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Diagnosis).HasMaxLength(500);
            entity.Property(e => e.Recomendations).HasMaxLength(500);
            entity.Property(e => e.Title).HasMaxLength(50);

            entity.HasOne(d => d.Doctor).WithMany(p => p.Events)
                .HasForeignKey(d => d.DoctorId)
                .HasConstraintName("FK_Event_Doctor");

            entity.HasOne(d => d.MedicalCard).WithMany(p => p.Events)
                .HasForeignKey(d => d.MedicalCardId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Event_Patient");

            entity.HasOne(d => d.Type).WithMany(p => p.Events)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK_Event_Type");
        });

        modelBuilder.Entity<EventType>(entity =>
        {
            entity.HasKey(e => e.TypeId).HasName("PK_Type");

            entity.ToTable("EventType");

            entity.Property(e => e.TypeId).ValueGeneratedNever();
            entity.Property(e => e.Title).HasMaxLength(50);
        });

        modelBuilder.Entity<Hospitalization>(entity =>
        {
            entity.ToTable("Hospitalization");

            entity.Property(e => e.CancelReason)
                .HasMaxLength(500)
                .HasDefaultValue("-");
            entity.Property(e => e.EndDate).HasColumnType("datetime");
            entity.Property(e => e.HospitalizationGoal).HasMaxLength(200);
            entity.Property(e => e.Price).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.StartDate).HasColumnType("datetime");

            entity.HasOne(d => d.HospitalizationRoom).WithMany(p => p.Hospitalizations)
                .HasForeignKey(d => d.HospitalizationRoomId)
                .HasConstraintName("FK_Hospitalization_HospitalizationRoom");

            entity.HasOne(d => d.MedicalCard).WithMany(p => p.Hospitalizations)
                .HasForeignKey(d => d.MedicalCardId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Hospitalization_Patient");
        });

        modelBuilder.Entity<HospitalizationRoom>(entity =>
        {
            entity.ToTable("HospitalizationRoom");

            entity.Property(e => e.BedCode)
                .HasMaxLength(1)
                .IsFixedLength();
        });

        modelBuilder.Entity<Patient>(entity =>
        {
            entity.HasKey(e => e.MedicalCardId);

            entity.ToTable("Patient");

            entity.Property(e => e.Address).HasMaxLength(50);
            entity.Property(e => e.DateOfBirth).HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.InsurancyPolicy)
                .HasMaxLength(20)
                .IsFixedLength();
            entity.Property(e => e.InsurancyPolicyCompany).HasMaxLength(50);
            entity.Property(e => e.InsurancyPolicyEndDate).HasColumnType("datetime");
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Passport)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.PassportIssuedBy).HasMaxLength(50);
            entity.Property(e => e.Patronymic).HasMaxLength(50);
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(11)
                .IsFixedLength();
            entity.Property(e => e.Qrcode).HasColumnName("QRCode");
            entity.Property(e => e.RegistrationDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.SurName).HasMaxLength(50);
            entity.Property(e => e.WorkPlace).HasMaxLength(50);

            entity.HasMany(d => d.BookingToEvents).WithMany(p => p.MedicalCards)
                .UsingEntity<Dictionary<string, object>>(
                    "BookingToEventHasPatient",
                    r => r.HasOne<BookingToEvent>().WithMany()
                        .HasForeignKey("BookingToEventId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_BookingToEventHasPatient_BookingToEvent"),
                    l => l.HasOne<Patient>().WithMany()
                        .HasForeignKey("MedicalCardId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_BookingToEventHasPatient_Patient"),
                    j =>
                    {
                        j.HasKey("MedicalCardId", "BookingToEventId");
                        j.ToTable("BookingToEventHasPatient");
                    });
        });

        modelBuilder.Entity<Recipe>(entity =>
        {
            entity.ToTable("Recipe");

            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.Dosage).HasMaxLength(50);
            entity.Property(e => e.Title).HasMaxLength(50);

            entity.HasOne(d => d.Event).WithMany(p => p.Recipes)
                .HasForeignKey(d => d.EventId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Recipe_Event");
        });

        modelBuilder.Entity<RegistrationStaff>(entity =>
        {
            entity.HasKey(e => e.UserId);

            entity.ToTable("RegistrationStaff");

            entity.Property(e => e.UserId).ValueGeneratedNever();

            entity.HasOne(d => d.User).WithOne(p => p.RegistrationStaff)
                .HasForeignKey<RegistrationStaff>(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RegistrationStaff_User");
        });

        modelBuilder.Entity<Result>(entity =>
        {
            entity.ToTable("Result");

            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.Title).HasMaxLength(50);

            entity.HasOne(d => d.Event).WithMany(p => p.Results)
                .HasForeignKey(d => d.EventId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Result_Event");
        });

        modelBuilder.Entity<ScheduleTemplate>(entity =>
        {
            entity.ToTable("ScheduleTemplate");

            entity.Property(e => e.Title).HasMaxLength(50);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.IsAdmin).HasDefaultValue(false);
            entity.Property(e => e.Login).HasMaxLength(50);
        });

        modelBuilder.Entity<UserHasPatient>(entity =>
        {
            entity.HasKey(e => new { e.UserId, e.MedicalCardId });

            entity.ToTable("UserHasPatient");

            entity.HasIndex(e => e.MedicalCardId, "UQ_Patient").IsUnique();

            entity.HasIndex(e => e.UserId, "UQ_User").IsUnique();

            entity.HasOne(d => d.MedicalCard).WithOne(p => p.UserHasPatient)
                .HasForeignKey<UserHasPatient>(d => d.MedicalCardId)
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

            entity.HasOne(d => d.ScheduleTemplate).WithMany(p => p.WorkHours)
                .HasForeignKey(d => d.ScheduleTemplateId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkHours_ScheduleTemplate");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
