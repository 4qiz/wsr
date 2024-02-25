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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void TrakingPageButton_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new TrakingPage();
        }

        private void DragAndDropPageButton_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new DragAndDropPage();
        }

        private void CoordButton_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new AddCoordPage();
        }

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            if (ContentFrame.CanGoBack)
            {
                ContentFrame.GoBack();
            }
        }
    }
}
