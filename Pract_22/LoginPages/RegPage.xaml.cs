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
    /// Логика взаимодействия для RegPage.xaml
    /// </summary>
    public partial class RegPage : Page
    {
        //fix reg client

        private static User localUser;
        public RegPage(User user)
        {
            InitializeComponent();

            localUser = user;
        }

        private void CreateAcc_Click(object sender, RoutedEventArgs e)
        {
            if (PasswordPb.Text != null && LoginTb.Text != null)
            {
                User login = MainWindow.ent.User.ToList().Find(c => c.Login == LoginTb.Text);

                if (login == null)
                {
                    if (LoginSetting() == 4)
                    {
                        if (!string.IsNullOrEmpty(NameTb.Text) && !string.IsNullOrEmpty(SurnameTB.Text) &&
                            !string.IsNullOrEmpty(MiddlenameTb.Text) && !string.IsNullOrEmpty(PhoneTb.Text))
                        {
                            localUser.Login = LoginTb.Text;
                            localUser.Password = PasswordPb.Text;
                            localUser.RoleID = 2;

                            MainWindow.ent.User.Add(localUser);
                            MainWindow.ent.SaveChanges();

                            Client client = new Client()
                            {
                                FirstName = NameTb.Text,
                                LastName = SurnameTB.Text,
                                Patronymic = MiddlenameTb.Text,
                                Phone = PhoneTb.Text,
                                GenderCode = "М",
                                RegistrationDate = DateTime.Now,
                                UserID = localUser.ID
                            };

                            MainWindow.ent.Client.Add(client);
                            MainWindow.ent.SaveChanges();

                            NavigationService.GoBack();
                        }
                        else
                        {
                            MessageBox.Show("Не все поля заполнены");
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Такой логин уже существует");
                }
            }
            else
            {
                MessageBox.Show("Данные введены некорректно");
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private int LoginSetting()
        {
            int flag = 0;
            if (PasswordPb.Text.Length >= 6)
            {
                flag++;
            }
            else
            {
                MessageBox.Show("Пароль должен быть длинее 6 символов");
            }

            int count = 0;
            int countUpper = 0;

            char[] chars = PasswordPb.Text.ToCharArray();

            foreach (var symbol in PasswordPb.Text)
            {
                if (char.IsDigit(symbol))
                {
                    count++;
                }
                if (char.IsUpper(symbol))
                {
                    countUpper++;
                }
            }

            if (countUpper >= 1)
            {
                flag++;
            }
            else
            {
                MessageBox.Show("Пароль должен содержать хотя бы одну прописную букву");
            }

            if (count >= 1)
            {
                flag++;
            }
            else
            {
                MessageBox.Show("Пароль должен иметь хотя бы 1 цифру");
            }

            if (chars.Contains('!') || chars.Contains('@') ||
                chars.Contains('^') || chars.Contains('%') ||
                chars.Contains('$') || chars.Contains('#'))
            {
                flag++;
            }
            else
            {
                MessageBox.Show("Пароль должен содержать следующие символы: !@#$%^");
            }

            return flag;
        }
    }
}
