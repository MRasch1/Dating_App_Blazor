using System.ComponentModel.DataAnnotations;

namespace Employee_Crud_Blazor.Data
{
    public class City
    {
        [Key]
        public int Id { get; set; }
        public string CityName { get; set; }
    }
}
