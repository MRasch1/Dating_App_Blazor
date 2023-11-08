using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Employee_Crud_Blazor.Data
{
    public class Users
    {
        [Key]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName => $"{FirstName} {LastName}";
        public string Email { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string Password2 { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime DeleteDate { get; set; }
    }
}
