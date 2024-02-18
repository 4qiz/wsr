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

            GetScheduleItems();
            UpdateScheduleListView(Bookings);
            dayDatePicker.DisplayDate = DateTime.Now;
        }


        private void WeekButton_Click(object sender, RoutedEventArgs e)
        {
            var date = dayDatePicker.DisplayDate;
            var weekSchedule = Bookings.Where(i => i.EventStartDate >= date && i.EventStartDate <= date.AddDays(7)).ToList();
            UpdateScheduleListView(weekSchedule);
        }

        private void DayButton_Click(object sender, RoutedEventArgs e)
        {
            var date = dayDatePicker.DisplayDate;
            var todaySchedule = Bookings.Where(i => i.EventStartDate == date).ToList();
            UpdateScheduleListView(todaySchedule);
        }

        /// <summary>
        /// get data from database
        /// </summary>
        private void GetScheduleItems()
        {
            try
            {
                using var context = new AppDbContext();
                Bookings = context.BookingToEvents
                    .AsNoTracking()
                    .Include(booking => booking.Cabinet)
                    .Include(booking => booking.Doctor).ThenInclude(doctor => doctor.DoctorNavigation)
                    .Include(booking => booking.Event)
                    .ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            var booking = (sender as Button)?.DataContext as BookingToEvent;
            new EditEventWindow(booking).ShowDialog();
        }

        private void UpdateScheduleListView(List<BookingToEvent> list) => bookingsListView.ItemsSource = list;
    }
}
