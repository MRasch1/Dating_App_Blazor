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

        //Get All Employee List
        public async Task<List<Users>> GetAllUsers()
        {
            return await _applicationDbContext.Users.ToListAsync();
        }

        //Add New Employee Record
        public async Task<bool> AddNewUser(Users user)
        {
            await _applicationDbContext.Users.AddAsync(user);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }

        //Get Employee Record by Id
        public async Task<Users> GetUserById(int id)
        {
            Users user = await _applicationDbContext.Users.FirstOrDefaultAsync(x => x.Id == id);
            return user;
        }

        //Update Employee Data
        public async Task<bool> UpdateUserDetails(Users user)
        {
            _applicationDbContext.Users.Update(user);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }

        //Delete Employee Data
        public async Task<bool> DeleteUser(Users user)
        {
            _applicationDbContext.Users.Remove(user);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }
    }
}
