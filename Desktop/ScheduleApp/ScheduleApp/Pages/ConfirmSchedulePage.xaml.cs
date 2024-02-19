using Microsoft.EntityFrameworkCore;
using ScheduleApp.Data;
using ScheduleApp.Models;
using System.Windows;
using System.Windows.Controls;

namespace ScheduleApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для ConfirmSchedulePage.xaml
    /// </summary>
    public partial class ConfirmSchedulePage : Page
    {
        public List<BookingToEvent> Bookings { get; set; } = new();

        public List<BookingToEvent> MonthBookings { get; set; } = new();

        public List<ScheduleMonth> ScheduleMonths { get; set; } = new();

        public ConfirmSchedulePage()
        {
            InitializeComponent();

            GetBookings();
            UpdateScheduleListView(Bookings);

            monthPicker.SelectedDate = DateTime.Now;
            GetScheduleMonth();
        }

        private void GetScheduleMonth()
        {
            try
            {
                using var context = new AppDbContext();
                ScheduleMonths = context.ScheduleMonths.ToList();
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
                throw;
            }
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
                    .OrderBy(booking => booking.EventStartDate)
                    .ToList();
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
                throw;
            }
        }

        private void UpdateScheduleListView(List<BookingToEvent> list) => bookingsListView.ItemsSource = list;

        private void ConfirmButton_Click(object sender, RoutedEventArgs e)
        {
            var selectedDate = monthPicker.SelectedDate;
            if (selectedDate == null) return;
            if (ScheduleMonths.Any(s => s.Year == selectedDate.Value.Year && s.Month == selectedDate.Value.Month))
            {
                MessageBox.Show("Расписание уже подтверждено");
                return;
            };
            if (MessageBox.Show($"are u sure??? \n approve for {selectedDate.Value.Year} {selectedDate.Value.Month}", "", MessageBoxButton.YesNo) == MessageBoxResult.No)
            {
                return;
            };
            var scheduleMonth = new ScheduleMonth()
            {
                Year = (short)selectedDate.Value.Year,
                Month = (byte)selectedDate.Value.Month,
                IsApproved = true,
            };
            try
            {
                AddScheduleMonth(scheduleMonth);
                isApprovedTextBlock.Visibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
                throw;
            }
        }

        private static void AddScheduleMonth(ScheduleMonth scheduleMonth)
        {
            using var context = new AppDbContext();
            context.Add(scheduleMonth);
            context.SaveChanges();
        }

        private void MonthCalendar_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedDate = monthPicker.SelectedDate;
            if (selectedDate == null) return;

            MonthBookings = Bookings.Where(b => b.EventStartDate.Month == selectedDate.Value.Month).ToList();
            UpdateScheduleListView(MonthBookings);
            isApprovedTextBlock.Visibility = Visibility.Hidden;
        }
    }
}
