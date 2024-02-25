using MapApp.Data;
using MapApp.Models;
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

namespace MapApp.View.Windows
{
    /// <summary>
    /// Логика взаимодействия для CoordinatesWindow.xaml
    /// </summary>
    public partial class CoordinatesWindow : Window
    {
        public int X { get; set; }
        public int Y { get; set; }
        public CoordinatesWindow(Point point)
        {
            InitializeComponent();
            X = (int)point.X;
            Y = (int)point.Y;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            using var context = new AppDbContext();

            var hRoom = new HospitalizationRoom
            {
                BedCode = bed.Text,
                X = X,
                Y = Y,
                RoomNumber = Convert.ToInt32(room.Text)
            };
            context.Add(hRoom);
            context.SaveChanges();
            Close();
        }
    }
}
