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
    /// Логика взаимодействия для ProductListPage.xaml
    /// </summary>
    public partial class ProductListPage : Page
    {
        private static List<Product> products = new List<Product>();
        private static List<Manufacturer> manufacturers = new List<Manufacturer>();

        private static readonly HashSet<Product> hashsetProducts = new HashSet<Product>();

        private static User localUser;
        private static Client localClient;

        public ProductListPage(User user)
        {
            InitializeComponent();

            products = MainWindow.ent.Product.ToList();
            manufacturers = MainWindow.ent.Manufacturer.ToList();
            ProductList.ItemsSource = MainWindow.ent.Product.ToList();

            localUser = user;

            UserSettings();
            SetComboBoxItems();
            GetCount();
        }

        public ProductListPage(User user, Client client)
        {
            InitializeComponent();

            products = MainWindow.ent.Product.ToList();
            manufacturers = MainWindow.ent.Manufacturer.ToList();
            ProductList.ItemsSource = MainWindow.ent.Product.ToList();

            localUser = user;
            localClient = client;

            UserSettings();
            SetComboBoxItems();
            GetCount();
        }

        private void UserSettings()
        {
            if (localUser.RoleID == 1)
            {
                AddBasketBtn.Visibility = Visibility.Hidden;
            }
            else if(localUser.RoleID == 2)
            {
                AddBtn.Visibility = Visibility.Hidden;
            }
        }

        private void GetCount()
        {
            CountTb.Text = ProductList.Items.Count.ToString();
            ActualCountTb.Text = MainWindow.ent.Product.Count().ToString();
        }

        private void SetComboBoxItems()
        {
            FiltrCb.Items.Add("Все элементы");

            foreach (var item in manufacturers)
            {
                FiltrCb.Items.Add(item.Name);
            }
        }

        private void SettingList()
        {
            hashsetProducts.Clear();

            List<Product> nameOrDescProducts = new List<Product>();
            List<Product> manufacProducts = new List<Product>();
            List<Product> prodList = new List<Product>();

            if (!string.IsNullOrEmpty(NameOrDescriptionTb.Text))
            {
                nameOrDescProducts = products.Where(c => c.Title.StartsWith(NameOrDescriptionTb.Text) || (c.Description != null && c.Description.StartsWith(NameOrDescriptionTb.Text))).ToList();
            }
            else
            {
                nameOrDescProducts = products.ToList();
            }

            if (FiltrCb.SelectedIndex != 0 && FiltrCb.SelectedIndex != -1)
            {
                manufacProducts = products.Where(c => c.ManufacturerID == FiltrCb.SelectedIndex).ToList();
            }
            else if(FiltrCb.SelectedIndex == 0)
            {
                manufacProducts = products.ToList();
            }

            if (!string.IsNullOrEmpty(NameOrDescriptionTb.Text) && FiltrCb.SelectedIndex != 0 && FiltrCb.SelectedIndex != -1)
            {
                prodList = hashsetProducts.Concat(nameOrDescProducts)
                                          .Concat(manufacProducts).Distinct().ToList();
            }
            else if (string.IsNullOrEmpty(NameOrDescriptionTb.Text) && (FiltrCb.SelectedIndex != 0 && FiltrCb.SelectedIndex != -1))
            {
                prodList = hashsetProducts.Concat(manufacProducts).Distinct().ToList();
            }
            else if (!string.IsNullOrEmpty(NameOrDescriptionTb.Text) && (FiltrCb.SelectedIndex == 0 || FiltrCb.SelectedIndex == -1))
            {
                prodList = hashsetProducts.Concat(nameOrDescProducts).Distinct().ToList();
            }
            else
            {
                prodList = MainWindow.ent.Product.ToList();
            }

            if ((bool)UpRb.IsChecked)
            {
                ProductList.ItemsSource = prodList.OrderByDescending(i => i.Cost).ToList();
            }
            else if ((bool)DownRb.IsChecked)
            {
                ProductList.ItemsSource = prodList.OrderBy(i => i.Cost).ToList();
            }
            else
            {
                ProductList.ItemsSource = prodList.ToList();
            }

            GetCount();
        }

        private void FiltrCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SettingList();
        }

        private void NameOrDescriptionTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            SettingList();
        }

        private void UpRb_Checked(object sender, RoutedEventArgs e)
        {
            SettingList();
        }

        private void DownRb_Checked(object sender, RoutedEventArgs e)
        {
            SettingList();
        }

        private void ContentClick(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;

            switch (button.Name)
            {
                case "AddBtn":
                    NavigationService.Navigate(new AddEditPage(new Product(), false, localUser));
                    break;
                case "AddBasketBtn":
                    Basket basket = MainWindow.ent.Basket.ToList().Find(c => c.UserID == localUser.ID);

                    if (basket != null)
                    {
                        NavigationService.Navigate(new MyBasketProducts(basket, localUser, localClient));
                    }
                    else
                    {
                        Basket newBasket = new Basket()
                        {
                            UserID = localUser.ID,
                            DateBasket = DateTime.Now,
                        };

                        MainWindow.ent.Basket.Add(newBasket);
                        MainWindow.ent.SaveChanges();

                        NavigationService.Navigate(new MyBasketProducts(newBasket, localUser, localClient));
                    }
                    break;
                default:
                    break;
            }
        }

        private void StackPanel_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ClickCount == 2)
            {
                StackPanel stackPanel = sender as StackPanel;

                if (stackPanel.DataContext is Product currentProd)
                {
                    NavigationService.Navigate(new AddEditPage(currentProd, true, localUser));
                }
            }
        }
    }
}
