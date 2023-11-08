using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Employee_Crud_Blazor.Data
{
    public class Gender
    {
        [Key]
        public int Id { get; set; }
        public string GenderName { get; set; }
        public string Elaborate { get; set; }
    }
}
