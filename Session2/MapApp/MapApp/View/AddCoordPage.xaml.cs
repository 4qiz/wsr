using MapApp.View.Windows;
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

namespace MapApp.View
{
    /// <summary>
    /// Логика взаимодействия для AddCoordPage.xaml
    /// </summary>
    public partial class AddCoordPage : Page
    {
        public AddCoordPage()
        {
            InitializeComponent();
        }

        private void canvas_MouseDown(object sender, MouseButtonEventArgs e)
        {
            var coord = e.GetPosition(canvas);
            new CoordinatesWindow(coord).Show();
        }
    }
}
