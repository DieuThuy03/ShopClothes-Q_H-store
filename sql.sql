USE [GoalShopv4]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](20) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Authorize_id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Role_id] [varchar](10) NULL,
 CONSTRAINT [PK_Authorize] PRIMARY KEY CLUSTERED 
(
	[Authorize_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[Banner_id] [int] NULL,
	[Image] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Category_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Comment_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Comment_Content] [nvarchar](max) NULL,
	[Comment_Date] [datetime] NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Favorite_id] [int] IDENTITY(1,1) NOT NULL,
	[Favorite_date] [date] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Favorite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image_product]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[path] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[Order_id] [int] NULL,
	[Product_id] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[Phone] [char](11) NULL,
	[Description] [nvarchar](50) NULL,
	[Intent] [nvarchar](50) NULL,
	[Method] [nvarchar](50) NULL,
	[Currency] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[money_give] [float] NULL,
	[money_send] [float] NULL,
	[voucher_price] [float] NULL,
	[reason] [ntext] NULL,
	[Card_id] [nvarchar](12) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Post_id] [int] IDENTITY(1,1) NOT NULL,
	[Post_Name] [nvarchar](max) NULL,
	[Image] [varchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Post_date] [datetime] NULL,
	[Post_conten] [nvarchar](max) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_detail]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_detail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Chip] [nvarchar](50) NULL,
	[Ram] [nvarchar](50) NULL,
	[Rom] [nvarchar](50) NULL,
	[Resolution] [nvarchar](255) NULL,
	[Pin] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Unit_price] [float] NULL,
	[Quantity] [int] NULL,
	[Product_date] [date] NULL,
	[Category_id] [int] NOT NULL,
	[Distcount] [float] NULL,
	[Special] [bit] NULL,
	[Lastest] [bit] NULL,
	[Status] [bit] NULL,
	[Trademark_id] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trademarks]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trademarks](
	[Trademark_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Trademarks] PRIMARY KEY CLUSTERED 
(
	[Trademark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[Vote_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Vote_Date] [datetime] NULL,
	[Vote] [int] NULL,
	[Image] [varchar](50) NULL,
	[Vote_content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[Vote_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher_details]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher_details](
	[Voucher_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[Voucher_id] [int] NULL,
	[Order_id] [int] NULL,
 CONSTRAINT [PK_VoucherDetails] PRIMARY KEY CLUSTERED 
(
	[Voucher_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 11/01/2024 12:52:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[Voucher_id] [int] IDENTITY(1,1) NOT NULL,
	[Voucher_name] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Voucher_price] [float] NULL,
	[Voucher_content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Username] [varchar](50) NULL,
	[estimate] [float] NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[Voucher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'0988765456_cffc4429-40ab-42c1-b804-dcef8d923ebe', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'100603914179899890743', N'MbBnDUmZxO', N'Phước Ninh', N'ninhphuoc203@gmail.com', N'avata.jpg', NULL, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'103544047197263499734', N'n8W5mawPci', N'Ninh Van Phuoc', N'phuocnvps13274@fpt.edu.vn', N'canbo.png', N'', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'105961964870291140656', N'3eI2XBxMCA', N'Phuoc Ninh', N'ninhvanphuoc203@gmail.com', N'avata.jpg', N'', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'108684515685476370216', N'hoHws9zD7N', N'phước Ninh', N'dtcunat@gmail.com', N'avata.jpg', NULL, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'admin', N'123456', N'ninh văn phước', N'phuchungngo730@gmail.com', N'canbo.png', N'0123456789', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'admin123', N'123', N'nguyễn văn a', N'Ninhvanphuoc203@gmail.com', N'canbo.png', N'0398053865', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'anh hi?u', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anh hi?u d?p trai', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'anh hi?u_a256a3d7-d2db-4e9f-89c0-0fed4cf73099', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anh hi?u_b487928e-22b0-416c-aa88-49eb91ac5391', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'anh hi?u_dd52ba78-3a22-4617-8be3-4a77fe2f5531', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous', NULL, N'Anonymous_4c5d2592-e096-4fb0-9e80-65b03ea3eb52', NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_2e607344-1f00-4b94-94d3-5df055a19a54', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_2ec4525c-1eab-4dd0-bf75-757b647edc73', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_34d6a796-0b8e-407b-8399-cb77cfc7d2e4', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_22_57', NULL, N'phu08', NULL, NULL, N'0372120398', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_27_14', NULL, N'phu08232323', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_31_10', NULL, N'phu08sssssss', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_31_16', NULL, N'phu08sssssss', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_32_23', NULL, N'phu08sssssss', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_33_14', NULL, N'phu08sssssss', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_33_41', NULL, N'phu08sssssss', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_34_6', NULL, N'phu08sssssss', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_37_8', NULL, N'phu08', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_38_48', NULL, N'alotajerry', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_40_54', NULL, N'alotajerry', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_42_12', NULL, N'alotajerry', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_42_58', NULL, N'alotajerry', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4_1_2024_22_47_22', NULL, N'a b c d e f', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_4da4aa54-5a59-4434-b77a-af4336182446', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_58d2ee70-5b73-4e4a-9f7e-6abd35987328', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_69358dc9-9184-49e6-9073-07c1d4eb1149', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_7_1_2024_15_47_1', NULL, N'', NULL, NULL, N'', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_7_1_2024_15_47_14', NULL, N'alotajerry', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_7_1_2024_15_57_54', NULL, N'alotajerry', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_716a3187-e370-4be2-a1f9-faf34ba690c7', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_82f7267a-8f23-4af6-9547-aca3efb23150', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_9_1_2024_20_11_23', NULL, N'alotajerry', NULL, NULL, N'0372120398', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_a9d30c74-415e-4f3b-8731-9a337831134c', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_ba33a115-9c37-4f70-b057-62ac3940c689', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_c26b6ffa-325f-4744-892b-6342f3c4a85f', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Anonymous_fbd55e3d-ef14-48db-914f-35c0dd12a1ac', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'ninhphuoc', N'123', N'nguyễn văn b', N'Ninhvanphuoc203@gmail.com', N'canbo.png', N'0398053865', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'phuoc', N'123', N'nguyễn văn c', N'dtcunat@gmail.com', N'canbo.png', N'0398053865', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Phuoc Ninh', N'tJcWWoEFAD', N'Phuoc Ninh', N'ninhvanphuoc203@gmail.com', N'canbo.png', N'', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'phuoc123', N'123', N'nguyễn văn d', N'ninhphuoc@gmail.com', N'canbo.png', N'123', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'phuoc1234', N'123', N'nguyễn văn e', N'ninhphuoc@gmail.com', N'canbo.png', N'123', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'phuoc12346', N'123', N'ninh van phuoc', N'ninhphuoc@gmail.com', N'canbo.png', N'123', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'phuoc1234622', N'123', N'ninh van phuoc', N'ninhphuoc@gmail.com', N'canbo.png', N'123', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'phuoc203', N'123', N'ninh van phuoc', N'Ninhvanphuoc203@gmail.com', N'canbo.png', N'0398053865', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'phuoc2031', N'123', N'ninh van phuoc', N'Ninhvanphuoc203@gmail.com', N'canbo.png', N'0398053865', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'tam', N'123', N'Nguyen minh tam', N'Ninhvanphuoc203@gmail.com', N'', N'0398053865', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'test_04', N'123', N'ninh van phuoc', N'Ninhvanphuoc203@gmail.com', N'avata.jpg', N'0398053865', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'test_05', N'123', N'ninh van phuoc', N'Ninhvanphuoc203@gmail.com', N'avata.jpg', N'0398053865', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'test_07', N'123', N'ninh van phuoc', N'dtcunat@gmail.com', N'avata.jpg', N'0398053865', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'test_08', N'123', N'ninh van phuoc', N'dtcunat@gmail.com', N'avata.jpg', N'0398053865', 1)
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (1, N'admin', N'DIRE')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (14, N'ninhphuoc', N'STAF')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (20, N'admin', N'STAF')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (21, N'admin', N'CUST')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (22, N'admin', N'STAF')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (23, N'admin', N'CUST')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (25, N'103544047197263499734', N'DIRE')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (26, N'100603914179899890743', N'CUST')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (27, N'100603914179899890743', N'DIRE')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (1, N'Chuột', N'Chuột')
INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (2, N'Bàn phím', N'Bàn phím')
INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (3, N'Máy tính', N'1231213')
INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (4, N'Phụ Kiện', N'')
INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (14, N'Máy ảnh', N'adsdadasd')
INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (17, N'Sách', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Comment_id], [Product_id], [Username], [Comment_Content], [Comment_Date], [Image]) VALUES (53, 109, N'admin', N'dsfsdfdsf', CAST(N'2023-11-12T11:04:56.757' AS DateTime), NULL)
INSERT [dbo].[Comments] ([Comment_id], [Product_id], [Username], [Comment_Content], [Comment_Date], [Image]) VALUES (54, 109, N'admin', N'dsfsdfdsf', CAST(N'2023-11-12T11:04:56.757' AS DateTime), NULL)
INSERT [dbo].[Comments] ([Comment_id], [Product_id], [Username], [Comment_Content], [Comment_Date], [Image]) VALUES (55, 109, N'admin', N'dsfsdfdsf', CAST(N'2023-11-12T11:04:56.757' AS DateTime), NULL)
INSERT [dbo].[Comments] ([Comment_id], [Product_id], [Username], [Comment_Content], [Comment_Date], [Image]) VALUES (56, 109, N'admin', N'dsfsdfdsf', CAST(N'2023-11-12T11:04:56.757' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[image_product] ON 

INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (13, 107, N'1-1630424764-236-width660height440.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (14, 107, N'1Z-Flip3-5G-Lavender-1 - Copy - Copy.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (15, 107, N'1Z-Flip3-5G-Lavender-1 - Copy.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (16, 107, N'1Z-Flip3-5G-Lavender-1.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (17, 107, N'10-cua-hang-dien-thoai-uy-tin-ha-noi-2-1.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (18, 113, N'11-pro-vang-37383.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (19, 108, N'12-cua-hang-dien-thoai-uy-tin-ha-noi.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (20, 109, N'1-1630424764-236-width660height440.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (21, 110, N'1Z-Flip3-5G-Lavender-1 - Copy - Copy.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (22, 111, N'1Z-Flip3-5G-Lavender-1 - Copy.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (23, 112, N'1Z-Flip3-5G-Lavender-1.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (24, 114, N'10-cua-hang-dien-thoai-uy-tin-ha-noi-2-1.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (25, 114, N'11-pro-vang-37383.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (26, 115, N'12-cua-hang-dien-thoai-uy-tin-ha-noi.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (27, 116, N'1-1630424764-236-width660height440.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (29, 118, N'1Z-Flip3-5G-Lavender-1 - Copy.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (30, 119, N'1Z-Flip3-5G-Lavender-1.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (31, 120, N'10-cua-hang-dien-thoai-uy-tin-ha-noi-2-1.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (32, 120, N'11-pro-vang-37383.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (33, 121, N'12-cua-hang-dien-thoai-uy-tin-ha-noi.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (34, 122, N'12-cua-hang-dien-thoai-uy-tin-ha-noi.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (40, 117, N'10-cua-hang-dien-thoai-uy-tin-ha-noi-2-1.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (41, 117, N'11-pro-vang-37383.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (42, 117, N'12-cua-hang-dien-thoai-uy-tin-ha-noi.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (43, 117, N'021e53d4e90c44fd96cde44bdcdc1cb46e057f96.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (44, 117, N'35ff6964-iE1BB87n-thoE1BAA1i-vsmart.jpg')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (45, 117, N'200px-IOS_12.0_Beta_1_chay_tren_iPhone_X - Copy.png')
INSERT [dbo].[image_product] ([ID], [ProductID], [path]) VALUES (46, 117, N'200px-IOS_12.0_Beta_1_chay_tren_iPhone_X.png')
SET IDENTITY_INSERT [dbo].[image_product] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1326, 1182, 107, 123123123, 99)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1327, 1183, 122, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1328, 1183, 110, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1329, 1183, 111, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1330, 1184, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1331, 1185, 110, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1332, 1185, 111, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1333, 1186, 107, 123123123, 3)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1334, 1186, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1335, 1186, 110, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1336, 1187, 107, 123123123, 2)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1337, 1187, 117, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1338, 1188, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1339, 1189, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1340, 1189, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1341, 1190, 107, 123123123, 2)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1342, 1191, 107, 123123123, 2)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1343, 1192, 107, 123123123, 2)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1344, 1193, 107, 123123123, 2)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1345, 1194, 107, 123123123, 3)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1346, 1195, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1347, 1196, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1348, 1197, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1349, 1198, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1350, 1199, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1351, 1200, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1352, 1201, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1353, 1202, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1354, 1203, 120, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1357, 1205, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1358, 1205, 111, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1369, 1211, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1370, 1211, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1371, 1212, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1372, 1212, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1373, 1213, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1374, 1213, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1375, 1214, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1376, 1214, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1377, 1215, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1378, 1215, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1379, 1216, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1380, 1216, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1391, 1221, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1392, 1222, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1393, 1223, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1394, 1223, 111, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1395, 1223, 115, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1396, 1224, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1397, 1224, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1398, 1225, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1399, 1225, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1400, 1226, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1401, 1226, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1402, 1227, 108, 123123123, 2)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1403, 1227, 117, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1404, 1228, 116, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1405, 1229, 116, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1406, 1230, 116, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1407, 1231, 116, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1408, 1232, 116, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1411, 1234, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1412, 1234, 107, 123123123, 2)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1413, 1234, 120, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1414, 1234, 121, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1415, 1234, 118, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1416, 1234, 117, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1421, 1237, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1422, 1237, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1423, 1238, 107, 369369369, 3)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1427, 1238, 112, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1428, 1239, 108, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1429, 1240, 116, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1430, 1241, 116, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1431, 1241, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1432, 1242, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1435, 1244, 107, 123123123, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (1436, 1245, 107, 123123123, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (98, N'admin', CAST(N'2021-12-07T20:52:56.293' AS DateTime), N'SDSD', 0, N'0398053865 ', N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 33110400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (99, N'admin', CAST(N'2021-12-07T20:59:00.000' AS DateTime), N'DFSFD', 3, N'45345      ', N'Đã thanh toán', N'sale', N'trả sau', N'USD', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (100, N'admin', CAST(N'2021-12-07T21:44:41.900' AS DateTime), N'ÈWE', 0, N'45645      ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (101, N'ninhphuoc', CAST(N'2021-12-07T21:55:58.883' AS DateTime), N'tân hà', 0, N'0398053865 ', N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 65875900, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (102, N'ninhphuoc', CAST(N'2021-12-07T21:56:57.130' AS DateTime), N'tân hà', 4, N'45345345   ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 102090400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (103, N'phuoc', CAST(N'2021-12-07T21:57:38.177' AS DateTime), N'ssdasd', 0, N'453453     ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 68980000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (104, N'105961964870291140656', CAST(N'2021-12-07T21:58:00.000' AS DateTime), N'rưerw', 3, N'324234     ', N'Đã thanh toán', N'Sale', N'Trả sau', N'VND', 100710800, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (105, N'phuoc', CAST(N'2021-12-08T19:44:36.740' AS DateTime), N'Tân hà - Lâm Hà -lâm đồng', 0, N'0398053865 ', N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 98641400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (106, N'phuoc', CAST(N'2021-12-08T19:45:58.823' AS DateTime), N'tân hà', 0, N'03980539865', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 100365900, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (107, N'108684515685476370216', CAST(N'2021-12-08T19:48:00.000' AS DateTime), N'TÂN HÀ', 3, N'031231231  ', N'Đã thanh toán', N'Sale', N'Trả sau', N'VND', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (108, N'admin', CAST(N'2021-12-08T20:15:00.000' AS DateTime), N'taan ha', 3, N'0398053865 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 65531000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (109, N'100603914179899890743', CAST(N'2021-12-08T20:30:48.067' AS DateTime), N'tan ga', 0, N'45342323123', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 65531000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (110, N'admin', CAST(N'2021-12-17T20:11:37.333' AS DateTime), N'dasda', 4, N'0342342345 ', N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (111, N'phuoc', CAST(N'2021-12-20T15:54:26.073' AS DateTime), N'asfdas', 0, N'0342342342 ', N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 35255500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (112, N'phuoc', CAST(N'2021-12-20T15:55:31.947' AS DateTime), N'asdasd', 0, NULL, N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 58765900, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (113, N'phuoc', CAST(N'2021-12-20T15:55:31.947' AS DateTime), N'asdasd', 4, N'0232323232 ', N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 58765900, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (114, N'admin', CAST(N'2021-12-20T16:01:39.037' AS DateTime), N'ÁDASD', 0, NULL, N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 23510400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (115, N'admin', CAST(N'2021-12-20T16:01:00.000' AS DateTime), N'ÁDASD', 2, N'0324234233 ', N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 23510400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (116, N'admin', CAST(N'2021-12-20T16:03:00.000' AS DateTime), N'TAN HA', 1, N'0398053865 ', N'Đang xác nhận thanh toán', N'sale', N'Paypal', N'USD', 23510400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (117, N'admin', CAST(N'2021-12-20T16:08:23.047' AS DateTime), N'645W', 4, N'45345      ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (118, N'admin', CAST(N'2021-12-21T19:24:00.000' AS DateTime), N'eqweq', 3, N'0398053865 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 45825900, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (119, N'phuoc', CAST(N'2021-12-22T08:08:00.000' AS DateTime), N'Hồ chí minh', 2, N'0398053865 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 65531000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (120, N'admin', CAST(N'2022-04-02T17:16:18.723' AS DateTime), N'asdasd', 0, N'0326132124 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 77255500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (121, N'admin', CAST(N'2022-04-02T19:59:41.790' AS DateTime), N'ád', 0, N'0326132126 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 77255500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (122, N'admin', CAST(N'2023-10-28T16:37:07.397' AS DateTime), N'', 0, N'           ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 115390000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (123, N'admin', CAST(N'2023-10-28T16:37:07.397' AS DateTime), N'df', 0, NULL, N'Đã thanh toán', N'sale', N'Paypal', N'USD', 115390000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (124, N'admin', CAST(N'2023-10-28T16:37:07.397' AS DateTime), N'df', 0, N'0977361506 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 115390000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (125, N'admin', CAST(N'2023-10-30T22:01:59.547' AS DateTime), N'số 5 phạm hùng', 0, N'098872624  ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (126, N'admin', CAST(N'2023-10-30T22:03:32.270' AS DateTime), N'092349324', 0, N'092349324  ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (128, N'admin', CAST(N'2023-10-30T22:18:08.117' AS DateTime), N'số 5 phạm hùng', 0, N'097736q193 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 47020800, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (129, N'admin', CAST(N'2023-10-30T22:27:50.580' AS DateTime), N'số 5 phạm hùng', 0, N'098773632  ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 47020800, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (130, N'admin', CAST(N'2023-10-30T22:44:57.817' AS DateTime), N'soos 5 phamj hungf', 0, N'0988736134 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 91651800, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (131, N'admin', CAST(N'2023-10-30T23:05:21.313' AS DateTime), N'só 5 phạm hùng', 0, N'0988765345 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 78591400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (132, N'admin', CAST(N'2023-10-30T23:07:29.793' AS DateTime), N'ngõ 6 nguyễn văn trỗi', 0, N'0988736241 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 78591400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (133, N'admin', CAST(N'2023-10-30T23:20:57.320' AS DateTime), N'Nguyễn văn trỗi mỗ lao hà đông', 0, N'0988765678 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 78591400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (134, N'admin', CAST(N'2023-10-30T23:24:48.450' AS DateTime), N'dddddđ', 0, N'0988361596 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 111356900, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (135, N'admin', CAST(N'2023-10-30T23:26:46.630' AS DateTime), N'0977463596', 0, N'0977463596 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 123222400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (136, N'admin', CAST(N'2023-10-30T23:26:46.630' AS DateTime), N'0977463596', 0, N'0977463596 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 123222400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (137, N'admin', CAST(N'2023-10-30T23:33:18.143' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 144122400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (140, N'Anonymous', CAST(N'2023-10-31T17:18:23.127' AS DateTime), N'Số 5 phạm hung', 0, N'0386850101 ', N'Đơn hàng của tôi', N'Sale', N'Trả sau', N'VND', 130047500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (141, N'Anh hi?u d?p trai', CAST(N'2023-10-31T18:02:57.557' AS DateTime), N'0977361506', 0, N'0977361506 ', N'', N'Sale', N'Trả sau', N'VND', 100631600, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (142, N'anh hi?u', CAST(N'2023-10-31T18:11:14.620' AS DateTime), N'0977361506', 0, N'0977361506 ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (143, N'anh hi?u_dd52ba78-3a22-4617-8be3-4a77fe2f5531', CAST(N'2023-10-31T18:11:14.620' AS DateTime), N'0977361506', 0, N'0977361506 ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (144, N'anh hi?u_a256a3d7-d2db-4e9f-89c0-0fed4cf73099', CAST(N'2023-10-31T18:11:14.620' AS DateTime), N'0977361506', 0, N'0977361506 ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (145, N'0988765456_cffc4429-40ab-42c1-b804-dcef8d923ebe', CAST(N'2023-10-31T18:19:25.807' AS DateTime), N'0988765456', 0, N'0988765456 ', N'Lê hiếu', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (146, N'Anonymous_ba33a115-9c37-4f70-b057-62ac3940c689', CAST(N'2023-10-31T18:21:01.570' AS DateTime), N'', 0, N'0988765678 ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (147, N'Anonymous_c26b6ffa-325f-4744-892b-6342f3c4a85f', CAST(N'2023-10-31T18:21:46.767' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (148, N'Anonymous_69358dc9-9184-49e6-9073-07c1d4eb1149', CAST(N'2023-10-31T18:23:08.203' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (149, N'Anonymous_82f7267a-8f23-4af6-9547-aca3efb23150', CAST(N'2023-10-31T18:25:02.747' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (150, N'Anonymous_58d2ee70-5b73-4e4a-9f7e-6abd35987328', CAST(N'2023-10-31T18:26:16.913' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (151, N'Anonymous_4da4aa54-5a59-4434-b77a-af4336182446', CAST(N'2023-10-31T18:30:19.417' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (152, N'Anonymous_a9d30c74-415e-4f3b-8731-9a337831134c', CAST(N'2023-10-31T18:53:55.877' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (153, N'Anonymous_34d6a796-0b8e-407b-8399-cb77cfc7d2e4', CAST(N'2023-10-31T22:33:19.503' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (154, N'Anh hi?u_b487928e-22b0-416c-aa88-49eb91ac5391', CAST(N'2023-10-31T22:43:01.187' AS DateTime), N'số 6 pham hùng', 0, N'0988765456 ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (155, N'Anonymous_716a3187-e370-4be2-a1f9-faf34ba690c7', CAST(N'2023-10-31T22:43:01.187' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (156, N'Anonymous_fbd55e3d-ef14-48db-914f-35c0dd12a1ac', CAST(N'2023-10-31T22:43:01.187' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (157, N'Anonymous_2ec4525c-1eab-4dd0-bf75-757b647edc73', CAST(N'2023-10-31T22:49:03.553' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 67631200, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (158, N'Anonymous_2e607344-1f00-4b94-94d3-5df055a19a54', CAST(N'2023-10-31T22:49:03.553' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 56275900, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (159, N'admin', CAST(N'2023-11-01T01:12:52.847' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 25925900, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (160, N'admin', CAST(N'2023-11-01T01:16:15.670' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (161, N'admin', CAST(N'2023-11-01T01:17:39.073' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (162, N'admin', CAST(N'2023-11-01T01:22:12.073' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 32765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (163, N'admin', CAST(N'2023-11-01T02:10:10.493' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 3510400, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (164, N'admin', CAST(N'2023-11-01T22:49:41.220' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 22765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (165, N'admin', CAST(N'2023-11-01T22:49:41.220' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 22765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (166, N'Anonymous', CAST(N'2023-11-01T23:06:57.063' AS DateTime), N'0988361506', 0, N'0988361506 ', N'', N'Sale', N'Trả sau', N'VND', 66946500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (167, N'Anonymous', CAST(N'2023-11-02T06:40:39.053' AS DateTime), N'số 5 nguyễn văn trỗi', 0, N'0977475697 ', N'', N'Sale', N'Trả sau', N'VND', 115346300, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (168, N'admin', CAST(N'2023-11-02T06:52:45.610' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 55531000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (169, N'admin', CAST(N'2023-11-02T06:54:30.413' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 55531000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (170, N'admin', CAST(N'2023-11-02T06:54:30.413' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 55531000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (171, N'admin', CAST(N'2023-11-02T06:54:30.413' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 55531000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (172, N'admin', CAST(N'2023-11-02T07:07:07.467' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 22765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (173, N'admin', CAST(N'2023-11-02T18:56:02.767' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 22765500, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (174, N'admin', CAST(N'2023-11-02T18:56:47.980' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 72397100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (175, N'Anonymous', CAST(N'2023-11-02T18:56:59.260' AS DateTime), N'số 6 phạm hùng', 0, N'0988765236 ', N'', N'Sale', N'Trả sau', N'VND', 41960000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (176, N'Anonymous', CAST(N'2023-11-03T00:06:20.227' AS DateTime), N'Số 5 phạm hùng', 0, N'0977264506 ', N'', N'Sale', N'Trả sau', N'VND', 24865700, 1000000000, 965134300, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (177, N'Anonymous', CAST(N'2023-11-03T00:25:06.497' AS DateTime), N'0977361506', 0, N'0977361506 ', N'', N'Sale', N'Trả sau', N'VND', 5980000, 3123123123, 3107143123, 10000000, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (178, N'Anonymous', CAST(N'2023-11-03T00:38:54.787' AS DateTime), N'0977361506', 0, N'0977361506 ', N'0977361506', N'Sale', N'Trả sau', N'VND', 16521200, 40000000, 13478800, 10000000, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (179, N'Anonymous', CAST(N'2023-11-03T00:52:31.003' AS DateTime), N'số 5 phạm hùng', 0, N'0988765456 ', N'mua hết', N'Sale', N'Trả sau', N'VND', 148683000, 150000000, 1317000, 10000000, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (180, N'Anonymous', CAST(N'2023-11-03T00:57:51.970' AS DateTime), N'', 0, N'           ', N'', N'Sale', N'Trả sau', N'VND', 37681200, 0, 0, 10000000, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (181, N'Anonymous', CAST(N'2023-11-03T01:01:47.827' AS DateTime), N'0988371495', 0, N'0988371495 ', N'0988371495', N'Sale', N'Trả sau', N'VND', 104052000, 115000000, 10948000, 10000000, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (182, N'admin', CAST(N'2023-11-03T01:03:06.023' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 91147300, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (183, N'Anonymous', CAST(N'2023-11-03T22:39:21.680' AS DateTime), N'0997365374', 0, N'0997365374 ', N'0997365374', N'Sale', N'Trả sau', N'VND', 30966300, 40000000, 9033700, 10000000, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (184, N'Anonymous', CAST(N'2023-11-03T22:41:57.987' AS DateTime), N'0988786789', 3, N'0988786789 ', N'0988786789', N'Sale', N'Trả sau', N'VND', 23705700, 988786789, 965081089, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1177, N'Anonymous', CAST(N'2023-11-05T08:54:05.147' AS DateTime), N'', 3, N'0988678989 ', N'', N'Sale', N'Trả sau', N'VND', 1310620000, 100000000000000, 99997471329500, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1178, N'Anonymous', CAST(N'2023-11-05T08:55:07.023' AS DateTime), N'', 3, N'0988678989 ', N'', N'Sale', N'Trả sau', N'VND', 940416000, 1000000000000, 999059584000, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1179, N'admin', CAST(N'2023-11-05T09:08:46.097' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 34855700000, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1180, N'admin', CAST(N'2023-11-12T01:06:43.720' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 41851800, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1181, N'Anonymous', CAST(N'2023-11-12T01:06:56.473' AS DateTime), N'', 3, N'           ', N'', N'Sale', N'Trả trực tiếp', N'VND', 5490000, 12312313123, 12306823123, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1182, N'Anonymous', CAST(N'2023-11-12T09:22:17.697' AS DateTime), N'098876567', 3, N'098876567  ', N'098876567', N'Sale', N'Trả trực tiếp', N'VND', 12179189177, 12312312312312, 12300133123135, 10000000, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1183, N'Anonymous', CAST(N'2023-11-12T09:48:32.143' AS DateTime), N'', 3, N'098837645  ', N'', N'Sale', N'Trả trực tiếp', N'VND', 359369369, 123123123123, 122763753754, 10000000, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1184, N'Anonymous', CAST(N'2023-11-12T10:37:38.177' AS DateTime), N'', 3, N'           ', N'', N'Sale', N'Trả trực tiếp', N'VND', 123123123, 23423432432, 23300309309, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1185, N'Anonymous', CAST(N'2023-11-12T10:37:38.177' AS DateTime), N'', 3, N'           ', N'', N'Sale', N'Trả trực tiếp', N'VND', 246246246, 123213123123, 122966876877, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1186, N'admin', CAST(N'2023-11-12T11:13:49.307' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 609459458.85, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1187, N'admin', CAST(N'2023-11-12T11:21:40.840' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 366906906.53999996, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1188, N'admin', CAST(N'2024-01-04T19:53:52.277' AS DateTime), N'dsfdsf', 0, N'0967035017 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 121891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1189, N'admin', CAST(N'2024-01-04T20:03:45.637' AS DateTime), N'ád', 0, N'0967035017 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 243783783.54, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1190, N'admin', CAST(N'2024-01-04T20:08:02.317' AS DateTime), N'sadas', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 243783783.54, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1191, N'admin', CAST(N'2024-01-04T20:08:56.980' AS DateTime), N'ádsa', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 243783783.54, 0, 0, 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1192, N'admin', CAST(N'2024-01-04T20:12:23.207' AS DateTime), N'sadas', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 243783783.54, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1193, N'admin', CAST(N'2024-01-04T20:15:03.023' AS DateTime), N'sadsa', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 243783783.54, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1194, N'admin', CAST(N'2024-01-04T20:20:28.537' AS DateTime), N'Thanh toán paypal', 0, N'0935021054 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 365675675.31, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1195, N'admin', CAST(N'2024-01-04T20:26:19.297' AS DateTime), N'ádsa', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 121891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1196, N'admin', CAST(N'2024-01-04T20:27:44.887' AS DateTime), N'adsa', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 121891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1197, N'admin', CAST(N'2024-01-04T20:30:05.833' AS DateTime), N'a', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 121891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1198, N'admin', CAST(N'2024-01-04T20:33:17.857' AS DateTime), N'a', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 121891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1199, N'admin', CAST(N'2024-01-04T20:36:58.777' AS DateTime), N'a', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 121891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1200, N'admin', CAST(N'2024-01-04T20:38:33.047' AS DateTime), N'a', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 121891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1201, N'admin', CAST(N'2024-01-04T20:42:06.520' AS DateTime), N'avb', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 121891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1202, N'admin', CAST(N'2024-01-04T20:43:44.000' AS DateTime), N'Đặt hàng thanh toán qua paypal', 0, N'0787617092 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 121891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1203, N'Anonymous', CAST(N'2024-01-04T20:55:27.330' AS DateTime), N'a', 3, N'0935251485 ', N'1', N'Sale', N'Trả trực tiếp', N'VND', 123123123, 1000000000, 876876877, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1205, N'Anonymous', CAST(N'2024-01-04T21:44:50.397' AS DateTime), N'1', 3, N'0967035017 ', N'1', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 756216216.46, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1211, N'Anonymous_4_1_2024_22_37_8', CAST(N'2024-01-04T22:36:55.297' AS DateTime), N'1', 3, N'0372120398 ', N'1', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 756216216.46, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1212, N'Anonymous_4_1_2024_22_38_48', CAST(N'2024-01-04T22:38:34.420' AS DateTime), N'1', 3, N'0372120398 ', N'1', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 756216216.46, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1213, N'Anonymous_4_1_2024_22_40_54', CAST(N'2024-01-04T22:40:41.197' AS DateTime), N'111111111111', 3, N'0372120398 ', N'1111111', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 756216216.46, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1214, N'Anonymous_4_1_2024_22_42_12', CAST(N'2024-01-04T22:41:59.767' AS DateTime), N'111111111111', 3, N'0372120398 ', N'111111111', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 756216216.46, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1215, N'Anonymous_4_1_2024_22_42_58', CAST(N'2024-01-04T22:42:48.073' AS DateTime), N'11111111111111111111', 3, N'0372120398 ', N'11111111111', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 756216216.46, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1216, N'Anonymous_4_1_2024_22_47_22', CAST(N'2024-01-04T22:47:05.403' AS DateTime), N'11111111111111111111111111', 3, N'0372120398 ', N'111111111', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 756216216.46, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1221, N'admin', CAST(N'2024-01-05T00:12:30.907' AS DateTime), N'sadsa', 0, N'0967035017 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 111891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1222, N'admin', CAST(N'2024-01-05T00:17:00.000' AS DateTime), N'aaaaaaaaaaaaa', 3, N'0967035017 ', N'Đã thanh toán', N'Sale', N'Trả sau', N'VND', 111891891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1223, N'Anonymous_7_1_2024_15_47_14', CAST(N'2024-01-07T15:46:53.387' AS DateTime), N'a', 3, N'0372120398 ', N's', N'Sale', N'Trả trực tiếp', N'VND', 365675675.31, 1000000000, 634324324.69, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1224, N'Anonymous', CAST(N'2024-01-07T15:46:53.387' AS DateTime), N'a', 3, N'0372120398 ', N's', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 634324324.69, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1225, N'Anonymous', CAST(N'2024-01-07T15:46:53.387' AS DateTime), N'0', 3, N'0372254154 ', N'0', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 756216216.46, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1226, N'Anonymous_7_1_2024_15_57_54', CAST(N'2024-01-07T15:46:53.387' AS DateTime), N'0', 3, N'0372120398 ', N'0', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 756216216.46, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1227, N'admin', CAST(N'2024-01-07T21:22:25.113' AS DateTime), N'dsfds', 0, N'0967035017 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 356930906.53999996, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1228, N'admin', CAST(N'2024-01-08T00:32:11.697' AS DateTime), N'ádsad', 0, N'0967035017 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 113147123, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1229, N'admin', CAST(N'2024-01-08T00:36:48.697' AS DateTime), N'aaaaaaaaaa', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 113123123, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1230, N'admin', CAST(N'2024-01-08T00:39:00.000' AS DateTime), N'aaaaaaaaaaaaaa', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', -10000000, 0, 0, 0, N'as', NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1231, N'admin', CAST(N'2024-01-08T00:44:31.213' AS DateTime), N'av', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', -10000000, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1232, N'admin', CAST(N'2024-01-08T00:45:00.000' AS DateTime), N'ax', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 113147123, 0, 0, 0, N'as', NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1234, N'Anonymous_9_1_2024_20_11_23', CAST(N'2024-01-09T20:11:06.130' AS DateTime), N'', 3, N'0372120398 ', N'', N'Sale', N'Trả trực tiếp', N'VND', 858168167.31, 1000000000, 141831832.69000006, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1237, N'Anonymous', CAST(N'2024-01-09T22:32:15.897' AS DateTime), N'22 Lang Ha', 3, N'0372120398 ', N'a', N'Sale', N'Trả trực tiếp', N'VND', 243783783.54, 1000000000, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1238, N'Anonymous', CAST(N'2024-01-09T23:33:09.070' AS DateTime), N'22 Lang Ha', 3, N'0372120398 ', N'a', N'Sale', N'Trả trực tiếp', N'VND', 981291290.31, 1000000000, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1239, N'admin', CAST(N'2024-01-10T23:05:01.850' AS DateTime), N'aaa', 0, N'0967035017 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 111915891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1240, N'admin', CAST(N'2024-01-10T23:06:55.450' AS DateTime), N'', 0, N'           ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 113147123, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1241, N'admin', CAST(N'2024-01-10T23:13:15.227' AS DateTime), N'aaa', 0, N'0967035017 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 235039014.76999998, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1242, N'admin', CAST(N'2024-01-11T00:27:14.947' AS DateTime), N'aaa', 0, N'0372120398 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 111915891.77, 0, 0, 0, NULL, N'049200011543')
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1244, N'admin', CAST(N'2024-01-11T00:38:34.437' AS DateTime), N'aaaaaaa', 0, N'0372120398 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 111915891.77, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [money_give], [money_send], [voucher_price], [reason], [Card_id]) VALUES (1245, N'Anonymous', CAST(N'2024-01-11T00:40:37.567' AS DateTime), N'', 5, N'           ', N'', N'Sale', N'Trả trực tiếp', N'VND', 121891891.77, 0, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Post_id], [Post_Name], [Image], [Detail], [Status], [Post_date], [Post_conten]) VALUES (1, N'Deal ngon cuối tuần: Săn ngay Galaxy A52s 5G giá đẹp ngất ngây kèm trả góp 0%, cơ hội mua sắm cuối năm không thể bỏ lỡ', N'blog3.jpg', N'<h1 style="text-align:center"><span style="font-size:26px"><strong><span style="font-family:Times New Roman,Times,serif">Bài viết test&nbsp;</span></strong></span></h1>

<p>&nbsp;</p>

<p><span style="font-size:26px">Ngày 9/1/2007, cố CEO Apple Steve Jobs đã giới thiệu mẫu iPhone đầu tiên của mình. Kể từ khi xuất hiện, các mẫu iPhone đã mở ra một kỷ nguyên mới cho giới di động. Thiết bị đánh dấu cột mốc cho xu hướng smartphone màn hình cảm ứng và dùng hệ điều hành riêng. Công bằng mà nói, iPhone đóng vai trò quan trọng trong quá trình phát triển của ngành công nghiệp di động trên toàn cầu.</span></p>

<p><span style="font-size:26px">Tuy nhiên, theo nhà phân tích Ming-Chi Kuo, iPhone sẽ biến mất trong 10 năm tới, thay vào đó là kính thực tế tăng cường AR của Apple. Đây không phải lần đầu tiên có dự đoán về tương lai của iPhone. Chính Apple cũng cho thấy hãng ngày càng tập trung hơn trong việc phát triển phần cứng lẫn phần mềm cho AR cùng nhiều dịch vụ khác. Nhận định này của &ldquo;nhà tiên tri&rdquo; Apple cũng khá phù hợp với xu hướng metaverse ngày càng được giới công nghệ đón nhận.</span></p>

<p style="text-align:center"><span style="font-size:26px"><a href="https://cafefcdn.com/203337114487263232/2021/11/29/-163818486353323360302.jpg"><img alt="10 năm nữa, iPhone sẽ biến mất - Ảnh 1." id="img_389738353017954304" src="https://cafefcdn.com/thumb_w/640/203337114487263232/2021/11/29/-163818486353323360302.jpg" title="10 năm nữa, iPhone sẽ biến mất - Ảnh 1." /></a></span></p>

<p><span style="font-size:26px">Từ lâu, đã có nhiều tin đồn về mẫu kính của Apple.</span></p>

<p><span style="font-size:26px">Trang 9to5mac cho rằng, Apple là công ty giá trị nhất thế giới. Vì thế, CEO Tim Cook đã nhận thức được rằng hãng không thể nào phụ thuộc quá nhiều vào 1 thiết bị. Hiện tại, một nửa doanh thu của công ty đến từ iPhone.</span></p>

<p><span style="font-size:26px">&ldquo;Nếu kính AR của Apple được định vị như một sản phẩm dành cho Mac hay iPhone thì sẽ không có lợi đến sự phát triển sản phẩm. Ngược lại, nếu thiết bị hoạt động độc lập đồng nghĩa sẽ có hệ sinh thái riêng và mang đến trải nghiệm người dùng linh hoạt, cần thiết thì sẽ tốt hơn&rdquo;, ông Ming-Chi Kuo chia sẻ.</span></p>

<p><span style="font-size:26px">Ông Ming-Chi Kuo cũng đưa ra nhận định quá trình này là sự thay đổi &ldquo;khổng lồ&rdquo;. Apple buộc phải bán ít nhất 1 tỷ thiết bị AR trong 10 năm tới nếu muốn thay thế vai trò quan trọng của iPhone. Vì hiện tại, đang có 1 tỷ người dùng iPhone trên toàn cầu.</span></p>

<p><span style="font-size:26px">Các nguồn tin rò rỉ cho thấy sau nhiều năm âm thầm phát triển, iGlasses cuối cùng có thể sẽ ra mắt trong một hoặc hai năm tới còn iCar - một loại xe vừa chạy điện vừa tự lái sẽ ra mắt vào năm 2024.</span></p>

<p><span style="font-size:26px">Sự cạnh tranh cũng đang nóng lên trong mảng kinh doanh phần cứng. Ở Mỹ, iPhone vẫn chiếm ưu thế. Tuy nhiên, trên toàn cầu, iPhone phải chịu sự cạnh tranh từ 7 hãng điện thoại thông minh lớn. Đầu năm nay, Xiaomi đã vượt qua Apple để trở thành nhà sản xuất điện thoại thông minh lớn thứ hai thế giới về số lượng.</span></p>

<p><span style="font-size:26px">Việc Apple thâm nhập vào các lĩnh vực mới cũng phải đối mặt với sự cạnh tranh gay gắt. Loa thông minh HomePod không tạo được nhiều khác biệt so với các sản phẩm của Amazon và Google. Kính thực tế ảo phải đối đầu với Facebook&rsquo;s Oculus, Microsoft&rsquo;s HoloLens. Và iCar sẽ đụng độ Tesla trên thị trường.</span></p>

<p><span style="font-size:26px">Đã có nhiều ý kiến đề nghị Tim Cook nên ngừng trở thành người bán hàng xa xỉ. Thay vào đó, Apple nên sử dụng sức mạnh và công nghệ tiên tiến của mình để phát triển các thiết bị và dịch vụ hướng đến thị trường có thu nhập trung bình và thấp, ước chừng 3 tỷ người. Điều này có thể giúp giải quyết bài toán hóc búa về tăng trưởng của Apple trong tương lai.</span></p>
', 1, CAST(N'2021-12-21T19:33:57.970' AS DateTime), N'Deal ngon cuối tuần: Săn ngay Galaxy A52s 5G giá đẹp ngất ngây kèm trả góp 0%, cơ hội mua sắm cuối năm không thể bỏ lỡ')
INSERT [dbo].[Posts] ([Post_id], [Post_Name], [Image], [Detail], [Status], [Post_date], [Post_conten]) VALUES (5, N'Deal ngon cuối tuần: Săn ngay Galaxy A52s 5G giá đẹp ngất ngây kèm trả góp 0%, cơ hội mua sắm cuối năm không thể bỏ lỡ', N'blog02.jpg', N'<p style="text-align:center"><span style="font-size:22px"><img alt="TOP 5 chiếc điện thoại giá rẻ, cấu hình cao" src="https://cdn.tgdd.vn/Files/2021/07/09/1366900/ltpgaming6_1280x720-800-resize.png" title="TOP 5 chiếc điện thoại giá rẻ, cấu hình cao" /></span></p>

<h2><span style="font-size:22px">Bạn đang muốn sắm ngay một&nbsp;chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd" target="_blank" title="điện thoại" type="điện thoại">điện thoại</a>&nbsp;cấu hình cao&nbsp;để chiến game cùng anh em&nbsp;nhưng kinh tế của bạn lại không cho phép vì giá thành của các điện thoại này thường khá cao?&nbsp;Đừng lo bạn nhé, vì TOP&nbsp;5 chiếc&nbsp;<a href="https://www.thegioididong.com/tin-tuc/tim-mua-dien-thoai-cau-hinh-khung-gia-re-nam-2021-1366900" target="_blank" title="smartphone" type="smartphone">điện thoại&nbsp;</a><a href="https://www.thegioididong.com/tin-tuc/xem-truoc/1366900" target="_blank" title="TOP 5 chiếc điện thoại giá rẻ, cấu hình" type="TOP 5 chiếc điện thoại giá rẻ, cấu hình">giá rẻ cấu hình</a><a href="https://www.thegioididong.com/tin-tuc/xem-truoc/1366900" target="_blank" title="TOP 5 chiếc điện thoại giá rẻ, cấu hình cao" type="TOP 5 chiếc điện thoại giá rẻ, cấu hình cao">&nbsp;cao</a>&nbsp;sau&nbsp;đây sẽ&nbsp;đáp&nbsp;ứng&nbsp;được tốt&nbsp;yêu cầu của bạn về cấu hình cũng như có mức giá vô cùng phải chăng&nbsp;đó nha.</span></h2>

<p><span style="font-size:22px">Bên cạnh đó, cả 5 chiếc điện thoại dưới đây còn đang có chương trình ưu đãi giảm giá dịp sale Black Friday tại&nbsp;<a href="https://www.thegioididong.com/" target="_blank" title="Thế Giới Di Động" type="Thế Giới Di Động">Thế Giới Di&nbsp;Động</a>. Đừng bỏ lỡ nếu&nbsp;bạn muốn có một &quot;em&quot;&nbsp;điện thoại chiến game&nbsp;ngon nghẻ nhé.</span></p>

<p><span style="font-size:22px"><em>*Danh sách&nbsp;được mình sắp xếp theo thứ tự giá tăng dần bạn nha.</em></span></p>

<h3><span style="font-size:22px"><strong>1.&nbsp;Samsung Galaxy A12 6GB (2021)</strong></span></h3>

<p><span style="font-size:22px"><img alt="" src="https://www.thegioididong.com/tin-tuc/tim-mua-dien-thoai-cau-hinh-khung-gia-re-nam-2021-1366900" /></span></p>

<p><span style="font-size:22px">Video đánh giá Galaxy A12 thực hiện bởi kênh YouTube Thế Giới Di Động.</span></p>

<p><span style="font-size:22px">Nhà&nbsp;<a href="https://www.thegioididong.com/dtdd-samsung" target="_blank" title="SamSung" type="SamSung">SamSung</a>&nbsp;cho ra mắt&nbsp;<a href="https://www.thegioididong.com/dtdd/samsung-galaxy-a12-6gb-2021" target="_blank" title="Galaxy A12 6GB (2021)" type="Galaxy A12 6GB (2021)">Galaxy A12 6GB (2021)</a>&nbsp;với trang bị&nbsp;bộ vi xử lý&nbsp;Exynos 850 cùng với RAM 6 GB vô cùng mạnh mẽ, giúp bạn có thể thoải mái&nbsp;đa nhiệm hay chiến game trong nhiều giờ liền mà không gặp tình trạng giật lag, vốn là vấn&nbsp;đề rất gây khó chịu khi&nbsp;đang trong trận của các game thủ.</span></p>

<p style="text-align:center"><span style="font-size:22px"><img alt="Samsung Galaxy A12 6GB (2021)" src="https://cdn.tgdd.vn/Files/2021/07/09/1366900/samsunggalaxya121-16_1280x720-800-resize.jpg" title="Samsung Galaxy A12 6GB (2021)" /></span></p>

<p><span style="font-size:22px">Ngoài ra chiếc máy còn giúp bạn kéo dài trải nghiệm với viên pin bền bỉ 5.000 mAh cùng sạc nhanh 15 W&nbsp;đến hơn 8 tiếng sử dụng liên tục các nhu cầu chơi game, xem phim, lướt&nbsp;web,...</span></p>

<p style="text-align:center"><span style="font-size:22px"><img alt="Samsung Galaxy A12 6GB (2021)" src="https://cdn.tgdd.vn/Files/2021/07/09/1366900/samsunggalaxya121-26_1280x720-800-resize.jpg" title="Samsung Galaxy A12 6GB (2021)" /></span></p>

<p><span style="font-size:22px">Samsung Galaxy A12 6GB (2021)</span></p>

<p><span style="font-size:22px">Galaxy A12 còn&nbsp;có màn hình kích thước lớn 6.5 inch đạt độ phân giải HD+ sẽ cho bạn những khung hình sắc nét, rực rỡ, hỗ trợ&nbsp;trải nghiệm chơi game trên&nbsp;điện thoại của bạn tốt hơn nhờ hiển thị&nbsp;đồ họa chất lượng.</span></p>

<p><span style="font-size:22px">Tấm nền PLS TFT LCD tương tự như IPS của chiếc điện thoại này mang đến&nbsp;cho bạn góc nhìn rộng, cải thiện độ sáng màn hình tốt, tăng tỷ lệ tương phản của hình ảnhgiúp điện thoại thể hiện khung hình có chất lượng ổn, màu sắc&nbsp;ổn&nbsp;định mà không bị gắt màu.</span></p>

<p><span style="font-size:22px">Nếu bạn cần sắm ngay một chiếc&nbsp;điện thoại giá rẻ nhưng hiệu năng&nbsp;đủ tốt&nbsp;để chơi game thì chớ nên bỏ qua chiếc&nbsp;điện thoại này nhé.</span></p>

<ul>
	<li><span style="font-size:22px"><a href="https://www.thegioididong.com/tin-tuc/danh-gia-chi-tiet-galaxy-a12-1316862" target="_blank" title="Đánh giá Galaxy A12: Pin gần 9 tiếng, đầu tư kĩ về camera" type="Đánh giá Galaxy A12: Pin gần 9 tiếng, đầu tư kĩ về camera">Đánh giá Galaxy A12: Pin gần 9 tiếng, đầu tư kĩ về camera.</a></span></li>
</ul>

<p>&nbsp;</p>

<p style="text-align:center"><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/samsung-galaxy-a12-6gb-2021"><img src="https://cdn.tgdd.vn/Products/Images/42/251888/samsung-galaxy-a12-2021-black-600x600.jpg" title="Samsung Galaxy A12 6GB (2021)" /></a></span></p>

<h3><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/samsung-galaxy-a12-6gb-2021">Samsung Galaxy A12 6GB (2021)</a></span></h3>

<h6><span style="font-size:22px">Online giá rẻ</span></h6>

<p><span style="font-size:22px"><strong>4.490.000₫</strong>&nbsp;4.690.000₫</span></p>

<p><span style="font-size:22px">Trả góp 0%</span></p>

<p><span style="font-size:22px">Màn hình 6.5&quot;, Chip Exynos 850RAM 6 GB, ROM 128 GBCamera sau: Chính 48 MP &amp; Phụ 5 MP, 2 MP, 2 MPCamera trước: 8 MPPin 5000 mAh, Sạc 15 W</span></p>

<p><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/samsung-galaxy-a12-6gb-2021">XEM CHI TIẾT</a></span></p>

<p><span style="font-size:22px">&nbsp;&nbsp;</span></p>

<p>&nbsp;</p>

<h3><span style="font-size:22px"><strong>2.&nbsp;Xiaomi Redmi 9T (6GB/128GB)</strong></span></h3>

<p><span style="font-size:22px"><img alt="" src="https://www.thegioididong.com/tin-tuc/tim-mua-dien-thoai-cau-hinh-khung-gia-re-nam-2021-1366900" /></span></p>

<p><span style="font-size:22px">Video đánh giá chi tiết Xiaomi Redmi 9T thực hiện bởi kênh YouTube Thế Giới Di Động</span></p>

<p><span style="font-size:22px">Với thiết kế đẹp mắt và trẻ trung,&nbsp;<a href="https://www.thegioididong.com/dtdd/xiaomi-redmi-9t-6gb" target="_blank" title="Xiaomi Redmi 9T" type="Xiaomi Redmi 9T">Xiaomi Redmi 9T</a>&nbsp;đã không khiến cho người dùng&nbsp;thất vọng khi có được&nbsp;sức mạnh cấu hình&nbsp;từ chip Rồng&nbsp;662 kèm theo 6 GB RAM, chắc chắn sẽ&nbsp;giúp chiếc máy vận hành trơn tru khi mở nhiều ứng dụng cũng như chiếc mượt các tựa game hot&nbsp;như Liên Quân Mobile, PUBG,...&nbsp;ở mức&nbsp;đồ họa trung bình.</span></p>

<p style="text-align:center"><span style="font-size:22px"><img alt="Xiaomi Redmi 9T (6GB/128GB)" src="https://cdn.tgdd.vn/Files/2021/07/09/1366900/redmi9tden-8_1280x720-800-resize.jpg" title="Xiaomi Redmi 9T (6GB/128GB)" /></span></p>

<p><span style="font-size:22px">Chiếc điện thoại&nbsp;cũng được trang bị cho viên pin cực trâu 6.000 mAh cùng công nghệ sạc nhanh 18 W, cho bạn thời gian hoạt&nbsp;động trên thiết bị&nbsp;đến tận 2 ngày&nbsp;với thao tác sử dụng cơ bản mà không cần phải sạc pin.</span></p>

<p style="text-align:center"><span style="font-size:22px"><img alt="Xiaomi Redmi 9T (6GB/128GB)" src="https://cdn.tgdd.vn/Files/2021/07/09/1366900/redmi9tgame-_2048x1152-800-resize.jpg" title="Xiaomi Redmi 9T (6GB/128GB)" /></span></p>

<p><span style="font-size:22px">Xiaomi Redmi 9T (6GB/128GB)</span></p>

<p><span style="font-size:22px">Sở hữu màn hình IPS LCD&nbsp;kích thước rộng 6.53 inch với độ phân giải&nbsp;Full HD+&nbsp;cho phép Redmi 9T có thể hiển thị nhiều nội dung giải trí với rõ nét, màu sắc tươi tắn hơn cùng góc nhìn rộng, trải nghiệm hình&nbsp;ảnh của bạn sẽ&nbsp;được chất lượng hơn rất nhiều trên chiếc&nbsp;điện thoại này.</span></p>

<p><span style="font-size:22px">Ngoài ra,&nbsp;thiết kế kiểu màn hình giọt nước viền mỏng sẽ giúp&nbsp;tối ưu diện tích màn hình&nbsp;hiển thị, giúp cho việc chơi game, xem phim của bạn thêm sống động và ấn tượng hơn.</span></p>

<p><span style="font-size:22px">&nbsp;Redmi 9T cũng là một cái tên sáng giá&nbsp;để bạn cân nhắc bỏ vào danh mục mua sắm của mình&nbsp;đấy.</span></p>

<ul>
	<li><span style="font-size:22px"><a href="https://www.thegioididong.com/tin-tuc/redmi-9t-smartphone-gia-re-dang-mua-nhat-cho-sinh-vien-1378504" target="_blank" title="Vì sao Redmi 9T chính là smartphone đáng sắm nhất dành cho sinh viên?" type="Vì sao Redmi 9T chính là smartphone đáng sắm nhất dành cho sinh viên?">Vì sao Redmi 9T chính là smartphone đáng sắm nhất dành cho sinh viên?</a></span></li>
</ul>

<p>&nbsp;</p>

<p style="text-align:center"><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/xiaomi-redmi-9t-6gb"><img src="https://cdn.tgdd.vn/Products/Images/42/233130/xiaomi-redmi-9t-6gb-110621-080650-600x600.jpg" title="Xiaomi Redmi 9T (6GB/128GB)" /></a></span></p>

<h3><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/xiaomi-redmi-9t-6gb">Xiaomi Redmi 9T (6GB/128GB)</a></span></h3>

<p><span style="font-size:22px"><strong>4.990.000₫</strong>Trả góp 0%</span></p>

<p><span style="font-size:22px">Màn hình 6.53&quot;, Chip Snapdragon 662RAM 6 GB, ROM 128 GBCamera sau: Chính 48 MP &amp; Phụ 8 MP, 2 MP, 2 MPCamera trước: 8 MPPin 6000 mAh, Sạc 18 W</span></p>

<p><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/xiaomi-redmi-9t-6gb">XEM CHI TIẾT</a></span></p>

<p><span style="font-size:22px">&nbsp;&nbsp;</span></p>

<p>&nbsp;</p>

<h3><span style="font-size:22px"><strong>3. Realme C25s&nbsp;</strong></span></h3>

<p><span style="font-size:22px"><img alt="" src="https://www.thegioididong.com/tin-tuc/tim-mua-dien-thoai-cau-hinh-khung-gia-re-nam-2021-1366900" /></span></p>

<p><span style="font-size:22px">Video đánh giá chi tiết Realme C25s&nbsp;thực hiện bởi kênh YouTube Thế Giới Di Động</span></p>

<p><span style="font-size:22px">Tiếp nối sự thành công của thế hệ tiền nhiệm,&nbsp;<a href="https://www.thegioididong.com/dtdd/realme-c25s" target="_blank" title="Realme C25s" type="Realme C25s">Realme C25s</a>&nbsp;đã&nbsp;được cải tiến với một hiệu năng mạnh mẽ hơn&nbsp;khi có sự góp mặt&nbsp;của con chip Helio G85 và bộ nhớ trong 128 GB.</span></p>

<p><span style="font-size:22px">Sức mạnh của chiếc điện thoại này có thể vừa&nbsp;đảm bảo cho bạn một hiệu năng&nbsp;ổn&nbsp;định&nbsp;để chơi các tựa game&nbsp;đình&nbsp;đám hiện nay như&nbsp;Liên Quân, PUBG,... ở mức cấu hình phù hợp, lại vừa&nbsp;có không gian lưu trữ rộng mở, giúp bạn thoải mái&nbsp;lưu ứng dụng và hình ảnh thả ga và cả các bộ phim bạn yêu thích.&nbsp;</span></p>

<p style="text-align:center"><span style="font-size:22px"><img alt="Realme C25s " src="https://cdn.tgdd.vn/Files/2021/07/09/1366900/realmec25scam_1280x720-800-resize.jpg" title="Realme C25s " /></span></p>

<p><span style="font-size:22px">Realme C25s</span></p>

<p><span style="font-size:22px">Ngoài ra, trên máy cũng có viên pin cực khỏe&nbsp;6.000 mAh cho bạn thỏa sức kéo dài trải nghiệm&nbsp;đến 10 tiếng&nbsp;sử dụng liên tục.&nbsp;Củ sạc nhanh 33 W đi kèm cũng sẽ giúp bạn rút ngắn thời gian sạc pin đáng kể mà không cần phải&nbsp;đợi quá lâu.</span></p>

<p style="text-align:center"><span style="font-size:22px"><img alt="Điện thoại Realme C25s " src="https://cdn.tgdd.vn/Files/2021/07/09/1366900/realmec25sden-5_1280x720-800-resize.jpg" title="Điện thoại Realme C25s " /></span></p>

<p><span style="font-size:22px">Realme C25s còn sở hữu&nbsp;công nghệ màn hình IPS LCD kích thước 6.5 inch có độ phân giải HD+, cung cấp cho người dùng&nbsp;góc nhìn rộng rãi, chi tiết ổn, cùng các hỗ trợ giảm lượng ánh sáng phản xạ&nbsp;để màn hình không bị lóa sáng cho bạn trải nghiệm hình&nbsp;ảnh trên&nbsp;điện thoại chất lượng hơn.</span></p>

<p><span style="font-size:22px">Với những hiệu năng hỗ trợ khá tốt như vậy,&nbsp;Realme C25s sẽ là một sự lựa chọn hết&nbsp;ý cho bạn&nbsp;để chiến những trận&nbsp;đấu&nbsp;đỉnh cao cùng bạn bè&nbsp;đấy.</span></p>

<ul>
	<li><span style="font-size:22px"><a href="https://www.thegioididong.com/tin-tuc/realme-c25s--an-tuong-voi-vien-pin-6-000-mah-cau-hinh-on-dinh-1364113" target="_blank" title="Tìm kiếm smartphone pin trâu cấu hình tốt ư? Hãy mua ngay Realme C25s" type="Tìm kiếm smartphone pin trâu cấu hình tốt ư? Hãy mua ngay Realme C25s">Tìm kiếm smartphone pin trâu cấu hình tốt ư? Hãy mua ngay Realme C25s.</a></span></li>
</ul>

<p style="text-align:center"><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/realme-c25s"><img src="https://cdn.tgdd.vn/Products/Images/42/238483/realme-c25s-grey-7-600x600.jpg" title="Realme C25s" /></a></span></p>

<h3><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/realme-c25s">Realme C25s</a></span></h3>

<p><span style="font-size:22px"><strong>4.990.000₫</strong>Trả góp 0%</span></p>

<p><span style="font-size:22px">Màn hình 6.5&quot;, Chip MediaTek Helio G85RAM 4 GB, ROM 128 GBCamera sau: Chính 48 MP &amp; Phụ 2 MP, 2 MPCamera trước: 8 MPPin 6000 mAh, Sạc 18 W</span></p>

<p><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/realme-c25s">XEM CHI TIẾT</a></span></p>

<h3><span style="font-size:22px"><strong>4. Vivo Y51 (2020) (8GB/128GB)</strong></span></h3>

<p><span style="font-size:22px"><img alt="" src="https://www.thegioididong.com/tin-tuc/tim-mua-dien-thoai-cau-hinh-khung-gia-re-nam-2021-1366900" /></span></p>

<p><span style="font-size:22px">Video đánh giá chi tiết&nbsp;Vivo Y51 (2020) thực hiện bởi kênh YouTube Thế Giới Di Động</span></p>

<p><span style="font-size:22px">Nhà&nbsp;<a href="https://www.thegioididong.com/dtdd-vivo" target="_blank" title="Vivo " type="Vivo ">Vivo</a>&nbsp;trang bị cho&nbsp;<a href="https://www.thegioididong.com/dtdd/vivo-y51-2020" target="_blank" title="Vivo Y51 (2020)" type="Vivo Y51 (2020)">Vivo Y51 (2020)</a>&nbsp;một cấu hình ổn định khi sử dụng chip &quot;rồng&quot; 662 cùng 8 GB RAM, bảo đảm mang&nbsp;đến cho bạn&nbsp;trải nghiệm&nbsp;chiến game cực máu lửa cùng bạn bè mà không sợ bị giật lag hoặc&nbsp;đứng mất gây mất hứng khi&nbsp;đang trong trận&nbsp;đấu.</span></p>

<p><span style="font-size:22px">Không những thế,&nbsp;Y51 còn được ưu ái cho viên pin trâu 5.000 mAh cho thời lượng sử dụng tẹt ga, đã thế còn có hỗ trợ thêm&nbsp;công nghệ sạc nhanh 18 W.&nbsp;Với dung lượng pin này, bạn có thể sử dụng thoải mái trong vòng một ngày mà không cần phải quá lo lắng về vấn đề sạc pin luôn&nbsp;đó.&nbsp;</span></p>

<p style="text-align:center"><span style="font-size:22px"><img alt="Vivo Y51 (2020)" src="https://cdn.tgdd.vn/Files/2021/07/09/1366900/vivoy51mh-_2048x1152-800-resize.jpg" title="Vivo Y51 (2020)" /></span></p>

<p><span style="font-size:22px">Vivo Y51 (2020).</span></p>

<p><span style="font-size:22px">Máy sở hữu thiết kế tràn viền khá mỏng với kích thước lớn lên đến 6.58 inch cùng độ phân giải FULL HD+, đi cùng với tấm nền IPS LCD cho hình ảnh hiển thị tươi sáng và đầy đủ nội dung. Mình đánh giá chơi game trên chiếc điện thoại này&nbsp;khá là thích vì màn hình không bị chói sáng ngay cả khi&nbsp;đang không ngồi trực diện nhờ công nghệ màn hình&nbsp;được tối&nbsp;ưu.</span></p>

<p><span style="font-size:22px">Y51 là chiếc&nbsp;điện thoại&nbsp;đáng&nbsp;để bạn cân nhắc&nbsp;để chọn mua trong mùa sale này vì những hiệu năng khá nổi bật trong tầm giá của nó&nbsp;đó nha.</span></p>

<ul>
	<li><span style="font-size:22px"><a href="https://www.thegioididong.com/tin-tuc/danh-gia-chi-tiet-vivo-y51-2020-1317825" target="_blank" title="Đánh giá Vivo Y51 (2020)" type="Đánh giá Vivo Y51 (2020)">Đánh giá chi tiết Vivo Y51 (2020): Khoác lên một chiếc áo hào nhoáng</a></span></li>
</ul>

<p>&nbsp;</p>

<p style="text-align:center"><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/vivo-y51-2020"><img src="https://cdn.tgdd.vn/Products/Images/42/228950/vivo-y51-bac-600x600-600x600.jpg" title="Vivo Y51 (2020)" /></a></span></p>

<h3><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/vivo-y51-2020">Vivo Y51 (2020)</a></span></h3>

<p><span style="font-size:22px"><strong>5.990.000₫</strong>&nbsp;6.290.000₫</span></p>

<p><span style="font-size:22px"><img alt="BLACK FRIDAY" src="https://cdn.tgdd.vn/2020/10/content/icon1-50x50.png" style="height:20px; width:20px" />BLACK FRIDAY</span></p>

<p><span style="font-size:22px">&nbsp;Trả góp 0%</span></p>

<p><span style="font-size:22px">Màn hình 6.58&quot;, Chip Snapdragon 662RAM 8 GB, ROM 128 GBCamera sau: Chính 48 MP &amp; Phụ 8 MP, 2 MPCamera trước: 16 MPPin 5000 mAh, Sạc 18 W</span></p>

<p><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/vivo-y51-2020">XEM CHI TIẾT</a></span></p>

<p><span style="font-size:22px">&nbsp;&nbsp;</span></p>

<p>&nbsp;</p>

<h3><span style="font-size:22px"><strong>5. Xiaomi Redmi Note 10 5G (8GB/128GB)</strong></span></h3>

<p><span style="font-size:22px"><img alt="" src="https://www.thegioididong.com/tin-tuc/tim-mua-dien-thoai-cau-hinh-khung-gia-re-nam-2021-1366900" /></span></p>

<p><span style="font-size:22px">Video đánh giá chi tiết&nbsp;Redmi Note 10 5G thực hiện bởi kênh YouTube Thế Giới Di Động</span></p>

<p><span style="font-size:22px">Cấu hình của chiếc&nbsp;<a href="http://www.thegioididong.com/dtdd/xiaomi-redmi-note-10-5g" target="_blank" title="Redmi Note 10 5G" type="Redmi Note 10 5G">Redmi Note 10 5G</a>&nbsp;rất ổn định khi mang trong mình con chip Dimensity 700 đi cùng với 8 GB RAM, mà theo nhà sản xuất công bố thì con chip này được tối ưu dành riêng để&nbsp;chơi game.</span></p>

<p><span style="font-size:22px">Vì vậy, bạn có thể hoàn toàn yên tâm khi trải nghiệm không gian trò chơi cực chiến&nbsp;trên chiếc&nbsp;điện thoại này với một cấu hình chạy khá&nbsp;ổn&nbsp;định và mượt mà bạn nhé.</span></p>

<p><span style="font-size:22px">Ngoài ra viên pin của máy cũng đáng được nhắc đến khi lên đến con số 5.000 mAh và hỗ trợ&nbsp;sạc nhanh 18 W bảo đảm cho bạn 1 trải nghiệm xem phim, chơi game, lướt web,...&nbsp;xuyên suốt lên đến hơn 8 tiếng mà không bị ngắt mạch cảm xúc giữa chừng luôn nè.&nbsp;</span></p>

<p style="text-align:center"><span style="font-size:22px"><img alt="Xiaomi Redmi Note 10 5G chụp ảnh rất tươi" src="https://cdn.tgdd.vn/Files/2021/07/09/1366900/xiaominote105g_1280x720-800-resize.jpg" title="Xiaomi Redmi Note 10 5G chụp ảnh rất tươi" /></span></p>

<p><span style="font-size:22px">Xiaomi Redmi Note 10 5G&nbsp;còn sở hữu tấm nền IPS LCD &quot;quốc dân&quot; thường thấy ở phân khúc điện thoại tầm trung và đạt độ phân giải FULL HD+ trong kích thước 6.5 inch mà mình đánh giá là đủ dùng&nbsp;để&nbsp;đáp&nbsp;ứng các nhu cầu xem phim, chơi game,... của bạn.</span></p>

<p><span style="font-size:22px">Điểm&nbsp;đáng chú&nbsp;ý&nbsp;ở chiếc&nbsp;điện thoại này chính là tần số quét màn hình lên&nbsp;đến 90 Hz cho thao tác vuốt chạm mượt mà và cho tốc độ phản hồi nhanh&nbsp;nhạy hơn so với phiên bản cũ.</span></p>

<p><span style="font-size:22px">Redmi Note 10 là chiếc&nbsp;điện thoại&nbsp;đáng&nbsp;đồng tiền bát gạo trong phân khúc nếu bạn&nbsp;đang tìm kiếm một con máy tầm trung chơi game mượt mà&nbsp;đó.</span></p>

<ul>
	<li><span style="font-size:22px"><a href="https://www.thegioididong.com/tin-tuc/danh-gia-chi-tiet-redmi-note-10-5g-1357531" target="_blank" title="đánh giá redmi note 10 5g" type="đánh giá redmi note 10 5g">Đánh giá Redmi Note 10 5G: Quá hời cho 1 chiếc smartphone tầm trung!</a></span></li>
</ul>

<p>&nbsp;</p>

<p style="text-align:center"><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/xiaomi-redmi-note-10-5g"><img src="https://cdn.tgdd.vn/Products/Images/42/235971/xiaomi-redmi-note-10-5g-xanh-bong-dem-1-600x600.jpg" title="Xiaomi Redmi Note 10 5G 8GB" /></a></span></p>

<h3><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/xiaomi-redmi-note-10-5g">Xiaomi Redmi Note 10 5G 8GB</a></span></h3>

<p><span style="font-size:22px"><strong>5.990.000₫</strong>Trả góp 0%</span></p>

<p><span style="font-size:22px">Màn hình 6.5&quot;, Chip MediaTek Dimensity 700RAM 8 GB, ROM 128 GBCamera sau: Chính 48 MP &amp; Phụ 2 MP, 2 MPCamera trước: 8 MPPin 5000 mAh, Sạc 18 W</span></p>

<p><span style="font-size:22px"><a href="https://www.thegioididong.com/dtdd/xiaomi-redmi-note-10-5g">XEM CHI TIẾT</a></span></p>

<p><span style="font-size:22px">&nbsp;&nbsp;</span></p>

<p>&nbsp;</p>

<h3><span style="font-size:22px"><strong>Tổng kết</strong></span></h3>

<p><span style="font-size:22px">Mình đã giúp bạn điểm qua TOP 5 điện thoại giá rẻ, cấu hình cao đáng sắm nhất dịp sale Black Friday này tại Thế Giới Di Động. Hy vọng sẽ giúp bạn&nbsp;chốt đơn được một chiếc điện thoại ưng ý để chiến game&nbsp;cùng bạn bè nhé.</span></p>

<p><span style="font-size:22px">Bạn cảm thấy thích thú với chiếc điện thoại nào nhất?&nbsp;Hãy để lại bình luận phía dưới cho mình biết với nha.&nbsp;</span></p>

<p style="text-align:center"><span style="font-size:22px"><img alt="Black Friday là gì? Làm sao để sắm đồ công nghệ giá tốt trong ngày này?" src="https://cdn.tgdd.vn/Files/2017/11/23/1043993/blackfridaythegioididong_1280x609-800-resize.jpg" title="Black Friday là gì? Làm sao để sắm đồ công nghệ giá tốt trong ngày này?" /></span></p>

<p><span style="font-size:22px">Không quên nhắc bạn là hiện tại Thế Giới Di Động&nbsp;đang diễn ra&nbsp;chương trình Black Friday dành cho khách hàng mua sắm các thiết bị mới, từ 24/11 - 30/11/2021&nbsp;với nhiều ưu đãi hấp dẫn. Mọi chi tiết chương trình các bạn có thể xem tại nút cam bên dưới nhé.</span></p>
', 1, CAST(N'2021-12-21T19:32:34.540' AS DateTime), N'Tìm mua điện thoại giá rẻ cấu hình cao năm 2021? Đâu là sự lựa chọn hợp lý nhất, xem ngay 5 cái tên sau đây để chốt đơn nhé!')
INSERT [dbo].[Posts] ([Post_id], [Post_Name], [Image], [Detail], [Status], [Post_date], [Post_conten]) VALUES (6, N'Deal ngon cuối tuần: Săn ngay Galaxy A52s 5G giá đẹp ngất ngây kèm trả góp 0%, cơ hội mua sắm cuối năm không thể bỏ lỡ', N'blog7.jpg', N'<h1>[Bài PR] Công ty Điện tử Samsung cùng &ldquo;Kỷ nguyên của sự trải nghiệm&rdquo;</h1>

<p>on 03/01/2020&nbsp;by H.S. Kim</p>

<p>Chia sẻ&nbsp;<a href="javascript:;">Share open/close</a>&nbsp;Print</p>

<p><img alt="" src="https://img.global.news.samsung.com/vn/wp-content/uploads/2020/03/HS-Kim-CES2020-Editorial_main1-1.jpg" style="height:667px; width:1000px" /></p>

<p>Ông H.S. Kim, Chủ tịch kiêm Tổng giám đốc điều hành Ngành hàng Điện tử Tiêu dùng, Tập đoàn Điện tử Samsung</p>

<p>Đầu năm thường là khoảng thời gian lý tưởng để suy ngẫm về những gì đã làm được trong năm cũ và hướng tới những điều mới mẻ trong tương lai. Đó là khoảnh khắc khi chúng ta nhận ra được những thách thức và cơ hội của mình và bắt đầu đề ra những kế hoạch phát triển mới.</p>

<p>&nbsp;</p>

<p>Và hội nghị công nghệ tiêu dùng lớn nhất thế giới &ndash; CES 2020, tại Las Vegas sẽ là nơi hoàn hảo để chúng ta trải nghiệm những điều mới mẻ. Đó là một hội nghị mà tôi mong đợi hàng năm, nơi tập hợp những công nghệ mới sáng tạo nhất trong ngành nhằm giới thiệu thấy những công nghệ mới và định hướng cho công nghệ trong tương lai.</p>

<p>&nbsp;</p>

<p>Tôi rất vui mừng khi Công ty điện tử Samsung lại một lần nữa góp mặt tại CES năm nay và dẫn bước khách tham quan đến những công nghệ đổi mới tiên tiến mang tính cách mạng. Bên cạnh đó, tôi phải nói rằng năm nay sẽ là một năm đặc biệt độc đáo. Đây là năm bắt đầu một thập kỷ mới và tôi rất vinh dự được khởi động năm mới bằng bài phát biểu trước buổi lễ cho Samsung vào ngày 6 tháng 1.</p>

<p>&nbsp;</p>

<p>Một cột mốc quan trọng như năm 2020 giúp chúng ta nhìn lại những thành tựu trong mười năm qua và đặt ra những viễn cảnh mới dành cho tương lai. Khi nhìn lại, tôi thấy một thập kỷ của sự tiến bộ vượt bậc; thiết bị di động với kết nối thông minh đang trở nên ngày càng phổ biến; ra đời vào năm 2010, Internet vạn vật kết nối (IoT) đã nổi lên như một trong những khía cạnh công nghệ phát triển nhất. Ngày nay, phần lớn các thiết bị của chúng tôi đều được hỗ trợ IoT và chúng tôi sẽ tiếp tục mang đến những trải nghiệm mới mẻ nhất cho người dùng bằng cách tạo ra các sản phẩm ngày càng mang tính kết nối và thông minh hơn. Và tất nhiên, trí tuệ nhân tạo (AI) đã được tao ra và sẵn sàng trở thành một trong những công nghệ có thể tạo ra sự ảnh hưởng nhất trong đời sống, đồng thời định hình và tạo ra những trải nghiệm mới trong cuộc sống và công việc của chúng ta.</p>

<p>&nbsp;</p>

<p>Điều đáng nói là chúng ta đang tập hợp ở Las Vegas trong một thập kỷ mới, để xem những gì sẽ xuất hiện ở phía trước. Tại Samsung, chúng tôi thấy một tương lai tràn đầy những cơ hội. Năm 2020, với sự xuất hiện của AI và IoT, kết hợp với sức mạnh của 5G sẽ là thời điểm thích hợp để hiện thực hóa tầm nhìn của chúng tôi về một thế giới kết nối thông minh.</p>

<p>&nbsp;</p>

<p><img alt="" src="https://img.global.news.samsung.com/vn/wp-content/uploads/2020/03/HS-KIM-Editorial-CES2020_QUOTEFF.jpg" style="height:250px; width:1000px" /></p>

<p>Tất nhiên, để thực hiện được những định hướng trong tương lai, chúng ta phải hiểu được điều mà người dùng đang hướng tới, vì sự thay đổi thị hiếu và lợi ích của họ chính là động lực thúc đẩy công ty ngày càng phát triển. Ngày nay, sự đô thị hóa nhanh chóng cùng việc nhân khẩu học thay đổi đang tạo ra sự đổi mới trong cách nhìn nhận của chúng ta về thế giới xung quanh. Và những sự thay đổi này đã tạo nên vô số cơ hội đổi mới, đồng thời mang lại giá trị mới cho người dùng và xã hội. Bởi vì khi nhìn vào tương lai, chúng ta sẽ hiểu được mọi người đang ngày càng mong muốn nhiều hơn. Không chỉ đơn giản là nhiều thứ hơn, mà là nhiều trải nghiệm hơn và làm cho những công nghệ mới này ngày càng hữu ích trong cuộc sống của họ.</p>

<p>&nbsp;</p>

<p>Và như vậy một thời đại mới trong công nghệ sẽ được hình thành khi một thập kỷ mới bắt đầu:&nbsp;<strong>Kỷ nguyên&nbsp;của sự Trải nghiệm</strong>.</p>

<p>&nbsp;</p>

<p>Kỷ nguyên của sự trải nghiệm sẽ được đánh dấu bởi những công nghệ được cá nhân hóa nhằm đáp ứng nhu cầu của người dùng. Điều đó có nghĩa là các thiết bị bạn sử dụng sẽ có thể hiểu bạn như một người bạn, xóa bỏ ranh giới giữa thế giới kỹ thuật số và vật lý; đồng thời thay đổi cách bạn tương tác với thế giới và cộng đồng.</p>

<p>&nbsp;</p>

<p>Kỷ nguyên của sự trải nghiệm sẽ giúp bạn tạo ra một sự kết nối hữu hình với công nghệ theo cách mà một người không thể thực hiện được trong quá khứ. Thay vì phải thay đổi những thói quen hằng ngày để có thể kết hợp nhiều thiết bị hơn, thiết bị của bạn sẽ hoạt động một cách liền mạch để phục vụ cho bạn. hãy hình dung rằng bạn sẽ có thể làm được nhiều thứ hơn với một người bạn đồng hành thông minh, luôn hỗ trợ bạn, và đáp ứng các nhu cầu của bạn ngay lập tức.</p>

<p>&nbsp;</p>

<p>Và điều làm cho khoảnh khắc này đặc biệt là chính Samsung sẽ là người dẫn đầu trong kỷ nguyên của sự trải nghiệm này. Với sự đầu tư mạnh mẽ và sự dẫn đầu đã được chứng minh trong các lĩnh vực IoT, AI và 5G, những trải nghiệm công nghệ tương lai sẽ được xây dựng trên các công nghệ mà Samsung đang giữ vị trí tiên phong hiện nay.</p>

<p>&nbsp;</p>

<p>Nhưng điều có lẽ là quan trọng nhất đối với Samsung &ndash; và điều tôi mong muốn được nhấn mạnh hơn nữa trên sân khấu CES &ndash; là cam kết của chúng tôi về việc tận dụng tất cả những tiến bộ này như một nguồn lực cho sự đổi mới. Tôi luôn tin rằng công nghệ phải được sử dụng để giúp nâng tầm những trải nghiệm của chúng ta, để tạo ra một môi trường sống tốt hơn cho tất cả mọi người. Tại Samsung, sự đổi mới có nghĩa là tối đa hóa tiềm lực con người và hợp tác mở với các đối tác hàng đầu để phát triển công nghệ nhân loại tiên tiến; và tôi tin rằng Kỷ nguyên của sự trải nghiệm sẽ đạt được thành công trong năm 2020 và còn tiến xa hơn thế nữa.</p>

<p>&nbsp;</p>

<p>Cuối cùng, đổi mới không phải là mục tiêu duy nhất, mà là điểm khởi đầu để tạo ra một thế giới tốt hơn. Vì vậy để kiến tạo một tương lai tốt đẹp hơn cần có sự hợp tác cùng nhau từ người tiêu dùng, đến các nhà đổi mới, và thậm chí đến những công nghệ tại gia.</p>

<p>&nbsp;</p>

<p>Chúng tôi đã chuẩn bị rất nhiều và tôi rất vui mừng được chia sẻ nhiều hơn nữa về kỷ nguyên của sự trải nghiệm trong năm 2020 và trong tương lai. Hẹn gặp lại các bạn vào thứ Hai ngày 6 tháng 1 tới đây.</p>
', 1, CAST(N'2021-12-21T19:34:21.530' AS DateTime), N'[Bài PR] Công ty Điện tử Samsung cùng “Kỷ nguyên của sự trải nghiệm”
on 03/01/2020 by H.S. Kim')
INSERT [dbo].[Posts] ([Post_id], [Post_Name], [Image], [Detail], [Status], [Post_date], [Post_conten]) VALUES (7, N'Deal ngon cuối tuần: Săn ngay Galaxy A52s 5G giá đẹp ngất ngây kèm trả góp 0%, cơ hội mua sắm cuối năm không thể bỏ lỡ', N'blog.jpg', N'<h1>BÀI LUẬN TIẾNG ANH VỀ CÔNG NGHỆ THÔNG TIN: MỘT GÓC CỦA CÔNG NGHỆ</h1>

<hr />
<p>Khi nhu cầu của con người càng lớn thì họ lại càng có nhiều ý tưởng sáng tạo để đáp ứng được những nhu cầu đó của chính mình. Đó là lý do tại sao công nghệ thông tin lại ra đời và phát triển ở tầm cao như vậy. Và không thể phủ nhận được những lợi ích cực kỳ to lớn mà Công nghệ đã mang đến cho cuộc sống của chúng ta. Nhưng nó cũng mang đến những thứ bất lợi. Hãy cùng Aroma có những nhìn nhận về vấn đề này qua &ldquo;<a href="http://aroma.vn/tieng-anh-chuyen-nganh-cong-nghe-thong-tin/" rel="noopener noreferrer" target="_blank"><strong>Bài luận tiếng anh về công nghệ thông tin</strong></a>: Một góc của công nghệ&rdquo; nhé.</p>

<ul>
	<li><strong><a href="http://aroma.vn/tieng-anh-giao-tiep/">Lộ trình học tiếng anh giao tiếp</a>&nbsp;</strong></li>
	<li><a href="http://aroma.vn/mau-cau-giao-tiep-tieng-anh-chuyen-nganh-cong-nghe-thong-tin/" rel="noopener noreferrer" target="_blank"><strong>Mẫu câu giao tiếp tiếng anh chuyên ngành công nghệ thông tin</strong></a></li>
</ul>

<p><img alt="Bai-luan-tieng-anh-ve-cong-nghe-thong-tin-mot-goc-cua-cong-nghe" src="http://aroma.vn/web/wp-content/uploads/2017/11/e46060a4-bai-luan-tieng-anh-ve-cong-nghe-thong-tin-mot-goc-cua-cong-nghe.jpg" style="height:333px; width:500px" title="Bài luận tiếng anh về công nghệ thông tin: Một góc của công nghệ" /></p>

<h2>Bài luận tiếng anh về công nghệ thông tin: Một góc của công nghệ</h2>

<ol>
	<li>
	<h3>Bài luận:&nbsp;</h3>
	</li>
</ol>

<p><em>Technology is now a big part of our society and our predictable future. There is little room for people who wish to live without technology, and luckily, it is still advancing at a rate that has helped stave off stagnation. I believe that for every advantage that technology brings us, it also brings us a disadvantage at the same time.</em></p>

<p><em>Smartphones enable people to stay in touch, even over long distances, and they are relatively safe and reliable to use. There are devices that people can use to communicate with plus at the other end of the planet and getting and keeping in touch with other people is very easy.</em></p>

<p><em>The disadvantages of smartphone is that it means people no longer need to meet in person as much, and interpersonal relationships are suffering worldwide because people are communicating through a small handheld device. A lot of people have smartphones and they use them almost semi-continuously, including in public settings when they could be making new friends, finding new lovers, and interacting with their current friends.</em></p>

<p><em>The advantages of the internet are that people can communicate over vast distances and can gain access to information and get answers to their questions very quickly. The disadvantage is that the Internet isn&rsquo;t moderated in the way that people think and lots of it is filled with misinformation and outright lies.</em></p>

<p><em>Even brand-named websites which have a lot of trust are not accountable for what appears on their own websites. Even respected and branded news sites have stories that have passed through many people&rsquo;s hands and originally started as lies with zero accountability throughout the dissemination process.</em></p>

<p><em>In conclusion, technology brings about such a lot of advantages. However, it&rsquo;s people&rsquo;s duty to use it in an appropriate way to make it beneficial.</em></p>

<ol start="2">
	<li>
	<h3>Bài dịch</h3>
	</li>
</ol>

<p>Công nghệ hiện nay là một phần quan trọng trong xã hội chúng ta và tương lai có thể dự đoán được của chúng ta. Có rất ít chỗ cho những người muốn sống mà không có công nghệ, và may mắn thay, nó vẫn được tiếp diễn với tốc độ đủ để giúp ngăn chặn tình trạng trì trệ. Tôi tin rằng cùng với những lợi ích mà công nghệ mang lại, nó cũng gây ra cho chúng ta những bất lợi.</p>

<p>Điện thoại cho phép mọi người giữ liên lạc, thậm chí trên một khoảng cách dài, và chúng là tương đối an toàn và đáng tin cậy để sử dụng. Có các thiết bị mà mọi người có thể sử dụng để giao tiếp với cộng ở phía bên kia của hành tinh này và nhận được và giữ liên lạc với những người khác rất dễ dàng.</p>

<p>Các nhược điểm của điện thoại thông minh là nó có nghĩa là người ta không còn cần phải đáp ứng trong người càng nhiều, và mối quan hệ giữa các cá nhân đang trải qua trên toàn thế giới bởi vì mọi người đang giao tiếp thông qua một thiết bị cầm tay nhỏ. Rất nhiều người có điện thoại thông minh và họ sử dụng chúng gần như liên tục, kể cả ở nơi công cộng khi họ có thể được những người bạn mới, tìm người yêu mới, và tương tác với bạn bè hiện tại của họ.</p>

<p>Những lợi thế của internet là mọi người có thể giao tiếp khoảng cách rất lớn và có thể truy cập thông tin và tìm được câu trả lời cho câu hỏi của họ rất nhanh chóng. Điểm bất lợi là Internet không kiểm duyệt theo cách mà mọi người nghĩ và rất nhiều của nó được làm đầy với thông tin sai lạc và những lời nói dối trắng trợn.</p>

<p>Ngay cả các trang web mang tên thương hiệu được tin dùng cũng không chịu trách nhiệm cho những gì xuất hiện trên các trang web riêng của họ. Thậm chí những trang có uy tín và thương hiệu lớn lại có những câu chuyện đã qua tay nhiều người và ban đầu được bắt đầu với sự giả dối và không trách nhiệm.</p>

<p>Kết luận lại, công nghệ mang lại nhiều như vậy lợi thế. Tuy nhiên, đó là nhiệm vụ của mọi người sử dụng nó một cách thích hợp để làm cho nó thật có ích.</p>

<p>Đúng là cái gì cũng có hai mặt. Công nghệ đúng là rất có ích cho cuộc sống của con người. Nó giúp con người thuận tiện trong cả làm việc và giao tiếp. Nhưng không phải lúc nào cũng là những lợi ích, công nghệ cũng gây ra nhiều phiền toái cho chính chúng ta &ndash; những người đang sử dụng nó.</p>

<p>Bạn hãy xem &ldquo;<a href="http://aroma.vn/bai-luan-tieng-a%E2%80%A6oc-cua-cong-nghe/" rel="noopener noreferrer" target="_blank"><strong>Bài luận tiếng anh về công nghệ thông tin: Một góc của công nghệ</strong></a>&rdquo; để nêu quan điểm của bạn về vấn đề này nhé. Và bạn cũng đừng quên đón chờ&nbsp;<a href="http://aroma.vn/bai-luan-tieng-anh/" rel="noopener noreferrer" target="_blank"><strong>những bài luận bằng tiếng anh hay</strong></a>&nbsp;tiếp theo của Aroma. Chúc các bạn thành công.</p>
', 1, CAST(N'2021-12-21T19:34:31.493' AS DateTime), N'BÀI LUẬN TIẾNG ANH VỀ CÔNG NGHỆ THÔNG TIN: MỘT GÓC CỦA CÔNG NGHỆ')
INSERT [dbo].[Posts] ([Post_id], [Post_Name], [Image], [Detail], [Status], [Post_date], [Post_conten]) VALUES (8, N'ádsadasdsad', N'10-cua-hang-dien-thoai-uy-tin-ha-noi-2-1.jpg', N'<p>ádasd</p>
', 1, CAST(N'2023-11-12T10:26:54.180' AS DateTime), N'ádasd')
INSERT [dbo].[Posts] ([Post_id], [Post_Name], [Image], [Detail], [Status], [Post_date], [Post_conten]) VALUES (9, N'ádsadasdsad', NULL, N'<p>ádasd</p>
', 1, CAST(N'2023-11-02T05:48:11.583' AS DateTime), N'ádasd')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[product_detail] ON 

INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (4, 107, N'sản phẩm này thật hay', N'<p>sản phẩm này thật hay</p>
', N'Apper a12123', N'4gb', N'100gb', N'full hd', N'100mah')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (5, 108, N'sản phẩm này thật hay', N'<p>sản phẩm này thật hay</p>', N'Apper a12123', N'4gb', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (6, 109, N'4gb', N'100gb', N'full hd', N'100mah', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (7, 110, N'sản phẩm này thật hay', N'<p>sản phẩm này thật hay</p>', N'Apper a12123', N'4gb', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (8, 111, N'4gb', N'100gb', N'full hd', N'100mah', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (9, 112, N'sản phẩm này thật hay', N'<p>sản phẩm này thật hay</p>', N'Apper a12123', N'4gb', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (10, 113, N'4gb', N'100gb', N'full hd', N'100mah', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (11, 114, N'sản phẩm này thật hay', N'<p>sản phẩm này thật hay</p>', N'Apper a12123', N'4gb', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (12, 115, N'4gb', N'100gb', N'full hd', N'100mah', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (13, 116, N'sản phẩm này thật hay', N'<p>sản phẩm này thật hay</p>', N'Apper a12123', N'4gb', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (14, 117, N'4gb', N'<p>100gb</p>
', N'full hd', N'100mah', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (15, 118, N'sản phẩm này thật hay', N'<p>sản phẩm này thật hay</p>', N'Apper a12123', N'4gb', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (16, 119, N'4gb', N'100gb', N'full hd', N'100mah', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (17, 120, N'sản phẩm này thật hay', N'<p>sản phẩm này thật hay</p>', NULL, N'4gb', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (18, 121, N'4gb', N'100gb', N'full hd', N'100mah', N'100gb', N'full hd', N'full hd')
INSERT [dbo].[product_detail] ([DetailID], [ProductID], [Description], [Detail], [Chip], [Ram], [Rom], [Resolution], [Pin]) VALUES (19, 122, N'2', N'100gb', N'full hd', N'100mah', N'100gb', N'full hd', N'full hd')
SET IDENTITY_INSERT [dbo].[product_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (107, N'Điện thoại sam sung 1', 123123123, 43, CAST(N'2023-11-12' AS Date), 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (108, N'C', 123123123, 79, CAST(N'2023-11-12' AS Date), 2, 1, 1, 1, 1, 2)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (109, N'Điện thoại sam sung 134', 123123123, 100, CAST(N'2023-11-12' AS Date), 2, 1, 1, 1, 1, 3)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (110, N'Điện thoại sam sung 1sd', 123123123, 97, CAST(N'2023-11-12' AS Date), 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (111, N'dsdsf', 123123123, 94, CAST(N'2023-11-12' AS Date), 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (112, N'Điện thoại sam sung 34', 123123123, 98, CAST(N'2023-11-12' AS Date), 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (113, N'Điện thoại sam sung 1', 123123123, 100, CAST(N'2023-11-12' AS Date), 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (114, N'Điện thoại sam sung 1', 123123123, 100, CAST(N'2023-11-12' AS Date), 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (115, N'Điện thoại sam sung 1', 123123123, 99, CAST(N'2023-11-12' AS Date), 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (116, N'Điện thoại sam sung 1', 123123123, 91, CAST(N'2023-11-12' AS Date), 2, 0, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (117, N'Điện thoại sam sung2 ', 123123123, 97, CAST(N'2023-11-12' AS Date), 2, 0, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (118, N'Điện thoại sam sung 1', 123123123, 99, CAST(N'2023-11-12' AS Date), 2, 0, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (119, N'Điện thoại sam sung 1', 123123123, 100, CAST(N'2023-11-12' AS Date), 2, 0, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (120, N'Điện thoại sam sung 1', 123123123, 98, CAST(N'2023-11-12' AS Date), 2, 0, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (121, N'Điện thoại sam sung 1', 123123123, 99, CAST(N'2023-11-12' AS Date), 2, 0, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Product_id], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Distcount], [Special], [Lastest], [Status], [Trademark_id]) VALUES (122, N'Điện thoại sam sung 1', 123123123, 99, CAST(N'2023-11-12' AS Date), 2, 0, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Role_id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Role_id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Role_id], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET IDENTITY_INSERT [dbo].[Trademarks] ON 

INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (1, N'SamSung', N'là 1 thương hiệu đến từ hàn quốc')
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (2, N'Iphone', NULL)
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (3, N'Oppo', NULL)
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (4, N'Xiaomi', NULL)
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (5, N'Vivo', NULL)
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (6, N'Realme', NULL)
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (8, N'acer', N'ádasdasdadasd')
SET IDENTITY_INSERT [dbo].[Trademarks] OFF
GO
SET IDENTITY_INSERT [dbo].[voucher_details] ON 

INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1, NULL, 172)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (2, 1, 173)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (3, 1, 174)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (4, 1, 182)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1002, 1, 1179)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1003, 1, 1180)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1004, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1005, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1006, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1007, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1008, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1009, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1010, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1011, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1012, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1013, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1014, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1015, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1016, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1017, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1018, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1019, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1020, NULL, NULL)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1021, 1, 1221)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1022, 1, 1222)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1023, 1, 1227)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1024, 1, 1228)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1025, 1, 1229)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1026, 1, 1230)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1027, 1, 1231)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1028, 1, 1232)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1029, 1, 1239)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1030, 1, 1240)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1031, 1, 1241)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1032, 1, 1242)
INSERT [dbo].[voucher_details] ([Voucher_detail_id], [Voucher_id], [Order_id]) VALUES (1033, 1, 1244)
SET IDENTITY_INSERT [dbo].[voucher_details] OFF
GO
SET IDENTITY_INSERT [dbo].[Vouchers] ON 

INSERT [dbo].[Vouchers] ([Voucher_id], [Voucher_name], [CreateDate], [EndDate], [Voucher_price], [Voucher_content], [Status], [Username], [estimate]) VALUES (1, N'123456', CAST(N'2021-12-21T19:33:00.000' AS DateTime), CAST(N'2024-12-25T19:33:00.000' AS DateTime), 10000000, N'Voucher giảm giá ngày 20/10', 1, NULL, NULL)
INSERT [dbo].[Vouchers] ([Voucher_id], [Voucher_name], [CreateDate], [EndDate], [Voucher_price], [Voucher_content], [Status], [Username], [estimate]) VALUES (3, N'123123213123', CAST(N'2021-12-21T19:33:00.000' AS DateTime), CAST(N'2021-12-21T19:33:00.000' AS DateTime), 13123123123, N'Voucher giảm giá ngày 20/10', 0, NULL, NULL)
INSERT [dbo].[Vouchers] ([Voucher_id], [Voucher_name], [CreateDate], [EndDate], [Voucher_price], [Voucher_content], [Status], [Username], [estimate]) VALUES (4, N'21312312312', CAST(N'2023-11-03T06:21:00.000' AS DateTime), CAST(N'2023-11-02T06:21:00.000' AS DateTime), 21312312312, N'21312312312', 0, NULL, NULL)
INSERT [dbo].[Vouchers] ([Voucher_id], [Voucher_name], [CreateDate], [EndDate], [Voucher_price], [Voucher_content], [Status], [Username], [estimate]) VALUES (7, N'ádasdasdasd', CAST(N'2023-11-18T06:28:00.000' AS DateTime), CAST(N'2023-12-21T06:28:00.000' AS DateTime), 12313123, N'1313123', 0, NULL, NULL)
INSERT [dbo].[Vouchers] ([Voucher_id], [Voucher_name], [CreateDate], [EndDate], [Voucher_price], [Voucher_content], [Status], [Username], [estimate]) VALUES (9, N'99999', CAST(N'2023-11-12T06:40:00.000' AS DateTime), CAST(N'2023-11-03T06:40:00.000' AS DateTime), 99999, N'3123132123', 0, NULL, NULL)
INSERT [dbo].[Vouchers] ([Voucher_id], [Voucher_name], [CreateDate], [EndDate], [Voucher_price], [Voucher_content], [Status], [Username], [estimate]) VALUES (10, N'12312sdsdsd44oke6', CAST(N'2023-11-09T18:58:00.000' AS DateTime), CAST(N'2023-11-25T18:58:00.000' AS DateTime), 123123123, N'Voucher giảm giá 20/10', 1, NULL, NULL)
INSERT [dbo].[Vouchers] ([Voucher_id], [Voucher_name], [CreateDate], [EndDate], [Voucher_price], [Voucher_content], [Status], [Username], [estimate]) VALUES (11, N'12132123', CAST(N'2023-11-20T01:38:00.000' AS DateTime), CAST(N'2023-11-23T01:38:00.000' AS DateTime), 10000000000, N'', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Vouchers] OFF
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorize_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorize_Account]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorize_Role] FOREIGN KEY([Role_id])
REFERENCES [dbo].[Roles] ([Role_id])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorize_Role]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Accounts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Accounts]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Products]
GO
ALTER TABLE [dbo].[image_product]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([Order_id])
REFERENCES [dbo].[Orders] ([Order_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Categories] ([Category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Trademarks] FOREIGN KEY([Trademark_id])
REFERENCES [dbo].[Trademarks] ([Trademark_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Trademarks]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Accounts]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Products]
GO
ALTER TABLE [dbo].[voucher_details]  WITH CHECK ADD  CONSTRAINT [FK_VoucherDetails_Orders] FOREIGN KEY([Order_id])
REFERENCES [dbo].[Orders] ([Order_id])
GO
ALTER TABLE [dbo].[voucher_details] CHECK CONSTRAINT [FK_VoucherDetails_Orders]
GO
ALTER TABLE [dbo].[voucher_details]  WITH CHECK ADD  CONSTRAINT [FK_VoucherDetails_Vouchers] FOREIGN KEY([Voucher_id])
REFERENCES [dbo].[Vouchers] ([Voucher_id])
GO
ALTER TABLE [dbo].[voucher_details] CHECK CONSTRAINT [FK_VoucherDetails_Vouchers]
GO
ALTER TABLE [dbo].[Vouchers]  WITH CHECK ADD  CONSTRAINT [FK_Vouchers_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Vouchers] CHECK CONSTRAINT [FK_Vouchers_Accounts]
GO
