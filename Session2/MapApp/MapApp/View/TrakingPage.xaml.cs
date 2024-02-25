using MapApp.Connection;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace MapApp.View
{
    /// <summary>
    /// Логика взаимодействия для TrakingPage.xaml
    /// </summary>
    public partial class TrakingPage : Page
    {
        public Dictionary<int, WrapPanel> _skuds { get; set; } = new();
        public List<Visitor>? Visitors { get; set; } = null;
        public TrakingPage()
        {
            InitializeComponent();

            for (int i = 0; i < 23; i++)
            {
                _skuds[i] = (WrapPanel)mapCanvas.Children[i];
            }

            var timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(3);
            timer.Tick += Update;
            timer.Start();

        }

        private async void Update(object? sender, EventArgs e)
        {
            try
            {
                foreach (var wrapPanel in _skuds)
                {
                    wrapPanel.Value.Children.Clear();
                }
                hall.Children.Clear();

                Visitors = await ApiConnection.GetVisitors();
                if (Visitors == null)
                {
                    MessageBox.Show("Нет посетителей");
                    return;
                }

                var visitorsLastValue = Visitors.GroupBy(v => v.PersonCode).Select(g => new
                {
                    PersonCode = g.Key,
                    LastVisit = g.Last()
                });
                var visitorsInside = visitorsLastValue
                    .Where(v => v.LastVisit.LastSecurityPointDirection == "in").ToList();
                var visitorsOutside = visitorsLastValue
                    .Where(v => v.LastVisit.LastSecurityPointDirection == "out").ToList();
                foreach (var visitor in visitorsInside)
                {
                    _skuds[visitor.LastVisit.LastSecurityPointNumber].Children.Add(
                        new Ellipse
                        {
                            Fill = visitor.LastVisit.PersonRole == "employee" ? Brushes.Blue : Brushes.Green,
                            Width = 10,
                            Height = 10,
                            Margin = new Thickness(3)
                        });
                }
                foreach (var visitor in visitorsOutside)
                {
                    hall.Children.Add(
                        new Ellipse
                        {
                            Fill = visitor.LastVisit.PersonRole == "employee" ? Brushes.Blue : Brushes.Green,
                            Width = 10,
                            Height = 10,
                            Margin = new Thickness(3)
                        });
                }

            }
            catch (Exception)
            {
                MessageBox.Show("Ошибка подключения");
            }
        }
    }
}
