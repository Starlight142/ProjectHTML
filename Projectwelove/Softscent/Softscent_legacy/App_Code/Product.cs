using System;

public class Product
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public decimal Price { get; set; }
    public string ImageUrl { get; set; }
    public bool IsCustomizable { get; set; }

    public Product(int id, string name, string description, decimal price, string imageUrl, bool isCustomizable)
    {
        Id = id;
        Name = name;
        Description = description;
        Price = price;
        ImageUrl = imageUrl;
        IsCustomizable = isCustomizable;
    }
}
