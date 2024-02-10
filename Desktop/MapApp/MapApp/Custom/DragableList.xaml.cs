using GongSolutions.Wpf.DragDrop;
using MapApp.ModelsDb;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;

namespace MapApp.Custom
{
    /// <summary>
    /// Логика взаимодействия для DragableList.xaml
    /// </summary>
    public partial class DragableList : UserControl, IDropTarget
    {
        public HospitalizationRoom Room { get; set; }
        public Patient? Patient { get; set; }
        public ObservableCollection<Patient> Patients { get; set; }
        public DragableList()
        {
            InitializeComponent();
            DataContext = this;
            Patients = new();
            if (Patient != null)
            {
                Patients.Add(Patient);
            }
        }

        void IDropTarget.DragOver(IDropInfo dropInfo)
        {
            var sourceItem = dropInfo.Data as Patient;

            if (sourceItem != null && Patient == null)
            {
                dropInfo.DropTargetAdorner = DropTargetAdorners.Highlight;
                dropInfo.Effects = DragDropEffects.Move;
            }
        }

        void IDropTarget.Drop(IDropInfo dropInfo)
        {
            var sourceItem = (Patient)dropInfo.Data;
            Patient = sourceItem;
            Patients.Add(Patient);
        }
    }
}
