using LoginApiDemoApp.Model;
using LoginApiDemoApp.Repository;

namespace LoginApiDemoApp;

public partial class LoginPage : ContentPage
{
	readonly IUserRepository userServer = new UserService();
	public LoginPage()
	{
		InitializeComponent();
	}
	private async void Login_Btn_Clicked(object sender, EventArgs e)
	{
		try
		{
            LoginUser loginUser = new LoginUser();
            {
                loginUser.Email = Entry_Email.Text;
                loginUser.Password = Entry_Password.Text;
            }
            string email = Entry_Email.Text;
            string password = Entry_Password.Text;
            if (string.IsNullOrWhiteSpace(loginUser.Email) || string.IsNullOrWhiteSpace(loginUser.Password))
            {
                await DisplayAlert("Error", "All Fields Required", "Ok");
                return;
            }
            UserResponse user = await userServer.Login(loginUser);
            if (user == null)
            {
                await DisplayAlert("Error", "Credentials are incorrect", "Ok");
                return;
            }
            await Navigation.PushAsync(new MainPage());
            await DisplayAlert("Login", "Successfully Logged in", "Ok");
        }
		catch(Exception ex) 
        {
            throw ex;
		}
    }
}