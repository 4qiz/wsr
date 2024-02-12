using MapApp.Custom;
using MapApp.DataDb;
using MapApp.ModelsDb;
using Microsoft.EntityFrameworkCore;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;

namespace MapApp
{
    /// <summary>
    /// Логика взаимодействия для BedsDragnDropPage.xaml
    /// </summary>
    public partial class BedsDragnDropPage : Page
    {

        public ObservableCollection<Patient> Patients { get; set; }

        public BedsDragnDropPage()
        {

            DataContext = this;
            InitializeComponent();


            UpdateRoomsPatients();
        }

        private void UpdateRoomsPatients()
        {
            try
            {
                using var _context = new AppDbContext();
                var rooms = _context.HospitalizationRooms.ToList();
                var patients = _context.Patients
                    .Include(p => p.MedicalCard)
                    .ThenInclude(mc => mc.Hospitalizations)
                    .ThenInclude(h => h.HospitalizationRoom)
                    .ToList();
                var patientsH = patients.Where(p => p?.MedicalCard?.Hospitalizations?.FirstOrDefault()?.EndDate > DateTime.Now).ToList();
                Patients = new ObservableCollection<Patient>(patientsH);
                patientsListView.ItemsSource = patientsH;
                foreach (var room in rooms)
                {
                    var name = $"{room.Bed}{room.Number}ListView";
                    var listView = new DragableList() { Name = name, Room = room };
                    foreach (var p in patientsH)
                    {
                        var patientRoomNumber = p?.MedicalCard?.Hospitalizations?.FirstOrDefault()?.HospitalizationRoom.Number;
                        var patientBed = p?.MedicalCard?.Hospitalizations?.FirstOrDefault()?.HospitalizationRoom.Bed;
                        if (patientRoomNumber == room.Number && patientBed == room.Bed)
                        {
                            listView.Patients.Add(p);
                        }
                    }
                    Point panelLocation = new Point(room.X, room.Y);

                    myCanvas.Children.Add(listView);
                    Canvas.SetLeft(listView, panelLocation.X);
                    Canvas.SetTop(listView, panelLocation.Y);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            UpdateRoomsPatients();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            var lists = myCanvas.Children;
            foreach (var listView in lists)
            {
                var dragListView = (DragableList)listView;
                var number = dragListView.Room.Number;
                var bed = dragListView.Room.Bed;
                if (dragListView?.Patients.Count > 1)
                {
                    MessageBox.Show("в одной палате не может быть двух пациентов");
                    UpdateRoomsPatients();
                    return;
                }
                var hospitalization = dragListView?.Patients.FirstOrDefault()?
                    .MedicalCard?.Hospitalizations.FirstOrDefault(h => h.EndDate > DateTime.Now);
                if (hospitalization != null)
                {
                    hospitalization.HospitalizationRoom = dragListView.Room;
                    using var _context = new AppDbContext();
                    _context.Update(hospitalization);
                    _context.SaveChanges();
                }
            }
        }
    }
}
