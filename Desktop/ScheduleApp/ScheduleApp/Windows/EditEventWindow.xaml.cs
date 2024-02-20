
using Microsoft.EntityFrameworkCore;
using ScheduleApp.Data;
using ScheduleApp.Models;
using System.Windows;

namespace ScheduleApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для EditEventWindow.xaml
    /// </summary>
    public partial class EditEventWindow : Window
    {
        private bool isEdit = false;
        public BookingToEvent Booking { get; set; }
        public Patient Patient { get; set; }
        public EditEventWindow(int bookingId = 0, int patientId = 0)
        {
            InitializeComponent();
            try
            {

                using var context = new AppDbContext();
                var doctors = context.Doctors.ToList();
                var cabinets = context.Cabinets.ToList();
                doctorSpecializationComboBox.ItemsSource = doctors;
                doctorSpecializationComboBox.DisplayMemberPath = "Specialization";
                cabinetComboBox.ItemsSource = cabinets;
                cabinetComboBox.DisplayMemberPath = "Number";
                if (bookingId != 0)
                {
                    Booking = context.BookingToEvents.FirstOrDefault(b => b.BookingId == bookingId);
                    startPicker.Value = Booking?.EventStartDate;
                    endPicker.Value = Booking?.EventEndDate;
                    var bookings = context.BookingToEvents.Include(b => b.Doctor).Include(b => b.Cabinet);
                    doctorSpecializationComboBox.SelectedItem = bookings.FirstOrDefault(it => it.BookingId == Booking.BookingId)?.Doctor;
                    cabinetComboBox.SelectedItem = bookings.FirstOrDefault(it => it.BookingId == Booking.BookingId)?.Cabinet;
                    isEdit = true;
                }
                else if (patientId != 0)
                {
                    Patient = context.Patients.FirstOrDefault(it => it.PatientId == patientId);
                    isEdit = false;
                }

            }
            catch (Exception)
            {

                throw;
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (!startPicker.Value.HasValue || startPicker.Value == null)
                MessageBox.Show("start date");
            var startDate = startPicker.Value;
            if (!endPicker.Value.HasValue || endPicker.Value == null)
                MessageBox.Show("end date");
            var endDate = startPicker.Value;
            var doctor = doctorSpecializationComboBox.SelectedItem as Doctor;
            var cabinet = cabinetComboBox.SelectedItem as Cabinet;
            if (doctor == null || cabinet == null || endDate == null || startDate == null)
            { return; }
            try
            {
                if (isEdit)
                {
                    EditBooking((DateTime)startDate, (DateTime)endDate, doctor, cabinet);
                }
                else
                {
                    RegistrateBooking((DateTime)startDate, (DateTime)endDate, doctor, cabinet);
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        private void RegistrateBooking(DateTime startDate, DateTime endDate, Doctor doctor, Cabinet cabinet)
        {
            try
            {
                var newBooking = new BookingToEvent
                {
                    EventStartDate = (DateTime)startDate,
                    EventEndDate = endDate,
                    Doctor = doctor,
                    Cabinet = cabinet,
                    IsChanged = false,
                    EventTypeId = 11
                };
                newBooking.Patients.Add(Patient);
                AddBookingToPatient(newBooking);
                MessageBox.Show("added");
            }
            catch (Exception)
            {

                throw;
            }

        }

        private void AddBookingToPatient(BookingToEvent booking)
        {
            using var context = new AppDbContext();
            context.Update(booking);
            context.SaveChanges();
        }

        private void EditBooking(DateTime startDate, DateTime endDate, Doctor doctor, Cabinet cabinet)
        {

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
            context.Update(Booking);
            context.SaveChanges();
        }
    }
}
