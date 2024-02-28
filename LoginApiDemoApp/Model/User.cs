
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LoginApiDemoApp.Model
{
    public class User
    {
        public int id { get; set; }
        public string fullName { get; set; }
        public string email { get; set; }
        public string message { get; set; }
    }
    public class UserResponse
    {
        public User data { get; set; }
        public bool success { get; set; }
        public string message { get; set; }
    }
    public class LoginUser
    {
        [Required(ErrorMessage = "Email id required!")]
        public string? Email { get; set; }
        [Required(ErrorMessage = "Password required!")]
        public string? Password { get; set; }
    }
}
