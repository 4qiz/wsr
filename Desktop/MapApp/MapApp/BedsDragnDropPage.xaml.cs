using MapApp.DataDb;
using MapApp.ModelsDb;
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

namespace MapApp
{
    /// <summary>
    /// Логика взаимодействия для BedsDragnDropPage.xaml
    /// </summary>
    public partial class BedsDragnDropPage : Page
    {
        public List<Patient> Patients { get;  set; }

        public BedsDragnDropPage()
        {
            InitializeComponent();
            using var _context = new AppDbContext();
            var rooms = _context.HospitalizationRooms.ToList();
            Patients = _context.Patients.ToList();


            foreach (var r in rooms)
            {
                var newPanel = new WrapPanel
                {
                    Background = Brushes.Red,
                    Width = 20,
                    Height = 20,
                    AllowDrop = true,
                };
                Point panelLocation = new Point(r.X, r.Y);

                myCanvas.Children.Add(newPanel);
                Canvas.SetLeft(newPanel, panelLocation.X);
                Canvas.SetTop(newPanel, panelLocation.Y);
            }
        }

    }
}
