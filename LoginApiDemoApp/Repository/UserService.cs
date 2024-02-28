using LoginApiDemoApp.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace LoginApiDemoApp.Repository
{
    public class UserService : IUserRepository
    {
        public async Task<UserResponse> Login(LoginUser model)
        {
            var client = new HttpClient();
            //string url = "https://localhost:44378/api/Account/UserLogin?Email=" + email + "&Password=" + password;
            //client.BaseAddress = new Uri(url);
            //HttpResponseMessage responseMessage = await client.GetAsync(client.BaseAddress);

            client.BaseAddress = new Uri("https://localhost:44378/");
            client.DefaultRequestHeaders.Accept.Add(
            new MediaTypeWithQualityHeaderValue("application/json"));
            var responseMessage = await client.PostAsJsonAsync("api/Account/UserLogin", model);
            if (responseMessage.IsSuccessStatusCode)
            {
                string content = responseMessage.Content.ReadAsStringAsync().Result;
                UserResponse user = JsonConvert.DeserializeObject<UserResponse>(content);
                var data = await Task.FromResult(user);
                return data;
            }
            return null;
        }
    }
}