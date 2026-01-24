using System;

public class NewsItem
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Content { get; set; }
    public string ImageUrl { get; set; }
    public DateTime PublishedDate { get; set; }

    public NewsItem() { }

    public NewsItem(int id, string title, string content, string imageUrl, DateTime publishedDate)
    {
        Id = id;
        Title = title;
        Content = content;
        ImageUrl = imageUrl;
        PublishedDate = publishedDate;
    }
}
