using MapApp.DataDb;
using MapApp.ModelsDb;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using GongSolutions.Wpf.DragDrop;
using MapApp.Custom;

namespace MapApp
{
    /// <summary>
    /// Логика взаимодействия для BedsDragnDropPage.xaml
    /// </summary>
    public partial class BedsDragnDropPage : Page
    {
        public List<Patient> Patients { get; set; }

        public BedsDragnDropPage()
        {
            InitializeComponent();
            DataContext = this;
            using var _context = new AppDbContext();
            var rooms = _context.HospitalizationRooms.ToList();
            Patients = _context.Patients.ToList();

            try
            {
                foreach (var r in rooms)
                {
                    var l = new DragableList() {AllowDrop = true };
                    Point panelLocation = new Point(r.X, r.Y);

                    myCanvas.Children.Add(l);
                    Canvas.SetLeft(l, panelLocation.X);
                    Canvas.SetTop(l, panelLocation.Y);

                    //var newPanel = new WrapPanel
                    //{
                    //    Background = Brushes.Red,
                    //    Width = 20,
                    //    Height = 20,
                    //    AllowDrop = true,
                    //};

                    //myCanvas.Children.Add(newPanel);
                    //Canvas.SetLeft(newPanel, panelLocation.X);
                    //Canvas.SetTop(newPanel, panelLocation.Y);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}
