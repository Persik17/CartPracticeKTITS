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
    /// Логика взаимодействия для AddMyBasketProductPage.xaml
    /// </summary>
    public partial class AddMyBasketProductPage : Page
    {
        private static Basket localBasket;
        private static User localUser;
        private static Client localClient;

        public AddMyBasketProductPage(Basket basket, User user, Client client)
        {
            InitializeComponent();

            localBasket = basket;
            localUser = user;
            localClient = client;

            AddMyBasketProductList.ItemsSource = MainWindow.ent.Product.Where(c => c.IsActive).ToList();
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(QuantityTb.Text) && AddMyBasketProductList.SelectedItems.Count == 1)
            {
                try
                {
                    int quant = Convert.ToInt32(QuantityTb.Text);

                    if (quant > 0)
                    {
                        Product product = AddMyBasketProductList.SelectedItem as Product;

                        ProductBasket productBasket = new ProductBasket()
                        {
                            ProductID = product.ID,
                            Quantity = quant,
                            BasketID = localBasket.ID
                        };

                        MainWindow.ent.ProductBasket.Add(productBasket);
                        MainWindow.ent.SaveChanges();

                        NavigationService.Navigate(new MyBasketProducts(localBasket, localUser, localClient));
                    }
                    else
                    {
                        QuantityTb.Text = String.Empty;
                        MessageBox.Show("Некорректное кол-во");
                    }
                }
                catch (Exception)
                {
                    QuantityTb.Text = String.Empty;
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
