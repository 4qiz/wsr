using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Session5Api.Models;

namespace Session5Api.Data;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<S5IssueRequest> S5IssueRequests { get; set; }

    public virtual DbSet<S5IssueRequestHasMedicine> S5IssueRequestHasMedicines { get; set; }

    public virtual DbSet<S5Medicine> S5Medicines { get; set; }

    public virtual DbSet<Warehouse> Warehouses { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=sql.bsite.net\\MSSQL2016;Initial catalog = newstiam_wsr;User ID=newstiam_wsr;Password=12233445;Trust Server Certificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<S5IssueRequest>(entity =>
        {
            entity.HasKey(e => e.IssueRequestId);

            entity.ToTable("S5_IssueRequest");

            entity.Property(e => e.CreatedTime)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Purpose).HasMaxLength(50);
        });

        modelBuilder.Entity<S5IssueRequestHasMedicine>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_S5_IssueRequestHasMedicine_1");

            entity.ToTable("S5_IssueRequestHasMedicine");

            entity.Property(e => e.Quantity).HasDefaultValueSql("((1))");

            entity.HasOne(d => d.IssueRequest).WithMany(p => p.S5IssueRequestHasMedicines)
                .HasForeignKey(d => d.IssueRequestId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_S5_IssueRequestHasMedicine_S5_IssueRequest");

            entity.HasOne(d => d.Medicine).WithMany(p => p.S5IssueRequestHasMedicines)
                .HasForeignKey(d => d.MedicineId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_S5_IssueRequestHasMedicine_S5_Medicine");
        });

        modelBuilder.Entity<S5Medicine>(entity =>
        {
            entity.HasKey(e => e.MedicineId);

            entity.ToTable("S5_Medicine");

            entity.Property(e => e.Image).HasMaxLength(500);
            entity.Property(e => e.Manufacturer).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(200);
            entity.Property(e => e.Price).HasColumnType("decimal(13, 2)");
            entity.Property(e => e.TradeName).HasMaxLength(50);

            entity.HasOne(d => d.Warehouse).WithMany(p => p.S5Medicines)
                .HasForeignKey(d => d.WarehouseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_S5_Medicine_Warehouse");
        });

        modelBuilder.Entity<Warehouse>(entity =>
        {
            entity.ToTable("Warehouse");

            entity.Property(e => e.Name).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
