using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Represents a wearable product.
/// </summary>
public class Wearable
{
    /// <summary>
    /// Gets or sets the wearable product ID.
    /// </summary>
    public int IdWearable { get; set; }

    /// <summary>
    /// Gets or sets the name of the wearable product.
    /// </summary>
    public string Name { get; set; }

    /// <summary>
    /// Gets or sets the type/category of the wearable.
    /// </summary>
    public string Type { get; set; }

    /// <summary>
    /// Gets or sets the price of the wearable.
    /// </summary>
    public double Price { get; set; }

    /// <summary>
    /// Gets or sets the image path for the wearable.
    /// </summary>
    public string Image { get; set; }

    /// <summary>
    /// Gets or sets the review or description of the wearable.
    /// </summary>
    public string Review { get; set; }

    /// <summary>
    /// Initializes a new instance of the <see cref="Wearable"/> class with an ID.
    /// </summary>
    public Wearable(int idWearable, string name, string type, double price, string image, string review)
    {
        IdWearable = idWearable;
        Name = name;
        Type = type;
        Price = price;
        Image = image;
        Review = review;
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="Wearable"/> class without an ID.
    /// </summary>
    public Wearable(string name, string type, double price, string image, string review)
    {
        Name = name;
        Type = type;
        Price = price;
        Image = image;
        Review = review;
    }
}