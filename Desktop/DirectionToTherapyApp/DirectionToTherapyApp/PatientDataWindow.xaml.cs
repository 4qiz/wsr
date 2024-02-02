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

namespace DirectionToTherapyApp
{
    /// <summary>
    /// Логика взаимодействия для PatientDateWindow.xaml
    /// </summary>
    public partial class PatientDataWindow : Window
    {
        public PatientDataWindow()
        {
            InitializeComponent();
        }

        private void StartTherapyButton_Click(object sender, RoutedEventArgs e)
        {
            new TherapyWindow().ShowDialog();
        }
    }
}
