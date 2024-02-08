using MapApp.Data;
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
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private  async void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            await AuthorizeDoctor(loginTextBox.Text, passwordBox.Password);
        }

        private async Task AuthorizeDoctor(string login, string password)
        {
            if (await Connection.AuthorizeAsync(login, password))
            {
                new MainWindow().Show();
                Close();
            }
            else
            {
                MessageBox.Show("не верные данные");
            }
        }
    }
}
