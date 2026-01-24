using System;
using System.Security.Cryptography;
using System.Text;

public static class PasswordHasher
{
    // Simple SHA256 Hashing for legacy application compatibility
    public static string HashPassword(string password)
    {
        using (SHA256 sha256Hash = SHA256.Create())
        {
            // ComputeHash - returns byte array
            byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

            // Convert byte array to a string
            return Convert.ToBase64String(bytes);
        }
    }

    public static bool VerifyPassword(string hashedPassword, string providedPassword)
    {
        // Hash the input password and compare
        string newHash = HashPassword(providedPassword);
        return hashedPassword == newHash;
    }
}
