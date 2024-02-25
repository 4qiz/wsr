using MapApp.Data;
using MapApp.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;

namespace MapApp.UserControls
{
    /// <summary>
    /// Логика взаимодействия для DragableListView.xaml
    /// </summary>
    public partial class DragableListView : UserControl
    {
        public int Max { get; set; } = 1;
        public HospitalizationRoom Room { get; set; }
        public ObservableCollection<Patient> Patients { get; set; } = new();
        public DragableListView()
        {
            InitializeComponent();
            DataContext = this;
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            if (Patients.Count == 1)
            {
                try
                {
                    using var context = new AppDbContext();
                    var hospitalization = context.Hospitalizations
                        .FirstOrDefault(h => h.MedicalCardId == Patients[0].MedicalCardId && h.EndDate > DateTime.Now);
                    if (hospitalization != null)
                    {
                        hospitalization.EndDate = DateTime.Now;
                        context.Update(hospitalization);
                        context.SaveChanges();
                        Patients.Clear();
                        MessageBox.Show("Пациент выписан");
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }
    }
}
