using MapApp.Data;
using System.Windows.Controls;

namespace MapApp
{
    /// <summary>
    /// Логика взаимодействия для BedsPage.xaml
    /// </summary>
    public partial class BedsPage : Page
    {
        public BedsPage()
        {
            InitializeComponent();

            var hospitalizations = MockData.GetHospitalizations().Where(h=>h.EndDate > DateTime.Now);

            for (int roomNumber = 101; roomNumber < 118; roomNumber++)
            {
                var hospitalizationRoom = hospitalizations.Where(h => h.HospitalRoom == roomNumber);
                Canvas roomCanvas = FindName($"room{roomNumber}Canvas") as Canvas;
                if (roomCanvas != null && roomCanvas.Children.Count > 0)
                {
                    var bedsCheckBoxes = roomCanvas.Children.OfType<CheckBox>();
                    foreach (var bedCheckBox in bedsCheckBoxes)
                    {
                        if (bedCheckBox.Content != null)
                        {
                            char bedLetter = char.Parse(bedCheckBox.Content.ToString());
                            bedCheckBox.IsChecked = hospitalizationRoom.Any(h => h.Bed == bedLetter);
                        }
                    }
                }
            }
        }
    }
}
