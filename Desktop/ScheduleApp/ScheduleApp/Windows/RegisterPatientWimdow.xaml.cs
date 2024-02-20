using ScheduleApp.Data;
using ScheduleApp.Models;
using System.Windows;

namespace ScheduleApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для RegisterPatientWimdow.xaml
    /// </summary>
    public partial class RegisterPatientWimdow : Window
    {
        public RegisterPatientWimdow()
        {
            InitializeComponent();
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            var name = nameTB.Text;
            var surname = surnameTB.Text;
            var patr = patTB.Text;
            if (!dateofbDatePicker.SelectedDate.HasValue)
            {
                MessageBox.Show("data");
                return;
            }
            if (!mRB.IsChecked.HasValue || !gRB.IsChecked.HasValue)
            {
                MessageBox.Show("pol");
                return;
            }
            var ismale = mRB.IsChecked == true;
            var email = emailTB.Text;
            var phone = numTB.Text;
            var adres = addresTB.Text;
            var policy = policyTB.Text;
            var comp = insurTB.Text;
            var pass = passportTB.Text;
            var issued = isuedbyTB.Text;
            var dateofb = dateofbDatePicker.SelectedDate.Value;
            var patient = new Patient
            {
                PhoneNumber = phone,
                Address = adres,
                DateOfBirth = DateOnly.FromDateTime(dateofb.Date),
                Email = email,
                IsMale = ismale,
                InsuranceCompany = comp,
                InsurancePolicyNumber = policy,
                Passport = pass,
                PassportIssuedBy = issued,
            };
            var user = new User
            {
                Name = name,
                SurName = surname,
                Patronymic = patr,
                Login = email,
                Patient = patient
            };
            try
            {
                RegistratePatient(user);
                MessageBox.Show("registred");
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void RegistratePatient(User patient)
        {
            using var context = new AppDbContext();
            context.Add(patient);
            context.SaveChanges();
        }
    }
}
