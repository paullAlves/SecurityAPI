using System.Collections.Generic;
using System.Linq;

namespace SecurityAPI.Repository
{
    public static class UserRepository
    {
        public static User Get(string username, string password)
        {
            var users = new List<User>();
            users.Add(new User { Id = 1, UserName = "batman", Password = "batman", Role = "manager", Active = true });
            users.Add(new User { Id = 2, UserName = "robin", Password = "robin", Role = "employee", Active = true });
            return users.Where(x => x.UserName.ToLower() == username.ToLower() && x.Password == x.Password).FirstOrDefault();
        }
    }
}
