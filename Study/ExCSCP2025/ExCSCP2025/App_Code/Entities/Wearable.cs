using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Wearable
/// </summary>
public class Wearable
{
    public int IdWearable { get; set; }
    public string Name { get; set; }
    public string Type { get; set; }
    public double Price { get; set; }
    public string Image { get; set; }
    public string Review { get; set; }

    public Wearable(int idWearable, string name, string type, double price, string image, string review)
    {
        IdWearable = idWearable;
        Name = name;
        Type = type;
        Price = price;
        Image = image;
        Review = review;
    }

    public Wearable(string name, string type, double price, string image, string review)
    {
        Name = name;
        Type = type;
        Price = price;
        Image = image;
        Review = review;
    }
}