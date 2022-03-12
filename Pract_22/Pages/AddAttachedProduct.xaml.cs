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
    /// Логика взаимодействия для AddAttachedProduct.xaml
    /// </summary>
    public partial class AddAttachedProduct : Page
    {
        private static Product localProd;
        private static User localUser;

        public AddAttachedProduct(Product product, User user)
        {
            InitializeComponent();

            localProd = product;
            localUser = user;

            AttachedProductList.ItemsSource = MainWindow.ent.Product.Where(c => c.IsActive && c.ID != localProd.ID).ToList();
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            Product product = AttachedProductList.SelectedItem as Product;

            if (product != null)
            {
                if (AttachedProductList.SelectedItems.Count > 0)
                {
                    var res = MessageBox.Show("Вы точно хотите добавить выбранные элементы?","Да или нет",MessageBoxButton.YesNo);
                    if (res == MessageBoxResult.Yes)
                    {
                        foreach (Product item in AttachedProductList.SelectedItems)
                        {
                            AttachedProduct attachedProduct = new AttachedProduct
                            {
                                MainProductID = localProd.ID,
                                AttachedProductID = item.ID
                            };

                            MainWindow.ent.AttachedProduct.Add(attachedProduct);
                        }
                        MainWindow.ent.SaveChanges();

                        NavigationService.Navigate(new AddEditPage(localProd, true, localUser));
                    }
                }
            }
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
