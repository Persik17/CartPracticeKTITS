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
    /// Логика взаимодействия для HistorySalesPage.xaml
    /// </summary>
    public partial class HistorySalesPage : Page
    {
        private static Product localProd;

        public HistorySalesPage(Product product)
        {
            InitializeComponent();

            localProd = product;

            ProductSalesGrid.ItemsSource = MainWindow.ent.ProductSale.Where(c => c.ProductID == localProd.ID).OrderByDescending(c => c.SaleDate).ToList();

            ProdCb.ItemsSource = MainWindow.ent.Product.ToList();
            ProdCb.DisplayMemberPath = "Title";
            ProdCb.SelectedValuePath = "ID";

            ProdCb.SelectedItem = localProd;
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ProdCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int id = (ProdCb.SelectedItem as Product).ID;

            ProductSalesGrid.ItemsSource = MainWindow.ent.ProductSale.Where(c => c.ProductID == id).OrderByDescending(c => c.SaleDate).ToList();
        }
    }
}
