using Employee_Crud_Blazor.Data;
using Microsoft.EntityFrameworkCore;


namespace Employee_Crud_Blazor.Context
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            :base(options)
        {

        }

        public DbSet<Employee> Users { get; set; }
    }
}
