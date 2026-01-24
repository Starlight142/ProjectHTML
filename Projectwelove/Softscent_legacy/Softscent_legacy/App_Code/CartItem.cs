using System;

[Serializable]
public class CartItem
{
    public int ProductId { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
    public string ImageUrl { get; set; }
    public string Description { get; set; }
    
    public decimal TotalPrice 
    { 
        get { return Price * Quantity; } 
    }

    public CartItem() { }

    public CartItem(int productId, string name, decimal price, int quantity, string imageUrl, string description)
    {
        ProductId = productId;
        Name = name;
        Price = price;
        Quantity = quantity;
        ImageUrl = imageUrl;
        Description = description;
    }
}
