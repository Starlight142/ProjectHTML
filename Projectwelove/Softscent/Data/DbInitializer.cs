using Softscent.Models;
using Microsoft.AspNetCore.Identity;

namespace Softscent.Data;

public static class DbInitializer
{
    public static async Task Initialize(ApplicationDbContext context, UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager)
    {
        context.Database.EnsureCreated();

        // Seed Roles
        string[] roleNames = { "Admin", "User" };
        foreach (var roleName in roleNames)
        {
            if (!await roleManager.RoleExistsAsync(roleName))
            {
                await roleManager.CreateAsync(new IdentityRole(roleName));
            }
        }

        // Seed Admin User
        var adminEmail = "admin@softscent.com";
        if (await userManager.FindByEmailAsync(adminEmail) == null)
        {
            var adminUser = new AppUser
            {
                UserName = adminEmail,
                Email = adminEmail,
                Address = "Softscent HQ, Bangkok, Thailand",
                EmailConfirmed = true
            };
            var result = await userManager.CreateAsync(adminUser, "Admin123!");
            if (result.Succeeded)
            {
                await userManager.AddToRoleAsync(adminUser, "Admin");
            }
        }

        // Look for any products.
        if (context.Products.Any())
        {
            return;   // DB has been seeded
        }

        var products = new Product[]
        {
            new Product{Name="Peppermint Inhaler",Price=5.00m,Description="Classic refreshing peppermint scent.", IsCustomizable=false, ImageUrl="/images/products/peppermint.png"},
            new Product{Name="Lavender Sleep Inhaler",Price=6.50m,Description="Calming lavender for better sleep.", IsCustomizable=false, ImageUrl="/images/products/lavender.png"},
            new Product{Name="Citrus Energy Inhaler",Price=6.00m,Description="Zesty citrus to boost your energy.", IsCustomizable=false, ImageUrl="/images/products/citrus.png"},
            new Product{Name="Traditional Thai Herbal Jar",Price=8.00m,Description="Authentic Thai herbal blend in a traditional jar. Contains clove, star anise, and camphor.", IsCustomizable=false, ImageUrl="/images/products/thai_jar.png"},
            new Product{Name="Custom Inhaler Blend",Price=10.00m,Description="Your unique blend of herbs.", IsCustomizable=true, ImageUrl="/images/products/thai_jar.png"}
        };
        context.Products.AddRange(products);

        var herbs = new Herb[]
        {
            new Herb{Name="Peppermint",Price=0.50m,Benefit="Refreshing"},
            new Herb{Name="Eucalyptus",Price=0.50m,Benefit="Clearing"},
            new Herb{Name="Lavender",Price=1.00m,Benefit="Calming"},
            new Herb{Name="Lemongrass",Price=0.75m,Benefit="Energizing"},
            new Herb{Name="Bergamot",Price=1.20m,Benefit="Uplifting"},
            new Herb{Name="Rosemary",Price=0.80m,Benefit="Focus"},
            // Thai Traditional Herbs
            new Herb{Name="Borneol (Phimsen)",Price=1.50m,Benefit="Cooling & Respiratory Aid"},
            new Herb{Name="Camphor (Karaboon)",Price=1.00m,Benefit="Relieves Dizziness"},
            new Herb{Name="Star Anise (Poy Kak)",Price=1.20m,Benefit="Warming Aroma"},
            new Herb{Name="Clove (Kan Phlu)",Price=1.20m,Benefit="Spicy & Clearing"},
            new Herb{Name="Cinnamon (Ob Choey)",Price=1.00m,Benefit="Stimulates Circulation"},
            new Herb{Name="Nutmeg (Look Jun)",Price=1.50m,Benefit="Relaxing & Soothing"}
        };
        context.Herbs.AddRange(herbs);
        
        await context.SaveChangesAsync();
    }
}
