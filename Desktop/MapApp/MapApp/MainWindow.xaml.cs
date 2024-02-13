using System.Windows;

namespace MapApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            ContentFrame.Content = new TrackingPage();
        }

        private void btn1_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new TrackingPage();
        }

        private void btn2_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new BedsPage();
        }

        private void AddXYBtn_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new AddXYPage();

        }

        private void DragnDropBtn_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Content = new BedsDragnDropPage();

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (ContentFrame.CanGoBack)
            {
                ContentFrame.GoBack();
            }
        }
    }
}