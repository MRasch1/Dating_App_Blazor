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
        public async Task<List<Users>> GetAllEmployees()
        {
            return await _applicationDbContext.Users.ToListAsync();
        }

        //Add New Employee Record
        public async Task<bool> AddNewEmployee(Users employee)
        {
            await _applicationDbContext.Users.AddAsync(employee);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }

        //Get Employee Record by Id
        public async Task<Users> GetEmployeeById(int id)
        {
            Users employee = await _applicationDbContext.Users.FirstOrDefaultAsync(x => x.Id == id);
            return employee;
        }

        //Update Employee Data
        public async Task<bool> UpdateEmployeeDetails(Users employee)
        {
            _applicationDbContext.Users.Update(employee);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }

        //Delete Employee Data
        public async Task<bool> DeleteEmployee(Users employee)
        {
            _applicationDbContext.Users.Remove(employee);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }
    }
}
