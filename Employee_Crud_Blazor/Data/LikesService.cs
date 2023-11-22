using Employee_Crud_Blazor.Context;
using Microsoft.EntityFrameworkCore;

namespace Employee_Crud_Blazor.Data
{
    public class LikesService
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public LikesService(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        //Add New Likes Record
        public async Task<bool> AddNewLikes(Likes likes)
        {
            await _applicationDbContext.Likes.AddAsync(likes);
            await _applicationDbContext.SaveChangesAsync();
            return true;
        }

        public async Task<Likes> GetLikesByLiker(int liker)
        {
            Likes likes = await _applicationDbContext.Likes.FirstOrDefaultAsync(x => x.Liker == liker);
            return likes;
        }

        //Get all Likes records
        public async Task<List<Likes>> GetAllLikes()
        {
            return await _applicationDbContext.Likes.ToListAsync();
        }
    }
}
