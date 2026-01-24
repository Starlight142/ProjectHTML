using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Order
/// </summary>
public class Order
{
    public int IdOrder { get; set; }
    public string Client { get; set; }
    public string Product { get; set; }
    public int Amount { get; set; }
    public double Price { get; set; }
    public DateTime Date { get; set; }
    public bool OrderShipped { get; set; }
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