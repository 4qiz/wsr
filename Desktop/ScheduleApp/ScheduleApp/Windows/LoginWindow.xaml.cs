using Microsoft.IdentityModel.Tokens;
using ScheduleApp.Connection;
using ScheduleApp.Data;
using System.Security.Cryptography;
using System.Text;
using System.Windows;

namespace ScheduleApp.Windows
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

        private void AuthorizeButton_Click(object sender, RoutedEventArgs e)
        {
            var login = logingTextBox.Text;
            var password = passwordBox.Password;
            if (login.IsNullOrEmpty() || password.IsNullOrEmpty()) {
                MessageBox.Show("заполните все поля");
            }
            if (Authorize(login, password))
            {
                new MainWindow().Show();
                Close();
            }
            MessageBox.Show("Неверный логин или пароль");
        }

        private bool Authorize(string login, string password)
        {
            return true;
            using var context = new AppDbContext();
            var user = context.Users.FirstOrDefault(u => u.Login == login);
            if (user == null)
            {
                return false;
            }
            var sha256 = SHA256.Create();
            var hashedPassword = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            if (hashedPassword != user.Password)
            {
                return false;
            }
            CurrentUser.User = user;
            return true;
        }
    }
}
