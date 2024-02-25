using MapApp.Data;
using MapApp.Models;
using MapApp.UserControls;
using Microsoft.EntityFrameworkCore;
using System.Windows;
using System.Windows.Controls;

namespace MapApp.View
{
    /// <summary>
    /// Логика взаимодействия для DragAndDropPage.xaml
    /// </summary>
    public partial class DragAndDropPage : Page
    {
        public DragAndDropPage()
        {
            InitializeComponent();
            DataContext = this;
            Update();
        }

        private void Update()
        {
            mapCanvas.Children.Clear();
            try
            {
                using var context = new AppDbContext();
                var patients = context.Patients
                    .Include(p => p.Hospitalizations)
                    .ThenInclude(h => h.HospitalizationRoom).ToList();
                var hospitalizationRooms = context.HospitalizationRooms.ToList();
                var patientsOnHospitalization = patients
                    .Where(p => p.Hospitalizations.Any(h => h.EndDate > DateTime.Now)).ToList();

                patientsListView.ItemsSource = patients;

                foreach (var room in hospitalizationRooms)
                {
                    var dragableListView = new DragableListView { Room = room };
                    foreach (var patientOnHospitalization in patientsOnHospitalization)
                    {
                        var patientRoom = patientOnHospitalization
                            ?.Hospitalizations?.FirstOrDefault(h => h.EndDate > DateTime.Now)?.HospitalizationRoom?.RoomNumber;
                        var patientBed = patientOnHospitalization
                            ?.Hospitalizations?.FirstOrDefault(h => h.EndDate > DateTime.Now)?.HospitalizationRoom?.BedCode;
                        if (patientBed == room.BedCode && patientRoom == room.RoomNumber)
                        {
                            dragableListView.Patients.Add(patientOnHospitalization);
                        }
                    }

                    var point = new Point(room.X, room.Y);
                    mapCanvas.Children.Add(dragableListView);
                    Canvas.SetLeft(dragableListView, point.X);
                    Canvas.SetTop(dragableListView, point.Y);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error");
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var bedsListViews = mapCanvas.Children;
                foreach (var bed in bedsListViews)
                {
                    var dragableListView = bed as DragableListView;
                    if (dragableListView?.Patients.Count > 1)
                    {
                        MessageBox.Show("больше одного в палате");
                        dragableListView?.Patients.Clear();
                        Update();
                        return;
                    }
                    var hospitalization = dragableListView?.Patients?.FirstOrDefault()
                        ?.Hospitalizations.FirstOrDefault(h => h.EndDate > DateTime.Now);
                    using var context = new AppDbContext();
                    if (hospitalization != null)
                    {
                        hospitalization.HospitalizationRoom = dragableListView?.Room;
                        context.Update(hospitalization);

                    }
                    else if (dragableListView?.Patients?.FirstOrDefault() != null)
                    {
                        var contextRoom = context.HospitalizationRooms
                            .FirstOrDefault(r => r.HospitalizationRoomId == dragableListView.Room.HospitalizationRoomId);
                        var contextPatient = context.Patients.Find(dragableListView?.Patients?.FirstOrDefault().MedicalCardId);
                        var newHospitalization = new Hospitalization
                        {
                            EndDate = DateTime.Now.AddDays(7),
                            StartDate = DateTime.Now,
                            DepartmentNumber = 1,
                            MedicalCard = contextPatient,
                            HospitalizationRoom = contextRoom
                        };
                        context.Add(newHospitalization);
                    }
                    context.SaveChanges();
                }
                MessageBox.Show("saved");
                Update();
            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}
