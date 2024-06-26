USE [workshop1]
GO
/****** Object:  Table [dbo].[tbl_Cart]    Script Date: 4/24/2024 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Cart](
	[cartId] [int] NOT NULL,
	[userId] [varchar](20) NOT NULL,
	[mobileId] [varchar](10) NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[mobileId] ASC,
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 4/24/2024 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[orderId] [int] NOT NULL,
	[userId] [varchar](20) NULL,
	[fullName] [varchar](255) NULL,
	[phoneNumber] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrderDetail]    Script Date: 4/24/2024 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetail](
	[orderId] [int] NOT NULL,
	[mobileId] [varchar](10) NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[mobileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 4/24/2024 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[mobileId] [varchar](10) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[price] [float] NULL,
	[mobileName] [varchar](20) NOT NULL,
	[yearOfProduction] [int] NULL,
	[quantity] [int] NULL,
	[notSale] [bit] NULL,
	[image] [nvarchar](max) NULL,
	[category] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[mobileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 4/24/2024 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userId] [varchar](20) NOT NULL,
	[password] [varchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Wishlist]    Script Date: 4/24/2024 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Wishlist](
	[wishlistId] [int] NOT NULL,
	[mobileId] [varchar](10) NOT NULL,
	[userId] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlistId] ASC,
	[mobileId] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Cart] ([cartId], [userId], [mobileId], [quantity]) VALUES (2, N'phuoc', N'cl001', 1)
INSERT [dbo].[tbl_Cart] ([cartId], [userId], [mobileId], [quantity]) VALUES (3, N'phuoc', N'cl002', 1)
GO
INSERT [dbo].[tbl_Order] ([orderId], [userId], [fullName], [phoneNumber], [address], [email]) VALUES (1, N'phuoc', N'truong phuoc', N'0901308975', N'23123131 lo e', N'truongphuoc098@gmail.com')
INSERT [dbo].[tbl_Order] ([orderId], [userId], [fullName], [phoneNumber], [address], [email]) VALUES (2, N'phuoc', N'truong phuoc', N'0901308975', N'23123131 lo e', N'truongphuoc098@gmail.com')
INSERT [dbo].[tbl_Order] ([orderId], [userId], [fullName], [phoneNumber], [address], [email]) VALUES (3, N'phuoc', N'truong phuoc', N'0901308975', N'23123131 lo e', N'truongphuoc098@gmail.com')
INSERT [dbo].[tbl_Order] ([orderId], [userId], [fullName], [phoneNumber], [address], [email]) VALUES (4, N'phuoc', N'truong phuoc', N'0901308975', N'23123131 lo e', N'truongphuoc098@gmail.com')
INSERT [dbo].[tbl_Order] ([orderId], [userId], [fullName], [phoneNumber], [address], [email]) VALUES (5, N'phuoc', N'truong phuoc', N'0901308975', N'23123131 lo e', N'truongphuoc098@gmail.com')
INSERT [dbo].[tbl_Order] ([orderId], [userId], [fullName], [phoneNumber], [address], [email]) VALUES (6, N'phuoc', N'truong phuoc', N'0901308975', N'23123131 lo e', N'truongphuoc098@gmail.com')
INSERT [dbo].[tbl_Order] ([orderId], [userId], [fullName], [phoneNumber], [address], [email]) VALUES (7, N'phuoc', N'truong phuoc', N'0901308975', N'23123131 lo e', N'truongphuoc098@gmail.com')
GO
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (1, N'cl001', 1, 800)
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (1, N'cl002', 1, 650)
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (1, N'cl003', 1, 600)
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (2, N'cl003', 1, 600)
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (3, N'cl001', 3, 800)
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (3, N'cl005', 3, 550)
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (6, N'cl001', 1, 800)
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (6, N'cl002', 1, 650)
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (7, N'cl001', 1, 800)
INSERT [dbo].[tbl_OrderDetail] ([orderId], [mobileId], [quantity], [price]) VALUES (7, N'cl002', 1, 650)
GO
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'cl001', N'Men black leather jacket', 800, N'Levi Leather Jacket', 2023, 25, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRIB4F-qEyJBEwmpBtUqlcGDGkuDgqhpdmehnlRmiErg&s', N'Clothes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'cl002', N'Women floral dress', 650, N'Zara Floral Dress', 2023, 22, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSaEKgseo1b3TGf9aHh92b5GYut68iyXLKfjemFvrweg&s', N'Clothes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'cl003', N'Men blue denim jeans', 600, N'Wrangler Denim Jeans', 2023, 38, 0, N'https://worththeweightvintage.com/cdn/shop/files/image_5b6179f0-493f-4bee-aff7-96265c04cbe8.png?v=1690549755&width=1445', N'Clothes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'cl004', N'Women white cotton blouse', 450, N'H&M Cotton Jacket', 2023, 35, 0, N'https://i.ebayimg.com/00/s/MTAyNlgxMDA5/z/cv4AAOSwvzRlSPKB/$_1.PNG', N'Clothes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'cl005', N'Men gray sweatshirt', 550, N'Nike Sweatshirt', 2023, 42, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9-OMZmTcjVUHq60w_iR37Hj03f_C1fjigmsj-0lqX0w&s', N'Clothes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'cl006', N'Women black leggings', 350, N'Adidas Leggings', 2023, 50, 0, N'https://www.excell-sports.com/images/adidas-womens-loungewear-essentials-3-stripes-leggings-p28899-239921_image.jpg', N'Clothes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'cl007', N'Men plaid flannel shirt', 400, N'Uniqlo Plaid Shirt', 2023, 55, 0, N'https://tinkerlust.s3.ap-southeast-1.amazonaws.com/products/dfb85192-c496-4062-8206-09dfbfe5b94a/original/1280x1280/IMG_0075%20-%20Copy-PhotoRoom_5658-KJ-212', N'Clothes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'cl008', N'Women blue denim skirt', 400, N'Forever Denim Skirt', 2023, 30, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo0I99hpZMwE5JYW3OUKKY9q-pHG0RylycBMRJxUuO0w&s', N'Clothes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'm1', N'Smartphone with high-resolution camera', 765, N'Samsung Galaxy S20', 2021, 17, 0, N'https://cdn.xtmobile.vn/vnt_upload/product/12_2021/thumbs/(600x600)_crop_s20-5g.jpg', N'Mobiles')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'm2', N'smartphone with cutting-edge technology', 1300, N'iPhone 13 Pro Max', 2022, 22, 1, N'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/4/_/4_36_3_2_1_9.jpg', N'Mobiles')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'm3', N'Compact and powerful smartphone', 699.99, N'iPhone 12 Mini', 2020, 30, 0, N'https://clickbuy.com.vn/uploads/images/2020/10/thumb_iP12_2.jpg', N'Mobiles')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'm4', N'Flagship smartphone with advanced features', 1199.99, N'OnePlus 9 Pro', 2021, 20, 0, N'https://cdn.tgdd.vn/Products/Images/42/230770/oneplus-9-pro-600x600-1-600x600.jpg', N'Mobiles')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'm5', N'Budget-friendly smartphone with long battery life', 399.99, N'Xiaomi Redmi Note 10', 2021, 100, 1, N'https://cdn.tgdd.vn/Products/Images/42/222758/xiaomi-redmi-note-10-thumb-white-200x200.jpg', N'Mobiles')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'm6', N'High-performance gaming phone', 999.99, N'Asus ROG Phone 5', 2021, 10, 0, N'https://cdn.tgdd.vn/Products/Images/42/249063/asus-rog-phone-5s-pro-600x600.jpg', N'Mobiles')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'm7', N'Elegant and stylish smartphone', 899.99, N'Google Pixel 6', 2021, 40, 0, N'https://cdn.tgdd.vn/Products/Images/42/233009/google-pixel-6-600x600.jpg', N'Mobiles')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'm8', N'Camera-centric smartphone with AI features', 1099.99, N'Huawei P40 Pro', 2020, 15, 0, N'https://cdn.tgdd.vn/Products/Images/42/215773/huawei-p40-pro-600x600-3-600x600.jpg', N'Mobiles')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N's10', N'Men''''s black sports shoes', 520, N'Adidas Ultraboost 21', 2023, 40, 0, N'https://assets.adidas.com/images/w_600,f_auto,q_auto/33a1f66c4e0b41c4b9d2ac91005f9db9_9366/Giay_UltraBoost_21_DJen_FY0306_01_standard.jpg', N'Shoes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N's11', N'Men''''s black sports shoes', 600, N'Jimmy Choo Romy', 2023, 20, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmw-1W2d_-vTgTeDKHtSlEs9LOJB0MRbUjqmnQLnV13w&s', N'Shoes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N's12', N'Men''''s black sports shoes', 450, N'Birkenstock Arizona', 2023, 25, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs5lv9tmfDsh-pmmBtHPRwHOHt9x_wvynUZKg5HPB1Zg&s', N'Shoes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N's13', N'Men''''s black sports shoes', 550, N'Jordan 1 Retro High', 2023, 35, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqV6ibR4CB7eKFAgheFBM1B2js-91UNFgZ8oNUuc0vgw&s', N'Shoes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N's14', N'Men''''s black sports shoes', 510, N'Vans Old Skool', 2023, 45, 0, N'https://pngimg.com/d/vans_PNG16.png', N'Shoes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N's16', N'Men''''s black sports shoes', 530, N'Asics Gel-Lyte III', 2023, 50, 0, N'https://product.hstatic.net/200000078815/product/1191a224.100_13a915a61b1844c6935276cf77a6d0b3_master.png', N'Shoes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N's9', N'Men''''s black sports shoes', 480, N'Nike Tatum 1 Zoo', 2023, 60, 0, N'https://static.nike.com/a/images/t_default/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/60b3ae7b-2847-463d-a3c3-872389f96dc2/tatum-1-zoo-pf-basketball-shoes-8Qs60x.png', N'Shoes')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'w001', N'Men''s stainless steel chronograph watch', 120, N'Casio G-Shock', 2023, 20, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6Os8_qeCVNoJFIndCnE1G8blIjDQT6JgQTerszP6oxg&s', N'Watches')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'w002', N'Women''s gold-plated wristwatch with diamonds', 1500, N'Michael Kors Darci', 2023, 15, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp7xq4Kt2DPVPmisGnp4jKnlD5-7LiCj1LkEbmzhPtjg&s', N'Watches')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'w003', N'Men''s automatic leather strap watch', 1800, N'Seiko Presage', 2023, 25, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPgyfoUHIDOEpXtxswdeanw-TKAim3LyAFDIc4hrnf3A&s', N'Watches')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'w004', N'Women''s minimalist silver-tone watch', 900, N'Skagen Anita', 2023, 30, 0, N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2023/09/dong-ho-nu-skagen-anita-lille-three-hand-rose-gold-stainless-steel-mesh-watch-skw1150set-mau-vang-hong-kem-day-da-6503e14f835a4-15092023114503.jpg', N'Watches')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'w005', N'Men''s sport digital watch with compass', 600, N'Suunto Core', 2023, 35, 0, N'https://www.suunto.com/globalassets/productimages/suunto-core-black-red/suunto-core-red-black-front-view-01.png', N'Watches')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'w006', N'Women''s rose gold mesh strap watch', 1350, N'Fossil Jacqueline', 2023, 20, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtTnGbQ2j9NwzNxyEZFLIRq67vv3LclJJGVKaE7M7Y8w&s', N'Watches')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'w007', N'Men''s classic black leather watch', 1000, N'Tissot Tradition', 2023, 25, 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEJdPT3Hlx2JRJ5QC7PdyrO-zj_W1NyTOSMl64GUoBbg&s', N'Watches')
INSERT [dbo].[tbl_Product] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale], [image], [category]) VALUES (N'w008', N'Women''s stainless steel bracelet watch', 1100, N'Armani Gianni T-Bar', 2023, 15, 0, N'https://www.anguscoote.com.au/content/products/emporio-armani-gianni-t-bar-ladies-watch-5435067-202811.jpg', N'Watches')
GO
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'admin', N'1', N'tui la admin ne man', 2)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'phuoc', N'1', N'tui la user', 0)
GO
INSERT [dbo].[tbl_Wishlist] ([wishlistId], [mobileId], [userId]) VALUES (1, N'cl001', N'phuoc')
GO
ALTER TABLE [dbo].[tbl_Cart]  WITH CHECK ADD FOREIGN KEY([mobileId])
REFERENCES [dbo].[tbl_Product] ([mobileId])
GO
ALTER TABLE [dbo].[tbl_Cart]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[tbl_User] ([userId])
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[tbl_User] ([userId])
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD FOREIGN KEY([mobileId])
REFERENCES [dbo].[tbl_Product] ([mobileId])
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[tbl_Order] ([orderId])
GO
ALTER TABLE [dbo].[tbl_Wishlist]  WITH CHECK ADD FOREIGN KEY([mobileId])
REFERENCES [dbo].[tbl_Product] ([mobileId])
GO
ALTER TABLE [dbo].[tbl_Wishlist]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[tbl_User] ([userId])
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD CHECK  (([role]=(2) OR [role]=(1) OR [role]=(0)))
GO
