using Softscent.Models;

namespace Softscent.Data;

public static class DbInitializer
{
    public static void Initialize(ApplicationDbContext context)
    {
        context.Database.EnsureCreated();

        // Look for any products.
        if (context.Products.Any())
        {
            return;   // DB has been seeded
        }

        var products = new Product[]
        {
            new Product{Name="Peppermint Inhaler",Price=5.00m,Description="Classic refreshing peppermint scent.", IsCustomizable=false},
            new Product{Name="Lavender Sleep Inhaler",Price=6.50m,Description="Calming lavender for better sleep.", IsCustomizable=false},
            new Product{Name="Citrus Energy Inhaler",Price=6.00m,Description="Zesty citrus to boost your energy.", IsCustomizable=false},
            new Product{Name="Custom Inhaler Blend",Price=10.00m,Description="Your unique blend of herbs.", IsCustomizable=true}
        };
        context.Products.AddRange(products);

        var herbs = new Herb[]
        {
            new Herb{Name="Peppermint",Price=0.50m,Benefit="Refreshing"},
            new Herb{Name="Eucalyptus",Price=0.50m,Benefit="Clearing"},
            new Herb{Name="Lavender",Price=1.00m,Benefit="Calming"},
            new Herb{Name="Lemongrass",Price=0.75m,Benefit="Energizing"},
            new Herb{Name="Bergamot",Price=1.20m,Benefit="Uplifting"},
            new Herb{Name="Rosemary",Price=0.80m,Benefit="Focus"}
        };
        context.Herbs.AddRange(herbs);
        
        context.SaveChanges();
    }
}
