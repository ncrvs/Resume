using System.Windows;
using System.Windows.Controls;

namespace WeekendPlanner
{
    public partial class MainWindow : Window
    {
 
        private string selectedActivity = "";

        public MainWindow()
        {
            InitializeComponent();
        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {

            RadioButton rb = sender as RadioButton;

            if (rb != null)
            {
                selectedActivity = rb.Content.ToString();

                MessageBox.Show("Вы выбрали занятие: " + selectedActivity, "Выбор занятия");

                tbResult.Text = "Текущее занятие: " + selectedActivity;
            }
        }

        private void btnGenerate_Click(object sender, RoutedEventArgs e)
        {

            if (dpDate.SelectedDate == null)
            {
                MessageBox.Show("Пожалуйста, выберите дату!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (cbType.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста, выберите тип отдыха!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (string.IsNullOrEmpty(selectedActivity))
            {
                MessageBox.Show("Пожалуйста, выберите основное занятие!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            string dateStr = dpDate.SelectedDate.Value.ToString("dd.MM.yyyy");
            string typeStr = ((ComboBoxItem)cbType.SelectedItem).Content.ToString();


            string placeStr = "не указано";
            if (lbPlace.SelectedItem != null)
            {
                placeStr = ((ListBoxItem)lbPlace.SelectedItem).Content.ToString();
            }

            string extra = "";
            if (chkFood.IsChecked == true) extra += "вкусная еда, ";
            if (chkPhoto.IsChecked == true) extra += "фотосъёмка, ";
            if (chkMusic.IsChecked == true) extra += "музыка, ";

            if (extra.Length > 0)
                extra = extra.TrimEnd(' ', ',');
            else
                extra = "без особых пожеланий";

            tbResult.Text = $"ГОТОВЫЙ ПЛАН НА ВЫХОДНОЙ:\n" +
                            $"• Дата: {dateStr}\n" +
                            $"• Тип отдыха: {typeStr}\n" +
                            $"• Занятие: {selectedActivity}\n" +
                            $"• Локация: {placeStr}\n" +
                            $"• Пожелания: {extra}";
        }
    }
}