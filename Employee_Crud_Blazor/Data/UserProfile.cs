using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Employee_Crud_Blazor.Data
{
    public class UserProfile
    {
        [Key]
        public int Id { get; set; }
        public string UserName { get; set; }
        public DateTime BirthDate { get; set; }
        public int Height { get; set; }
        public string AboutMe { get; set; }
        public int CityId { get; set; }
        public int GenderId { get; set; }
        public int UsersId { get; set; }
    }
}
