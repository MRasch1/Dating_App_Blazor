using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Employee_Crud_Blazor.Data
{
    public class OldMessages
    {
        [Key]
        public int Id { get; set; }
        public int Sender { get; set; }
        public int Receiver { get; set; }
        public int Status { get; set; }
        public string Msg { get; set; }
    }
}
