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

        public DbSet<Users> Users { get; set; }

        public DbSet<UserProfile> UserProfile { get; set; }

        public DbSet<Gender> Gender { get; set; }

        public DbSet<City> City { get; set; }

        public DbSet<Likes> Likes { get; set; }

        public DbSet<Messages> Messages { get; set; }

        public DbSet<OldMessages> OldMessages { get; set; }

        public DbSet<ProfilePictures> ProfilePictures { get; set; }
    }
}
