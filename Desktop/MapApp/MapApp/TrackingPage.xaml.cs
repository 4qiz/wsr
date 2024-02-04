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
        private Dictionary<int, Ellipse> _markers = new();

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

        private async void Page_Loaded(object sender, RoutedEventArgs e)
        {
            _visitorsList = await MockVisitorData.GetVisitors();
        }

        private void Update(object? sender, EventArgs e)
        {
            if (_visitorsList == null)
            {
                return;
            }
            foreach (var item in _skuds)
            {
                item.Value.Children.Clear();
            }
            _markers.Clear();

            var visitorsInside = _visitorsList
                .GroupBy(v => v.PersonCode)
                .Select(group => new
                {
                    PersonCode = group.Key,
                    PersonInside = group.Last().LastSecurityPointDirection == "in",
                    PersonRole = group.Last().PersonRole,
                    SkudNumber = group.Last().LastSecurityPointNumber
                })
                .ToList();

            foreach (var visitor in visitorsInside)
            {
                if (!visitor.PersonInside)
                    continue;
                _markers[visitor.PersonCode] = new Ellipse
                {
                    Width = 10,
                    Height = 10,
                    Fill = visitor.PersonRole == "Сотрудник" ? Brushes.Blue : Brushes.Green,
                    Margin = new Thickness(2),
                };

                _skuds[visitor.SkudNumber].Children.Add(_markers[visitor.PersonCode]);
            }
            
        }
    }
}
