using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        private static Product localProd;
        private static User localUser;
        private static bool localIsEdit;

        public AddEditPage(Product product, bool isEdit, User user)
        {
            InitializeComponent();

            localProd = product;
            localIsEdit = isEdit;
            localUser = user;

            DataContext = localProd;

            SetComboBoxItems();
            UserSettings();
        }

        private void UserSettings()
        {
            if (localUser.RoleID == 1)
            {
                if (localIsEdit)
                    IdTb.IsReadOnly = true;
                else
                {
                    IdTb.Visibility = Visibility.Hidden;
                    idLbl.Visibility = Visibility.Hidden;
                }
                ManufacTb.Visibility = Visibility.Hidden;
                AttachProdList.ItemsSource = MainWindow.ent.AttachedProduct.Where(c => c.MainProductID == localProd.ID && c.Product1.IsActive).ToList();
            }
            else if(localUser.RoleID == 2)
            {
                SaveBtn.Visibility = Visibility.Hidden;
                HistoryBtn.Visibility = Visibility.Hidden;
                RemoveBtn.Visibility = Visibility.Hidden;
                SaveBtn.Visibility = Visibility.Hidden;
                AttachedProductSp.Visibility = Visibility.Hidden;
                EditProductImage.Visibility = Visibility.Hidden;
                ManufacCb.Visibility = Visibility.Hidden;

                ManufacCb.Height = 0;
                ManufacCb.Width = 0;
                ManufacCb.Margin = new Thickness(0);

                TitleTb.IsReadOnly = true;
                CostTb.IsReadOnly = true;
                DescTb.IsReadOnly = true;
                IdTb.Visibility = Visibility.Hidden;
                idLbl.Visibility = Visibility.Hidden;
                AttachedLbl.Visibility = Visibility.Hidden;
                ActiveCb.Visibility = Visibility.Hidden;
            }
        }

        private bool CheckCost()
        {
            try
            {
                decimal cost = Convert.ToDecimal(CostTb.Text.Replace(".", ","));

                if (cost < 0)
                {
                    MessageBox.Show("Цена не может быть отрицательная");
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception)
            {
                MessageBox.Show($"Цена не может содержать буквы - {CostTb.Text}");
                CostTb.Text = String.Empty;
                return false;
            }
        }

        private void SetComboBoxItems()
        {
            ManufacCb.Items.Add("Нет производителя");

            foreach (var item in MainWindow.ent.Manufacturer)
            {
                ManufacCb.Items.Add(item.Name);
            }
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (CheckCost() && !string.IsNullOrEmpty(TitleTb.Text) && ManufacCb.SelectedIndex != -1)
            {
                if (localIsEdit)
                {
                    localProd.Title = TitleTb.Text;
                    localProd.Description = DescTb.Text;
                    localProd.Cost = Convert.ToDecimal(CostTb.Text.Replace(".", ","));
                    if (ManufacCb.SelectedIndex != 0)
                        localProd.ManufacturerID = ManufacCb.SelectedIndex;
                    localProd.IsActive = (bool)ActiveCb.IsChecked;
                }
                else
                {
                    Product product = new Product();

                    product.Title = TitleTb.Text;
                    product.Description = DescTb.Text;
                    product.Cost = Convert.ToDecimal(CostTb.Text.Replace(".", ","));
                    if (ManufacCb.SelectedIndex != 0)
                        product.ManufacturerID = ManufacCb.SelectedIndex;
                    product.IsActive = (bool)ActiveCb.IsChecked;

                    MainWindow.ent.Product.Add(product);
                }
                MainWindow.ent.SaveChanges();
                NavigationService.Navigate(new ProductListPage(localUser));
            }
            else
            {
                MessageBox.Show("Поля: Цена, Название или Производитель имеют некорректное значение!");
            }
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductListPage(localUser));
        }

        private void Image_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ClickCount == 2)
            {
                Image img = sender as Image;

                if (img.DataContext is AttachedProduct currentProd)
                {
                    NavigationService.Navigate(new AddEditPage(currentProd.Product1, true, localUser));
                }
            }
        }

        private void AddImageBtn_Click(object sender, RoutedEventArgs e)
        {
            if (localProd.ID != 0)
            {
                OpenFileDialog openFile = new OpenFileDialog()
                {
                    Filter = "*.png|*.jpg"
                };

                if (openFile.ShowDialog().GetValueOrDefault())
                {
                    ProductPhoto productPhoto = new ProductPhoto()
                    {
                        ProductID = localProd.ID,
                        PhotoPath = new BitmapImage(new Uri(openFile.FileName)).ToString()
                    };

                    List<ProductPhoto> product = MainWindow.ent.ProductPhoto.Where(c => c.PhotoPath == productPhoto.PhotoPath && c.ProductID == productPhoto.ProductID).ToList();
                    if (product.Count == 0)
                    {
                        MainWindow.ent.ProductPhoto.Add(productPhoto);
                        MainWindow.ent.SaveChanges();
                    }
                    else
                    {
                        MessageBox.Show("Это фото уже имеется в дополнительных, добавление невозможно");
                    }
                }
            }
            else
            {
                MessageBox.Show("Перед добавлением доп. картинок добавьте сам продукт");
            }
        }

        private void ChangeImageBtn_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFile = new OpenFileDialog()
            {
                Filter = "*.png|*.jpg"
            };

            if (openFile.ShowDialog().GetValueOrDefault())
            {
                localProd.MainImagePath = new BitmapImage(new Uri(openFile.FileName)).ToString();
                ProductImage.Source = new BitmapImage(new Uri(openFile.FileName));

                MainWindow.ent.SaveChanges();
            }
        }

        private void AddAttachedProductBtn_Click(object sender, RoutedEventArgs e)
        {
            if (CheckCost() && !string.IsNullOrEmpty(TitleTb.Text) && ManufacCb.SelectedIndex != -1)
            {
                Product pr = MainWindow.ent.Product.Find(localProd.ID);
                if (pr == null)
                {
                    MainWindow.ent.Product.Add(pr);
                    MainWindow.ent.SaveChanges();

                    NavigationService.Navigate(new AddAttachedProduct(pr, localUser));
                }
                else
                {
                    NavigationService.Navigate(new AddAttachedProduct(localProd, localUser));
                }
            }
            else
            {
                MessageBox.Show("Перед добавлением рекомендуемого продукта, заполните поля: Цена, Название или Производитель!");
            }
        }

        private void RemoveAttachedProductBtn_Click(object sender, RoutedEventArgs e)
        {
            if (AttachProdList.SelectedItem is AttachedProduct pr)
            {
                var result = MessageBox.Show("Вы действительно хотите удалить?", "Да или Нет", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    MainWindow.ent.AttachedProduct.Remove(pr);
                    MainWindow.ent.SaveChanges();

                    AttachProdList.ItemsSource = MainWindow.ent.AttachedProduct.Where(c => c.MainProductID == localProd.ID && c.Product1.IsActive).ToList();
                }
            }
        }

        private void RemoveBtn_Click(object sender, RoutedEventArgs e)
        {
            var result = MessageBox.Show("Вы действительно хотите удалить этот продукт (все прикрепленные рекомендуемые продукты тоже будут удалены)?", "Да или Нет", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                List<ProductSale> product = MainWindow.ent.ProductSale.Where(c => c.ProductID == localProd.ID).ToList();

                if (product.Count == 0)
                {
                    MainWindow.ent.ProductSale.Where(c => c.ProductID == localProd.ID);
                    if (AttachProdList.Items.Count > 0)
                    {
                        List<AttachedProduct> at = MainWindow.ent.AttachedProduct.Where(c => c.MainProductID == localProd.ID).ToList();

                        foreach (AttachedProduct p in at)
                        {
                            MainWindow.ent.AttachedProduct.Remove(p);
                        }
                    }
                    MainWindow.ent.Product.Remove(localProd);
                    MainWindow.ent.SaveChanges();

                    NavigationService.Navigate(new ProductListPage(localUser));
                }
                else
                {
                    MessageBox.Show("Товар не может быть удален, т.к. он регистрируется в продажах");
                }
            }
        }

        private void HistoryBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new HistorySalesPage(localProd));
        }
    }
}
