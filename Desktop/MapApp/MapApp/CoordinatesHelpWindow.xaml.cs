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
using System.Windows.Shapes;

namespace MapApp
{
    /// <summary>
    /// Логика взаимодействия для CoordinatesHelpWindow.xaml
    /// </summary>
    public partial class CoordinatesHelpWindow : Window
    {
        private Point _mousePoint;

        public CoordinatesHelpWindow(Point mousePoint)
        {
            InitializeComponent();
            _mousePoint = mousePoint;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            using var _context = new AppDbContext();
            var room = new HospitalizationRoom
            {
                Number = int.Parse(numberTB.Text),
                Bed = BedTB.Text,
                X = int.Parse(_mousePoint.X.ToString()),
                Y = int.Parse(_mousePoint.Y.ToString()),
            };
            _context.HospitalizationRooms.Add(room);
            _context.SaveChanges();
            //MessageBox.Show("Saved");
            Close();
        }
    }
}
