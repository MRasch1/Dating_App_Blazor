using Employee_Crud_Blazor.Context;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace Employee_Crud_Blazor.Data
{
    public class AuthenticationService : IAuthenticationService
    {
        private readonly UsersService _usersService;

        public AuthenticationService(UsersService usersService)
        {
            _usersService = usersService;
        }

        public async Task<bool> AuthenticateAsync(string username, string password)
        {
            // Retrieve the user from your user database or identity provider
            var user = await _usersService.GetUserByUsernameAsync(username);

            if (user != null)
            {
                // Check if the provided password matches the user's stored password
                if (user.Password == password)
                {
                    // Authentication is successful
                    return true;
                }
            }

            // Authentication failed
            return false;
        }

        public async Task SignOutAsync()
        {
            // Implement sign-out logic here, if needed.
        }
    }
}
