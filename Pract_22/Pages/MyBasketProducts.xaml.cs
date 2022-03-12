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
    /// Логика взаимодействия для MyBasketProducts.xaml
    /// </summary>
    public partial class MyBasketProducts : Page
    {
        private static User localUser;
        private static Basket localBasket;
        private static Client localClient;

        public MyBasketProducts(Basket basket, User user, Client client)
        {
            InitializeComponent();

            localUser = user;
            localBasket = basket;
            localClient = client;

            MyBasketList.ItemsSource = MainWindow.ent.ProductBasket.Where(c => c.BasketID == localBasket.ID).ToList();

            DataContext = localClient;

            SetFinalCost();
        }

        private void SetFinalCost()
        {
            FinalSummTb.Text = MainWindow.ent.ProductBasket.Where(c => c.BasketID == localBasket.ID).Sum(c => c.Product.Cost * c.Quantity).ToString();
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddMyBasketProductPage(localBasket, localUser, localClient));
        }

        private void SaveMyInfoBtn_Click(object sender, RoutedEventArgs e)
        {
            if (MyInfoSp.IsEnabled)
            {
                if (!string.IsNullOrEmpty(NameTb.Text) && !string.IsNullOrEmpty(SurnameTb.Text) &&
                    !string.IsNullOrEmpty(MiddlenameTb.Text) && !string.IsNullOrEmpty(PhoneTb.Text) &&
                    !string.IsNullOrEmpty(AddressTb.Text))
                {
                    localClient.LastName = NameTb.Text;
                    localClient.LastName = SurnameTb.Text;
                    localClient.Patronymic = MiddlenameTb.Text;
                    localClient.Phone = PhoneTb.Text;
                    localClient.Address = AddressTb.Text;

                    MainWindow.ent.SaveChanges();

                    MyInfoSp.IsEnabled = false;
                }
                else
                {
                    MessageBox.Show("Все поля являются обязательными");
                }
            }
        }

        private void EditMyInfoBtn_Click(object sender, RoutedEventArgs e)
        {
            MyInfoSp.IsEnabled = true;
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductListPage(localUser));
        }

        private void EditBtn_Click(object sender, RoutedEventArgs e)
        {
            if (MyBasketList.SelectedItem != null)
            {
                NavigationService.Navigate(new EditMyProductPage(localBasket, localUser, localClient, MyBasketList.SelectedItem as ProductBasket));
            }
        }

        private void DeleteBtn_Click(object sender, RoutedEventArgs e)
        {
            if (MyBasketList.SelectedItem != null)
            {
                var res = MessageBox.Show("Вы правда хотите удалить продукт из корзины?","Да или нет",MessageBoxButton.YesNo);
                if (res == MessageBoxResult.Yes)
                {
                    MainWindow.ent.ProductBasket.Remove(MyBasketList.SelectedItem as ProductBasket);
                    MainWindow.ent.SaveChanges();

                    MyBasketList.ItemsSource = MainWindow.ent.ProductBasket.Where(c => c.BasketID == localBasket.ID).ToList();
                    SetFinalCost();
                }
            }
        }
    }
}
