USE [SoftscentLegacy]
GO

SET IDENTITY_INSERT [Products] ON
GO

IF NOT EXISTS (SELECT * FROM [Products] WHERE [Id] = 1)
INSERT INTO [Products] ([Id], [Name], [Description], [Price], [ImageUrl], [IsCustomizable]) VALUES
(1, 'Peppermint Fresh', 'Cooling and refreshing.', 5.99, 'Images/products/peppermint.png', 0)
GO

IF NOT EXISTS (SELECT * FROM [Products] WHERE [Id] = 2)
INSERT INTO [Products] ([Id], [Name], [Description], [Price], [ImageUrl], [IsCustomizable]) VALUES
(2, 'Lavender Sleep', 'Calming scent for deep sleep.', 6.99, 'Images/products/lavender.png', 0)
GO

IF NOT EXISTS (SELECT * FROM [Products] WHERE [Id] = 3)
INSERT INTO [Products] ([Id], [Name], [Description], [Price], [ImageUrl], [IsCustomizable]) VALUES
(3, 'Citrus Energy', 'Boost your energy instantly.', 5.99, 'Images/products/citrus.png', 0)
GO

IF NOT EXISTS (SELECT * FROM [Products] WHERE [Id] = 4)
INSERT INTO [Products] ([Id], [Name], [Description], [Price], [ImageUrl], [IsCustomizable]) VALUES
(4, 'Traditional Thai Jar', 'Authentic herbal blend.', 12.99, 'Images/products/thai_jar.png', 1)
GO

IF NOT EXISTS (SELECT * FROM [Products] WHERE [Id] = 5)
INSERT INTO [Products] ([Id], [Name], [Description], [Price], [ImageUrl], [IsCustomizable]) VALUES
(5, 'Eucalyptus Clear', 'Clears nasal congestion.', 6.49, 'Images/products/eucalyptus.png', 0)
GO

IF NOT EXISTS (SELECT * FROM [Products] WHERE [Id] = 6)
INSERT INTO [Products] ([Id], [Name], [Description], [Price], [ImageUrl], [IsCustomizable]) VALUES
(6, 'Lemongrass Zen', 'Spa-like relaxation.', 7.99, 'Images/products/lemongrass.png', 1)
GO

SET IDENTITY_INSERT [Products] OFF
GO

SET IDENTITY_INSERT [News] ON
GO

IF NOT EXISTS (SELECT * FROM [News] WHERE [Id] = 1)
INSERT INTO [News] ([Id], [Title], [Content], [ImageUrl], [PublishedDate]) VALUES
(1, 'Grand Opening!', 'We are officially open for business! Explore our herbal collections.', 'Images/herbs-bundle.png', DATEADD(day, -10, GETDATE()))
GO

IF NOT EXISTS (SELECT * FROM [News] WHERE [Id] = 2)
INSERT INTO [News] ([Id], [Title], [Content], [ImageUrl], [PublishedDate]) VALUES
(2, 'Seasonal Blend: Lavender', 'Check out our new Lavender collection for better sleep.', 'Images/products/lavender.png', DATEADD(day, -2, GETDATE()))
GO

SET IDENTITY_INSERT [News] OFF
GO
