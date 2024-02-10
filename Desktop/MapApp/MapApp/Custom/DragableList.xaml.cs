using GongSolutions.Wpf.DragDrop;
using MapApp.ModelsDb;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MapApp.Custom
{
    /// <summary>
    /// Логика взаимодействия для DragableList.xaml
    /// </summary>
    public partial class DragableList : UserControl
    {
        public DragableList()
        {
            InitializeComponent();
            DataContext = new ExampleViewModel();
        }
    }
}
