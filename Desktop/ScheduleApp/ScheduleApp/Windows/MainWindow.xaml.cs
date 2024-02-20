using ScheduleApp.Connection;
using ScheduleApp.Pages;
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

namespace ScheduleApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            if (CurrentUser.Role == "reg")
            {
                registerPatientPageButton.IsEnabled = true;
                ContentFrame.Content = new RegisterPatientPage();
            } 
            else if (CurrentUser.Role == "doc")
            {
                ContentFrame.Content = new SchedulePage();
                scheduleButtonPage.IsEnabled = true;
            }
            if (CurrentUser.Role == "main_doc")
            {
                scheduleButtonPage.IsEnabled = true;
                confirmSchedulePageButton.IsEnabled = true;
            }
            if (CurrentUser.Role == "admin")
            {
                confirmSchedulePageButton.IsEnabled = scheduleButtonPage.IsEnabled = registerPatientPageButton.IsEnabled = true;
            }
        }

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            if (ContentFrame.CanGoBack)
            {
                ContentFrame.GoBack();
            }
        }

        private void SchedulePageButton_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new SchedulePage();
        }

        private void ConfirmSchedulePageButton_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new ConfirmSchedulePage();
        }

        private void RegisterPatientPageButton_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new RegisterPatientPage();
        }


    }
}
