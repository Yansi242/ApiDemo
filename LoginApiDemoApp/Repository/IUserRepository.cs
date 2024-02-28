using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LoginApiDemoApp.Model;

namespace LoginApiDemoApp.Repository
{
    public interface IUserRepository
    {
        Task<UserResponse> Login(LoginUser model);
    }
}
