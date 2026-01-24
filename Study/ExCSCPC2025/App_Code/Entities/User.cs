using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public int IdUsers { get; set; }
    public string UserName { get; set; }
    public string PassWord { get; set; }
    public string Email { get; set; }
    public string UserType { get; set; }
    public User(int idUsers, string userName, string passWord, string email, string userType)
    {
        IdUsers = idUsers;
        UserName = userName;
        PassWord = passWord;
        Email = email;
        UserType = userType;
    }
    public User(string userName, string passWord, string email, string userType)
    {
        UserName = userName;
        PassWord = passWord;
        Email = email;
        UserType = userType;
    }
}