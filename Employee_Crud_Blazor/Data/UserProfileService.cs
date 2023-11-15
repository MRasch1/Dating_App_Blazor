using Employee_Crud_Blazor.Context;
using Microsoft.EntityFrameworkCore;

namespace Employee_Crud_Blazor.Data
{
    public class UserProfileService
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public UserProfileService(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        //Get All UserProfile List
        public async Task<List<UserProfile>> GetAllUserProfiles()
        {
            return await _applicationDbContext.UserProfile.ToListAsync();
        }

        //Add New UserProfile Record
        public async Task<bool> AddNewUserProfile(UserProfile userProfile)
        {
            await _applicationDbContext.UserProfile.AddAsync(userProfile);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }

        //Get UserProfile Record by Id
        public async Task<UserProfile> GetUserProfileById(int id)
        {
            UserProfile userProfile = await _applicationDbContext.UserProfile.FirstOrDefaultAsync(x => x.Id == id);
            return userProfile;
        }

        //Get UserProfile Record by UserId
        public async Task<UserProfile> GetUserProfileByUserId(int userId)
        {
            UserProfile userProfile = await _applicationDbContext.UserProfile.FirstOrDefaultAsync(x => x.UsersId == userId);
            return userProfile;
        }

        public async Task<UserProfile> GetUserProfileByUsernameAsync(string username)
        {
            UserProfile userProfile = await _applicationDbContext.UserProfile.FirstOrDefaultAsync(u => u.UserName == username);
            return userProfile;
        }

        //Update UserProfile Data
        public async Task<bool> UpdateUserProfileDetails(UserProfile userProfile)
        {
            _applicationDbContext.UserProfile.Update(userProfile);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }

        //Delete UserProfile Data
        public async Task<bool> DeleteUserProfile(UserProfile userProfile)
        {
            _applicationDbContext.UserProfile.Remove(userProfile);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }
    }
}
