using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Employee_Crud_Blazor.Data
{
    public class ProfilePictures
    {
        [Key]
        public int Id { get; set; }
        public string Title { get; set; }
        public string PicURL { get; set; }
        public int UserProfileId { get; set; }
    }
}
