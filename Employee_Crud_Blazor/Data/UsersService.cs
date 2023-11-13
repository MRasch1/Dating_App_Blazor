using Employee_Crud_Blazor.Context;
using Microsoft.EntityFrameworkCore;

namespace Employee_Crud_Blazor.Data
{
    public class UsersService
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public UsersService(ApplicationDbContext applicationDbContext) 
        {
            _applicationDbContext = applicationDbContext;
        }

        //Get All User List
        public async Task<List<Users>> GetAllUsers()
        {
            return await _applicationDbContext.Users.ToListAsync();
        }

        //Add New User Record
        public async Task<bool> AddNewUser(Users user)
        {
            await _applicationDbContext.Users.AddAsync(user);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }

        //Get User Record by Id
        public async Task<Users> GetUserById(int id)
        {
            Users user = await _applicationDbContext.Users.FirstOrDefaultAsync(x => x.Id == id);
            return user;
        }

        public async Task<Users> GetUserByUsernameAsync(string username)
        {
            Users user = await _applicationDbContext.Users.FirstOrDefaultAsync(u => u.Login == username);
            return user;
        }

        //Update User Data
        public async Task<bool> UpdateUserDetails(Users user)
        {
            _applicationDbContext.Users.Update(user);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }

        //Delete User Data
        public async Task<bool> DeleteUser(Users user)
        {
            _applicationDbContext.Users.Remove(user);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }
    }
}
