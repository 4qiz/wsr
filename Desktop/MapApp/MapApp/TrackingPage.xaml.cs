using MapApp.Data;
using MapApp.Models;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace MapApp
{
    /// <summary>
    /// Логика взаимодействия для TrackingPage.xaml
    /// </summary>
    public partial class TrackingPage : Page
    {
        private Dictionary<int, WrapPanel> _skuds = new();

        List<Visitor> _visitorsList;

        public TrackingPage()
        {
            InitializeComponent();

            for (int i = 0; i < 23; i++)
            {
                _skuds[i] = (WrapPanel)mapCanvas.Children[i];
            }

            var timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromMilliseconds(3000);
            timer.Tick += Update;
            timer.Start();
        }



        private async void Update(object? sender, EventArgs e)
        {
            try
            {
                _visitorsList = await MockVisitorData.GetVisitors();

            }
            catch (Exception)
            {
                return;
            }
            if (_visitorsList == null)
            {
                return;
            }
            foreach (var item in _skuds)
            {
                item.Value.Children.Clear();
            }

            var visitorsInside = _visitorsList
                .GroupBy(v => v.PersonCode)
                .Select(group => new
                {
                    PersonCode = group.Key,
                    LastVisit = group.Last()
                })
                .Where(visitor => visitor.LastVisit.LastSecurityPointDirection == "in")
                .ToList();

            foreach (var visitor in visitorsInside)
            {
                var personRole = visitor.LastVisit.PersonRole;
                var skudNumber = visitor.LastVisit.LastSecurityPointNumber;
                var markerColor = personRole == "Сотрудник" ? Brushes.Blue : Brushes.Green;

                _skuds[skudNumber].Children.Add(new Ellipse
                {
                    Width = 10,
                    Height = 10,
                    Fill = markerColor,
                    Margin = new Thickness(2),
                });
            }
        }
    }
}
