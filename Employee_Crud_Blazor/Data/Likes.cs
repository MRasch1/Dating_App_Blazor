using System.ComponentModel.DataAnnotations;

namespace Employee_Crud_Blazor.Data
{
    public class Likes
    {
        [Key]
        public int Id { get; set; }
        public int Liker { get; set; }
        public int Likee { get; set; }
        public int Status { get; set; }
    }
}
