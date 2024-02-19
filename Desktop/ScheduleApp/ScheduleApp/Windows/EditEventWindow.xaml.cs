
using Microsoft.EntityFrameworkCore;
using ScheduleApp.Data;
using ScheduleApp.Models;
using System.ComponentModel.DataAnnotations;
using System.Windows;

namespace ScheduleApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для EditEventWindow.xaml
    /// </summary>
    public partial class EditEventWindow : Window
    {
        public BookingToEvent Booking { get; set; }
        public EditEventWindow(BookingToEvent booking = null)
        {
            InitializeComponent();
            if (booking == null)
            {
                MessageBox.Show("no item");
                return;
            }
            Booking = booking;

            startPicker.Value = booking?.EventStartDate;
            endPicker.Value = booking?.EventEndDate;
            LoadData();
        }

        private void LoadData()
        {
            try
            {
                using var context = new AppDbContext();
                var doctors = context.Doctors.ToList();
                var cabinets = context.Cabinets.ToList();
                var bookings = context.BookingToEvents.Include(b => b.Doctor).Include(b=>b.Cabinet);
                doctorSpecializationComboBox.ItemsSource = doctors;
                doctorSpecializationComboBox.SelectedItem = bookings.FirstOrDefault(it => it.BookingId == Booking.BookingId)?.Doctor;
                doctorSpecializationComboBox.DisplayMemberPath = "Specialization";
                cabinetComboBox.ItemsSource = cabinets;
                cabinetComboBox.SelectedItem = bookings.FirstOrDefault(it => it.BookingId == Booking.BookingId)?.Cabinet;
                cabinetComboBox.DisplayMemberPath = "Number";
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (!startPicker.Value.HasValue)
                MessageBox.Show("start date");
            var startDate  = startPicker.Value;
            if (!endPicker.Value.HasValue)
                MessageBox.Show("end date");
            var endDate = startPicker.Value;
            var doctor = doctorSpecializationComboBox.SelectedItem as Doctor;
            var cabinet = cabinetComboBox.SelectedItem as Cabinet;
            if (doctor == null || cabinet == null || endDate == null || startDate == null) { return; }
            Booking.EventStartDate = (DateTime)startDate; 
            Booking.EventEndDate = endDate;
            Booking.Doctor = doctor;
            Booking.Cabinet = cabinet;
            Booking.IsChanged = true;
            try
            {
                UpdateBooking(Booking);
                MessageBox.Show("saved");
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void UpdateBooking(BookingToEvent booking)
        {
            using var context = new AppDbContext();
            context.Update(booking);
            context.SaveChanges();
        }
    }
}
