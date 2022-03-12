using Pract_22.Pages;
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

namespace Pract_22.LoginPages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void RegBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new RegPage(new User()));
            LogTb.Clear();
            PassBoxPb.Clear();
        }

        private void EnterBtn_Click(object sender, RoutedEventArgs e)
        {
            User user = MainWindow.ent.User.ToList().Find(c => c.Login == LogTb.Text.Trim() && c.Password == PassBoxPb.Password.Trim());

            if (user == null)
            {
                LogTb.Clear();
                PassBoxPb.Clear();

                MessageBox.Show("Такого пользователя не существует или данные введены неправильно");
            }
            else
            {
                Client client = MainWindow.ent.Client.ToList().Find(c => c.UserID == user.ID);

                NavigationService.Navigate(new ProductListPage(user, client));
            }
        }
    }
}
