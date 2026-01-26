using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Represents a system user.
/// </summary>
public class User
{
    /// <summary>
    /// Gets or sets the user ID.
    /// </summary>
    public int IdUsers { get; set; }

    /// <summary>
    /// Gets or sets the username.
    /// </summary>
    public string UserName { get; set; }

    /// <summary>
    /// Gets or sets the user's password.
    /// </summary>
    public string PassWord { get; set; }

    /// <summary>
    /// Gets or sets the user's email address.
    /// </summary>
    public string Email { get; set; }

    /// <summary>
    /// Gets or sets the user type (e.g., Administrator, User).
    /// </summary>
    public string UserType { get; set; }

    /// <summary>
    /// Initializes a new instance of the <see cref="User"/> class with an ID.
    /// </summary>
    public User(int idUsers, string userName, string passWord, string email, string userType)
    {
        IdUsers = idUsers;
        UserName = userName;
        PassWord = passWord;
        Email = email;
        UserType = userType;
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="User"/> class without an ID.
    /// </summary>
    public User(string userName, string passWord, string email, string userType)
    {
        UserName = userName;
        PassWord = passWord;
        Email = email;
        UserType = userType;
    }
}