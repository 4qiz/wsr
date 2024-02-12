﻿using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

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
            ContentFrame.GoBack();
        }
    }
}