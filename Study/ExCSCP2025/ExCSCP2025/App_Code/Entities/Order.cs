using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Represents an order placed by a customer.
/// </summary>
public class Order
{
    /// <summary>
    /// Gets or sets the order ID.
    /// </summary>
    public int IdOrder { get; set; }

    /// <summary>
    /// Gets or sets the client's name.
    /// </summary>
    public string Client { get; set; }

    /// <summary>
    /// Gets or sets the product name.
    /// </summary>
    public string Product { get; set; }

    /// <summary>
    /// Gets or sets the quantity ordered.
    /// </summary>
    public int Amount { get; set; }

    /// <summary>
    /// Gets or sets the price per unit.
    /// </summary>
    public double Price { get; set; }

    /// <summary>
    /// Gets or sets the date the order was placed.
    /// </summary>
    public DateTime Date { get; set; }

    /// <summary>
    /// Gets or sets a value indicating whether the order has been shipped.
    /// </summary>
    public bool OrderShipped { get; set; }

    /// <summary>
    /// Initializes a new instance of the <see cref="Order"/> class with an ID.
    /// </summary>
    public Order(int idOrder, string client, string product, int amount,
                    double price, DateTime date, bool orderShipped)
    {
        IdOrder = idOrder;
        Client = client;
        Product = product;
        Amount = amount;
        Price = price;
        Date = date;
        OrderShipped = orderShipped;
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="Order"/> class without an ID.
    /// </summary>
    public Order(string client, string product, int amount,
                 double price, DateTime date, bool orderShipped)
    {
        Client = client;
        Product = product;
        Amount = amount;
        Price = price;
        Date = date;
        OrderShipped = orderShipped;
    }
}