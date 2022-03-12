using Pract_22.LoginPages;
using System;
using System.Collections.Generic;
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

namespace Pract_22.Pages
{
    /// <summary>
    /// Логика взаимодействия для MainNavPage.xaml
    /// </summary>
    public partial class MainNavPage : Page
    {
        public MainNavPage()
        {
            InitializeComponent();

            NavContentFrame.Navigate(new LoginPage());
        }
    }
}
