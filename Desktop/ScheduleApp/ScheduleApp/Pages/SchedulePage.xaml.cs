using Microsoft.EntityFrameworkCore;
using ScheduleApp.Data;
using ScheduleApp.Models;
using ScheduleApp.Windows;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;

namespace ScheduleApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для SchedulePage.xaml
    /// </summary>
    public partial class SchedulePage : Page
    {
        public List<BookingToEvent> Bookings { get; set; } = new();
        public SchedulePage()
        {
            InitializeComponent();

            GetBookings();
            UpdateScheduleListView(Bookings);
            dayDatePicker.DisplayDate = DateTime.Now;
            dayDatePicker.SelectedDate = DateTime.Now;
        }


        private void WeekButton_Click(object sender, RoutedEventArgs e)
        {
            var date = dayDatePicker.SelectedDate;
            var weekSchedule = Bookings.Where(i => i.EventStartDate >= date && i.EventStartDate <= date?.AddDays(7)).ToList();
            UpdateScheduleListView(weekSchedule);
        }

        private void DayButton_Click(object sender, RoutedEventArgs e)
        {
            var date = dayDatePicker.SelectedDate;
            var todaySchedule = Bookings.Where(i => i.EventStartDate.Date == date?.Date).ToList();
            UpdateScheduleListView(todaySchedule);
        }

        /// <summary>
        /// get data from database
        /// </summary>
        private void GetBookings()
        {
            try
            {
                using var context = new AppDbContext();
                Bookings = context.BookingToEvents
                    .Include(booking => booking.Cabinet)
                    .Include(booking => booking.Doctor).ThenInclude(doctor => doctor.DoctorNavigation)
                    .Include(booking => booking.EventType)
                    .Where(booking => booking.EventEndDate >= DateTime.Now.Date)
                    .OrderBy(booking => booking.EventStartDate)
                    .ToList();
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
                throw;
            }
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            var booking = (sender as Button)?.DataContext as BookingToEvent;
            new EditEventWindow(booking.BookingId).ShowDialog();
        }

        private void UpdateScheduleListView(List<BookingToEvent> list) => bookingsListView.ItemsSource = list;

        private void ResetButton_Click(object sender, RoutedEventArgs e)
        {
            GetBookings();
            UpdateScheduleListView(Bookings);
            searchByDoctorTextBox.Text = searchBySpecializationTextBox.Text = ""; 
            startDatePicker.SelectedDate = endDatePicker.SelectedDate = null;
            bookingsListView.Items.Filter = FilterListView;
        }

        private void SearchFitersTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            bookingsListView.Items.Filter = FilterListView;
        }

        private void FilterDatePickers_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            bookingsListView.Items.Filter = FilterListView;
        }

        /// <summary>
        /// Filtration 
        /// </summary>
        /// <param name="bookingObj">Booking Row of ListView</param>
        /// <returns>true if element need to be removed; false - element will show</returns>
        private bool FilterListView(object bookingObj)
        {
            var booking = (BookingToEvent) bookingObj;

            var startDateFilter = !startDatePicker.SelectedDate.HasValue || booking.EventStartDate >= startDatePicker.SelectedDate.Value;
            var endDateFilter = !endDatePicker.SelectedDate.HasValue || booking.EventEndDate <= endDatePicker.SelectedDate.Value;
            var docNameFilter = searchByDoctorTextBox.Text == "" || booking.Doctor.DoctorNavigation.Name.Contains(searchByDoctorTextBox.Text, StringComparison.OrdinalIgnoreCase);
            var doctorSpecializationFilter = searchBySpecializationTextBox.Text == "" || booking.Doctor.Specialization.Contains(searchBySpecializationTextBox.Text, StringComparison.OrdinalIgnoreCase);

            return docNameFilter && doctorSpecializationFilter && startDateFilter && endDateFilter;
        }
    }
}
