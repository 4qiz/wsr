using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query.Internal;
using ScheduleApp.Data;
using ScheduleApp.Models;
using ScheduleApp.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ScheduleApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для RegisterPatientPage.xaml
    /// </summary>
    public partial class RegisterPatientPage : Page
    {
        public List<Patient> Patients { get; set; } = new();
        public RegisterPatientPage()
        {
            InitializeComponent();
            GetPatients();
            UpdatePatientsListView(Patients);
        }

        private void UpdatePatientsListView(List<Patient> patients)
        {
            patientsListView.ItemsSource = patients;
        }

        private void GetPatients()
        {
            using var context = new AppDbContext();
            Patients = context.Patients.Include(p=>p.PatientNavigation).ToList();
            if (Patients.Count == 0)
            {
                MessageBox.Show("нет пациентов");
            }
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            new RegisterPatientWimdow().ShowDialog();
        }

        private void BookingPatientButton_Click(object sender, RoutedEventArgs e)
        {
            var patient = (sender as Button).DataContext as Patient;
            if (patient == null)
            {
                MessageBox.Show("null");
                return;
            }
            new EditEventWindow(null, patient).ShowDialog();

        }
    }
}
