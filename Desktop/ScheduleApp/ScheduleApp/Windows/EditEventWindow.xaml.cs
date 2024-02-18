
using ScheduleApp.Models;
using System.Windows;

namespace ScheduleApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для EditEventWindow.xaml
    /// </summary>
    public partial class EditEventWindow : Window
    {
        public EditEventWindow(BookingToEvent booking = null)
        {
            InitializeComponent();
            if (booking == null)
            {
                MessageBox.Show("no item");
            }
            startPicker.Value = booking?.EventStartDate;
            endPicker.Value = booking?.EventEndDate;
        }
    }
}
