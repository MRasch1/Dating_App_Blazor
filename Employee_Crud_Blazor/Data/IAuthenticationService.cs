namespace Employee_Crud_Blazor.Data
{
    public interface IAuthenticationService
    {
        Task<bool> AuthenticateAsync(string username, string password);
        Task SignOutAsync();
    }
}
