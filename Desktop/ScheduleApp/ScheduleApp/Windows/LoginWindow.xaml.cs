using Microsoft.EntityFrameworkCore;
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
            if (login.IsNullOrEmpty() || password.IsNullOrEmpty())
            {
                MessageBox.Show("заполните все поля");
                return;
            }
            if (Authorize(login, password))
            {
                new MainWindow().Show();
                Close();
                return;
            }
            MessageBox.Show("Неверный логин или пароль");
        }

        private bool Authorize(string login, string password)
        {
            using var context = new AppDbContext();
            var user = context.Users.Include(u => u.Doctor).Include(u => u.RegistrationStaff).FirstOrDefault(u => u.Login == login);
            if (user == null)
            {
                return false;
            }
            var sha256 = SHA256.Create();
            var hashedPassword = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            if (hashedPassword.ToString() != user.Password.ToString())
            {
                return false;
            }
            var role = user.IsAdmin ? "admin"
                : user.Doctor.Specialization == "Main" ? "main_doc"
                : user.Doctor != null ? "doc"
                : user.RegistrationStaff != null ? "reg"
                : "not";
            if (role == "not") return false;
            CurrentUser.User = user;
            CurrentUser.Role = role;

            return true;
        }
    }
}
