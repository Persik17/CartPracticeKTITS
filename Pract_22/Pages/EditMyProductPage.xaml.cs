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
    /// Логика взаимодействия для EditMyProductPage.xaml
    /// </summary>
    public partial class EditMyProductPage : Page
    {
        private static Basket localBasket;
        private static User localUser;
        private static Client localClient;
        private static ProductBasket localpBasket;

        public EditMyProductPage(Basket basket, User user, Client client, ProductBasket pBasket)
        {
            InitializeComponent();


            localBasket = basket;
            localUser = user;
            localClient = client;
            localpBasket = pBasket;

            DataContext = localpBasket;
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(NewCountTb.Text))
            {
                try
                {
                    int quant = Convert.ToInt32(NewCountTb.Text);

                    if (quant > 0)
                    {
                        localpBasket.Quantity = quant;

                        MainWindow.ent.SaveChanges();

                        NavigationService.Navigate(new MyBasketProducts(localBasket, localUser, localClient));
                    }
                    else
                    {
                        NewCountTb.Text = String.Empty;
                        MessageBox.Show("Некорректное кол-во");
                    }
                }
                catch (Exception)
                {
                    NewCountTb.Text = String.Empty;
                    MessageBox.Show("Некорректное кол-во");
                }
            }
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
