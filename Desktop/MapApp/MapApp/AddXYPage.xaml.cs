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
    /// Логика взаимодействия для AddXYPage.xaml
    /// </summary>
    public partial class AddXYPage : Page
    {
        public AddXYPage()
        {
            InitializeComponent();
        }

        private void myCanvas_MouseDown(object sender, MouseButtonEventArgs e)
        {
            var mousePoint = e.GetPosition(myCanvas);
            new CoordinatesHelpWindow(mousePoint).Show();
        }
    }
}
