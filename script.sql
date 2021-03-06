USE [QuanLyKaraoke]
GO
ALTER TABLE [dbo].[Order_Detail] DROP CONSTRAINT [FK_dbo.Order_Detail_dbo.Order_Order_ID]
GO
ALTER TABLE [dbo].[Order_Detail] DROP CONSTRAINT [FK_dbo.Order_Detail_dbo.Menu_Food_ID]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [FK_dbo.Booking_dbo.Room_RoomID]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [FK_dbo.Booking_dbo.Order_Order_ID]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 24/11/2020 7:15:37 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room]') AND type in (N'U'))
DROP TABLE [dbo].[Room]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 24/11/2020 7:15:37 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order_Detail]') AND type in (N'U'))
DROP TABLE [dbo].[Order_Detail]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 24/11/2020 7:15:37 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 24/11/2020 7:15:37 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type in (N'U'))
DROP TABLE [dbo].[Menu]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 24/11/2020 7:15:37 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Booking]') AND type in (N'U'))
DROP TABLE [dbo].[Booking]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 24/11/2020 7:15:37 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 24/11/2020 7:15:37 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 24/11/2020 7:15:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 24/11/2020 7:15:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[S_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[PassWord] [nvarchar](max) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Accounts] PRIMARY KEY CLUSTERED 
(
	[S_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 24/11/2020 7:15:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[PayID] [int] IDENTITY(1,1) NOT NULL,
	[Name_Cus] [nvarchar](max) NOT NULL,
	[Phone_Cus] [nvarchar](max) NOT NULL,
	[Amount_Cus] [int] NOT NULL,
	[P_Status] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Duration] [real] NOT NULL,
	[Total] [int] NOT NULL,
	[Order_ID] [int] NOT NULL,
	[RoomID] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.Booking] PRIMARY KEY CLUSTERED 
(
	[PayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 24/11/2020 7:15:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Food_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Menu] PRIMARY KEY CLUSTERED 
(
	[Food_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 24/11/2020 7:15:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[O_total] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 24/11/2020 7:15:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[OD_ID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Food_ID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Order_Detail] PRIMARY KEY CLUSTERED 
(
	[OD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 24/11/2020 7:15:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [nvarchar](128) NOT NULL,
	[RoomType] [nvarchar](max) NOT NULL,
	[R_Price] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202011210413496_init', N'QuanLyKaraoke.Migrations.Configuration', 0x1F8B0800000000000400DD5CDD6EE3B819BD2FD0771074D516592BC960816D60EF226B4F8A602793749CD9F6CE6024C611463FAE4405318A3E592FFA48FB0A4B8A144551A4454AF24F8A010609451E7EFC78487E240FF3DB7FFF37FDE92D8E9C5798E5619ACCDC8BC9B9EBC0C44F833059CFDC023D7FF783FBD38F7FFCC3F46310BF39BF56F93E907CB86492CFDC178436579E97FB2F3006F9240EFD2CCDD36734F1D3D80341EA5D9E9FFFD5BBB8F02086703196E34CBF14090A6358FE827F9DA7890F37A800D15D1AC02867E9F8CBB244753E8318E61BE0C399FBF702249FB6BF800CA4DFE084E6779DEB2804D896258C9E5D0724498A00C2965E7DCDE1126569B25E6E7002881EB71B88F33D832887AC05577576D3C69C5F92C67875C10ACA2F7294C69680171F98773CB9782F1FBBDC7BD87F1FB19FD196B4BAF4E1CCBDF6FD143BDF75E4BAAEE65146F2A93D3C61E5CE9CC6D7334E09CC1CF2EFCC9917112A32384B608132109D390FC55314FABFC0ED232E90CC92228A4413B191F85B2301273D64E9066668FB053E33C397ABDB85EB78CD929E5C94176C94A2EDBA4DD0874BD7F98C0D004F11E42C107CB0446906FF061398010483078010CC7027DE06B0F463AB7EA936F27F551BA61D1E43AE7307DE3EC1648D5E66EEF778D0DC846F30A81298015F93108F385C0665055418B8BBD2879734D9552BFE711FD5E2919575B4774F353F803CFF479A0587AFF94B1AEDBDBD53AF1EB33B47F2CF69FAADB4C07224B372C71BC90F60DB6728B362871CCBAB79911F81DF64401FA7EAEB984CF262DD3A47773461B5C4BD301465813BEE31ACA798FA774BA08F49300ACEA2C8D8BACC3A06774B640FF388291A0D73CD7D16C0CC606DEB9ACFD2B8C650D0ECE2F207239A49D57C06AFE1BAF494CA6CD7F902A3F26BFE126E68D056CD4A2B96E3264B6332DBF2698E7E582DD322F34947A6AAAF8F205B43646E0E69FF4E6B6886B631245D6B4BF951658AF1D4CE9C6039B197A58E37ADD794B49DD94DC93CDEE47EBF423DC6E06E5AAF161081906C4614841273B439DEFECAF953914B91A5E25F7F8A31BC7E4C63858F48B8453FB62D0E4A35E21D9AEFF8F3FD4D9A06F6205ADADFC1A4E8663BCDA5213BF9D89A48DB396C2776FD3A633D10771AA75F768C0722758FE50024858E37F0388D6C879E21FF0EB621DF57009F853E1C365271BBFD6F3610C67CA3218D25DF48A1E3F1AD0A536DE9365A78DB23AC26751EE18062350AF76CB76E3AF25DE779EA8725C11461075D199AA6E09D9AD3B94C50A7CAB339F62FE65FB8C18CC3A6CCDCBFB4DAB90B9CC75B35389D999BA017AE4CD7FB64012388A073EDD313DF39C87D10B4BD8C7D14345330C36146263210CDF12285C74C98A0F67008133FDC80A8CB74A9A0CDCC4DACE3F5C85F1670031332DF7675CC4003783D92DBBABC34F5049A59B08F2EFE460C91228191F92705FC12FA8933B061BC090374DBC4FE1C6CF4CE50130EC0C2E651878E229A738F9A1DFCFCD79C76EAD392D3679CD2EE83914DD913EF886765C4D74589E689D6282C6B9C83099034026DE29D4F26172DC8415C116B37E92C7590D98B28A22F87553D3A4B689C86CBE099136FAA84338A4F652A7C535D0D7FCD21DB1FE42C3095FB9EA02E216A5E32E318B28E0B59E7F3FBE7167D9A10CC972A084EC90E8872F8A900D82C6752BC3ED453A3F0B5BF038CC4492A101A63761426FC5015A603492A2C74BCBA2DEC4046C8A73DB591F968129D73E35B1E6CD1DB241E17E0980FE525A6D9605B67302E747843B1549B468BC3FDD15CAD65BC313C225DBEB49DB1236431085A0493EB61BDA3F5EA30659F0DA72349DFEEF612DABD88F66D7563D91440D82C60DCE66A53CE277BFE6DEA5159154B987A1AFDD5F40E6C36C4EEBA244B7196548C35FF6E69AF518A2986E7E70AA912B796D784D20CACA1F415578D2DBD09B31C2D00024F801C49CC83B895ADB9B469E6D9AA2E69F56AF75535015705C8CFE212AA164D2982000670839B169300A23CE7143A5B5BD2219A3810814C29749AA75111277AC1D42E047A562A22D0147304A6441221589239462D2B1261EA540B6BB84CA861104F3547A2B21F1185A6B411A69ED4B1AD88AEC5A1D686A9C94923C6F2F9653063ABD8CA9EB1DA92FAFED9CA94552A837661D4221D99B734D592BB6D2821D91C4B54D1886062BA85655C4BD3308CA79A23D5BA1711A94E3547E2821A1188275A58C405350D8B78AA3912D3D488302CC91CA3DEAF8B30FA5DBC1EA9DAD135E70CF52EEF68B3068BA206CF19CAA0D060C6D094DB7FEF70F54703A84A3CADFEE1DB8571BAA9DAAFF6EC2D6D71ADAB17ED1E53C9367661D40A0A11A64E3DC600E7F7182290F672E36814A25BE6C1D4511D061850465D6C2C97EE318EA577A88DE596269963B00BFC46404E934E861C744339981CAABDB10139D4C5C6595077A1D08B791987A65A20AD1424E1893634698776FAC06EAF44699D17C85978EDFCDC403A1F98B2BD7AF723AED6E69D66711DEC9ED730201BF7E53647309E900C93E5BFA2791442726C5C65B80349F80C73449525EEE5F9C5A5F40AEC745E6479791E448AB30EC5B3AC66771DE86154481CDBA9B4B2549188D2ABE41564FE0BC85AAFA1863C75AA40FF1483B73F0F7EBE340C4D7E92340C4D7C66648364FD74A807DBC678BCB337BE890F570676A8FC0667185CFB5D4DE98381AF6AFA60C86F6A02FC3B1AE14D4D6F1CF94D4D06C9266CC88B9A3E6E91F5D5A1F289EC6D12C0B799FBEFB2D09573FBCF5555EECC297FBA72CE9DFF0C7C86534F9606F5D3A2CDDA6581636D4DFBB18EE593941E13C678CF42F6326D482F41BAB9D3EF85451FC78DF0BC612F2E935F34BCBBF126C9D04DEB66C52CAAB67B04D083236329F10F1601F65C8D4551731FBA35E4F4238E7185B4EA808A7665582D4DF9BD04EB03C3D7D508FD6517E7EC43804E653287D483ABF51F0304C7BD04749AC3BEFD8BC9FF0F05E40716D79E068174F74107D082BF2759EE29D3874B2CFB2881DF0369F43A8793E5CB4E193715B0F511591FB3D3355707FB1467BF0F41765BDC26779A5270BD4B6F4D4FD8676EF094E21EA69154ADD3365363EF1263ABF0AD94DA7AA1B60ADA5EC3DD29E1D6566323F2D66ABC55E8C6EA6FADF85B857A4459B8E881FA0AD854E9AC154B9FB0E8BB6DF34934773445779F464AB345431E78329A6D7158D517D2FB6F96852CBB7D9D8A171AE12F67E2352E0FD73504F93B9A09F41B4B0CCF739B3CA7D54A2759546569FD790F0402BCFE5C67287C063EC29F7D98E765737F055181B37C8C9F60709BDC17685320DC64183F450D450E593177D55F6ACF9B364FEF37E5DFEC18A309D8CC90DC4CDC273F17611470BB6F1447081A08B214B34331D297881C8EADB71CE9734BDFAC0362EEE311C4238C371106CBEF932578857D6CFB9AC34F700DFC6D752BAE07E9EE88A6DBA78B10AC3310E70CA32E8F7FC51C0EE2B71F7F07A413241640560000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([S_ID], [Name], [Phone], [UserName], [PassWord], [Role]) VALUES (1, N'Thang', N'123456789', N'Thang', N'Thang123', N'Staff')
INSERT [dbo].[Accounts] ([S_ID], [Name], [Phone], [UserName], [PassWord], [Role]) VALUES (2, N'AnhTuan', N'123456789', N'AnhTuan', N'Anhtuan123', N'Admin')
INSERT [dbo].[Accounts] ([S_ID], [Name], [Phone], [UserName], [PassWord], [Role]) VALUES (3, N'Pham Cong', N'123465789', N'Phamcong', N'Phamcong123', N'Accountant')
INSERT [dbo].[Accounts] ([S_ID], [Name], [Phone], [UserName], [PassWord], [Role]) VALUES (4, N'Quoc Cuong', N'123456789', N'Quoccuong', N'Cuong123', N'Admin')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1, N'Thang', N'98745313', 12, 3, CAST(N'2020-02-14T06:00:00.000' AS DateTime), CAST(N'2020-02-14T08:00:00.000' AS DateTime), 0.6833333, 149600, 1, N'L101')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (2, N'Cuong', N'123465687634', 12, 3, CAST(N'2020-01-15T07:30:00.000' AS DateTime), CAST(N'2020-01-15T09:30:00.000' AS DateTime), 0.7833333, 171600, 2, N'L102')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (3, N'Cong', N'987453132', 12, 3, CAST(N'2020-01-19T01:30:00.000' AS DateTime), CAST(N'2020-01-19T03:30:00.000' AS DateTime), 5.266667, 1159400, 3, N'L103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (4, N'ABC', N'1233557679', 21, 3, CAST(N'2020-01-09T08:00:00.000' AS DateTime), CAST(N'2020-11-22T09:00:00.000' AS DateTime), 1.483333, 325600, 4, N'L104')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (5, N'XYZ', N'123465687634', 21, 3, CAST(N'2020-01-03T08:00:00.000' AS DateTime), CAST(N'2020-01-03T10:00:00.000' AS DateTime), 1.65, 363000, 5, N'L105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (6, N'HJD', N'987453131234', 22, 3, CAST(N'2020-01-27T02:30:00.000' AS DateTime), CAST(N'2020-01-27T04:30:00.000' AS DateTime), 4.383333, 963600, 6, N'L106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (7, N'ASDASD', N'1233557679', 22, 3, CAST(N'2020-02-11T07:00:00.000' AS DateTime), CAST(N'2020-02-11T09:00:00.000' AS DateTime), 0.3666667, 81400, 7, N'L107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (8, N'DGFDFG', N'1233557679412', 22, 3, CAST(N'2020-02-27T07:30:00.000' AS DateTime), CAST(N'2020-02-27T09:30:00.000' AS DateTime), 0.6166667, 136400, 8, N'L113')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (9, N'FBFG', N'1233557679412', 21, 3, CAST(N'2020-01-17T00:00:00.000' AS DateTime), CAST(N'2020-01-17T02:00:00.000' AS DateTime), 6.75, 1113750, 9, N'V110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (10, N'DGFDH', N'987453134', 11, 3, CAST(N'2020-01-30T02:00:00.000' AS DateTime), CAST(N'2020-01-30T05:00:00.000' AS DateTime), 4.883333, 536800, 10, N'S106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (11, N'TYHTYH', N'987453131234', 22, 3, CAST(N'2020-02-13T08:00:00.000' AS DateTime), CAST(N'2020-02-13T10:00:00.000' AS DateTime), 1.316667, 290400, 11, N'L112')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (12, N'FGHFG', N'987453131234', 22, 3, CAST(N'2020-02-25T02:00:00.000' AS DateTime), CAST(N'2020-02-25T04:00:00.000' AS DateTime), 4.85, 800250, 12, N'V116')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (13, N'SADDG', N'12346568763', 11, 3, CAST(N'2020-02-16T03:00:00.000' AS DateTime), CAST(N'2020-02-16T05:00:00.000' AS DateTime), 3.733333, 410300, 13, N'S102')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (14, N'UYK', N'48463156542', 11, 3, CAST(N'2020-02-05T07:00:00.000' AS DateTime), CAST(N'2020-02-05T09:00:00.000' AS DateTime), 0.5333333, 58300, 14, N'S119')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (15, N'AQWE', N'9874531323', 11, 3, CAST(N'2020-02-26T12:30:00.000' AS DateTime), CAST(N'2020-02-26T15:30:00.000' AS DateTime), 5.616667, 927300, 15, N'V108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (16, N'QWETDFV', N'1233557679412', 22, 3, CAST(N'2020-02-13T02:00:00.000' AS DateTime), CAST(N'2020-02-13T05:00:00.000' AS DateTime), 4.683333, 772200, 16, N'V101')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (17, N'Cuong', N'987453131234', 22, 3, CAST(N'2020-02-13T05:30:00.000' AS DateTime), CAST(N'2020-02-13T08:30:00.000' AS DateTime), 1.183333, 259600, 17, N'L103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (18, N'GFBNFB', N'12335576', 11, 3, CAST(N'2020-01-14T07:30:00.000' AS DateTime), CAST(N'2020-01-14T09:30:00.000' AS DateTime), 0.7833333, 85800, 18, N'S104')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (19, N'XYZGG', N'987453131', 4, 3, CAST(N'2020-01-16T02:00:00.000' AS DateTime), CAST(N'2020-01-16T09:00:00.000' AS DateTime), 4.733334, 780450, 19, N'V102')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (20, N'CuongASG', N'1234651', 11, 3, CAST(N'2020-01-28T01:00:00.000' AS DateTime), CAST(N'2020-01-28T07:00:00.000' AS DateTime), 5.883333, 970200, 20, N'V105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (21, N'CuongJFH', N'1233521354', 11, 3, CAST(N'2020-03-18T05:00:00.000' AS DateTime), CAST(N'2020-03-18T08:00:00.000' AS DateTime), 1.75, 385000, 21, N'L102')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (22, N'CongTH', N'98745324', 11, 3, CAST(N'2020-03-11T06:00:00.000' AS DateTime), CAST(N'2020-03-11T09:00:00.000' AS DateTime), 0.65, 107250, 22, N'V103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (23, N'ThangASDG', N'987453132', 11, 3, CAST(N'2020-03-18T07:30:00.000' AS DateTime), CAST(N'2020-03-18T09:30:00.000' AS DateTime), 0.7333333, 80300, 23, N'S107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (24, N'XYZASDFDB', N'12335576792', 11, 3, CAST(N'2020-03-11T08:00:00.000' AS DateTime), CAST(N'2020-03-11T10:00:00.000' AS DateTime), 1.35, 297000, 24, N'L105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (25, N'ThangSGFH', N'98745243', 11, 3, CAST(N'2020-03-06T06:30:00.000' AS DateTime), CAST(N'2020-03-06T08:30:00.000' AS DateTime), 0.03333334, 3300, 25, N'S107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (26, N'CongSDFFG', N'9874524435', 11, 3, CAST(N'2020-03-14T15:00:00.000' AS DateTime), CAST(N'2020-03-14T17:00:00.000' AS DateTime), 8.283334, 910800, 26, N'V117')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (27, N'Tuan', N'987453133', 15, 3, CAST(N'2020-03-05T18:00:00.000' AS DateTime), CAST(N'2020-03-05T20:00:00.000' AS DateTime), 11.53333, 2536600, 27, N'L103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (28, N'XYZSA', N'98745315', 12, 3, CAST(N'2020-03-22T06:00:00.000' AS DateTime), CAST(N'2020-03-22T09:00:00.000' AS DateTime), 0.8166667, 180400, 28, N'L101')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (29, N'ThangGFGF', N'2123543445', 16, 3, CAST(N'2020-03-25T16:30:00.000' AS DateTime), CAST(N'2020-03-25T19:30:00.000' AS DateTime), 9.616667, 1058200, 29, N'S104')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (30, N'ABCFGH', N'9874457', 1, 3, CAST(N'2020-03-27T16:00:00.000' AS DateTime), CAST(N'2020-03-27T18:00:00.000' AS DateTime), 9.116667, 1504800, 30, N'V111')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (31, N'ThangHGGH', N'987453354', 2, 3, CAST(N'2020-04-02T06:00:00.000' AS DateTime), CAST(N'2020-04-02T08:00:00.000' AS DateTime), 0.35, 77000, 31, N'L109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (32, N'CuongDSG', N'27453131234', 6, 3, CAST(N'2020-04-10T13:30:00.000' AS DateTime), CAST(N'2020-04-10T15:30:00.000' AS DateTime), 6.983333, 767800, 32, N'S113')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (33, N'ABCFGN', N'12334', 11, 3, CAST(N'2020-04-16T13:30:00.000' AS DateTime), CAST(N'2020-04-16T15:30:00.000' AS DateTime), 6.766667, 1117050, 33, N'V104')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (34, N'ThangFDGHGH', N'987434', 22, 3, CAST(N'2020-04-16T12:00:00.000' AS DateTime), CAST(N'2020-04-16T14:00:00.000' AS DateTime), 5.266666, 579700, 34, N'S116')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (35, N'CuongDFG', N'1233379412', 12, 3, CAST(N'2020-04-10T15:00:00.000' AS DateTime), CAST(N'2020-04-10T19:00:00.000' AS DateTime), 8.45, 1394250, 35, N'V102')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (36, N'HJDHGJ', N'12335279412', 2, 3, CAST(N'2020-04-10T20:00:00.000' AS DateTime), CAST(N'2020-04-10T22:00:00.000' AS DateTime), 13.45, 2959000, 36, N'L114')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (37, N'ThangTRH', N'123355434', 1, 3, CAST(N'2020-04-12T10:00:00.000' AS DateTime), CAST(N'2020-04-12T15:00:00.000' AS DateTime), 3.333333, 366300, 37, N'S116')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (38, N'XYZGFG', N'123352412', 12, 3, CAST(N'2020-04-22T16:00:00.000' AS DateTime), CAST(N'2020-04-22T18:00:00.000' AS DateTime), 9.216666, 1014200, 38, N'S111')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (39, N'CongHJ', N'1234387634', 3, 3, CAST(N'2020-04-22T12:00:00.000' AS DateTime), CAST(N'2020-04-22T16:00:00.000' AS DateTime), 5.216667, 1148400, 39, N'L107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (40, N'ABCGFHGH', N'98745321234', 4, 3, CAST(N'2020-04-10T14:00:00.000' AS DateTime), CAST(N'2020-04-10T16:00:00.000' AS DateTime), 7.483334, 1234200, 40, N'V101')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (41, N'ThangTY', N'98743131234', 4, 3, CAST(N'2020-05-22T06:00:00.000' AS DateTime), CAST(N'2020-05-22T08:00:00.000' AS DateTime), 0.8166667, 180400, 41, N'L106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (43, N'CongFG', N'12346334', 3, 3, CAST(N'2020-05-05T14:00:00.000' AS DateTime), CAST(N'2020-05-05T16:00:00.000' AS DateTime), 7.533333, 1242450, 43, N'V116')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (45, N'ThangGHJ', N'98745334', 12, 3, CAST(N'2020-05-07T21:00:00.000' AS DateTime), CAST(N'2020-05-07T23:00:00.000' AS DateTime), 14.53333, 3196600, 45, N'L106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (46, N'CuongFGH', N'12346347634', 1, 3, CAST(N'2020-05-13T10:30:00.000' AS DateTime), CAST(N'2020-05-13T12:30:00.000' AS DateTime), 3.816667, 630300, 46, N'V105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (47, N'ThangYY', N'987434131234', 4, 3, CAST(N'2020-05-14T12:00:00.000' AS DateTime), CAST(N'2020-05-14T14:00:00.000' AS DateTime), 5.283333, 580800, 47, N'S117')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (48, N'ABCEDG', N'341234', 6, 3, CAST(N'2020-05-22T10:00:00.000' AS DateTime), CAST(N'2020-05-22T12:00:00.000' AS DateTime), 3.183333, 524700, 48, N'V109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (49, N'CuongGFG', N'9873131234', 5, 3, CAST(N'2020-05-12T07:00:00.000' AS DateTime), CAST(N'2020-05-12T09:00:00.000' AS DateTime), 0.3333333, 54450, 49, N'V108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (50, N'HJDDG', N'3568412', 5, 3, CAST(N'2020-05-22T08:30:00.000' AS DateTime), CAST(N'2020-05-22T10:30:00.000' AS DateTime), 1.683333, 184800, 50, N'S106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (51, N'Thang', N'1233559412', 2, 3, CAST(N'2020-05-22T07:30:00.000' AS DateTime), CAST(N'2020-05-22T09:30:00.000' AS DateTime), 0.6833333, 74800, 51, N'S110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (52, N'ThangSDF', N'987453234', 2, 3, CAST(N'2020-06-11T12:00:00.000' AS DateTime), CAST(N'2020-06-11T15:00:00.000' AS DateTime), 5.366667, 1181400, 52, N'L105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (53, N'FDDWD', N'12335534412', 4, 3, CAST(N'2020-06-12T07:00:00.000' AS DateTime), CAST(N'2020-06-12T09:00:00.000' AS DateTime), 0.3333333, 36300, 53, N'S112')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (54, N'ThangUU', N'98744131234', 4, 3, CAST(N'2020-06-12T08:00:00.000' AS DateTime), CAST(N'2020-06-12T09:00:00.000' AS DateTime), 1.333333, 219450, 54, N'V107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (55, N'HJDDGGFF', N'93131234', 4, 3, CAST(N'2020-06-11T09:00:00.000' AS DateTime), CAST(N'2020-06-11T11:00:00.000' AS DateTime), 2.35, 258500, 55, N'S109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (56, N'ABCFGHGH', N'12335576794', 4, 3, CAST(N'2020-06-25T14:00:00.000' AS DateTime), CAST(N'2020-06-25T15:00:00.000' AS DateTime), 7.133333, 1176450, 56, N'V110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (57, N'CongHGGH', N'98745313', 7, 3, CAST(N'2020-06-11T16:30:00.000' AS DateTime), CAST(N'2020-06-11T18:30:00.000' AS DateTime), 9.85, 1625250, 57, N'V111')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (58, N'TuanGHJ', N'9874431234', 5, 3, CAST(N'2020-06-15T10:00:00.000' AS DateTime), CAST(N'2020-06-15T12:00:00.000' AS DateTime), 3.283333, 721600, 58, N'L117')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (59, N'CuongGHGH', N'1479412', 1, 3, CAST(N'2020-06-11T07:00:00.000' AS DateTime), CAST(N'2020-06-11T09:00:00.000' AS DateTime), 0.35, 57750, 59, N'V110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (60, N'CuongDFHGNH', N'987431234', 4, 3, CAST(N'2020-06-18T10:00:00.000' AS DateTime), CAST(N'2020-06-18T12:00:00.000' AS DateTime), 3.25, 357500, 60, N'S113')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (61, N'XYZFGG', N'1237679412', 5, 3, CAST(N'2020-06-10T07:00:00.000' AS DateTime), CAST(N'2020-06-10T09:00:00.000' AS DateTime), 0.45, 74250, 61, N'V106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (62, N'HJDFGH', N'1679412', 1, 3, CAST(N'2020-07-08T06:00:00.000' AS DateTime), CAST(N'2020-07-08T08:00:00.000' AS DateTime), 0.4833333, 105600, 62, N'L106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (63, N'ThangFDGHDS', N'1233557679', 2, 3, CAST(N'2020-07-16T10:00:00.000' AS DateTime), CAST(N'2020-07-16T12:00:00.000' AS DateTime), 3.25, 357500, 63, N'S105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (64, N'ThangDF', N'1479412', 1, 3, CAST(N'2020-07-10T07:00:00.000' AS DateTime), CAST(N'2020-07-10T09:00:00.000' AS DateTime), 0.45, 49500, 64, N'S118')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (65, N'CuongDG', N'41234', 12, 3, CAST(N'2020-07-10T10:00:00.000' AS DateTime), CAST(N'2020-07-10T12:00:00.000' AS DateTime), 3.45, 569250, 65, N'V112')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (66, N'FGHRRH', N'9873131234', 2, 3, CAST(N'2020-07-10T07:00:00.000' AS DateTime), CAST(N'2020-07-10T09:00:00.000' AS DateTime), 0.45, 74250, 66, N'V114')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (67, N'CuongFDH', N'1233279412', 4, 3, CAST(N'2020-07-15T07:00:00.000' AS DateTime), CAST(N'2020-07-15T09:00:00.000' AS DateTime), 0.2833334, 30800, 67, N'S102')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (68, N'CongYTHTN', N'98745531234', 4, 3, CAST(N'2020-07-22T11:00:00.000' AS DateTime), CAST(N'2020-07-22T12:00:00.000' AS DateTime), 4.2, 462000, 68, N'S105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (69, N'ABCFGGH', N'9874331234', 3, 3, CAST(N'2020-07-22T16:00:00.000' AS DateTime), CAST(N'2020-07-22T18:00:00.000' AS DateTime), 9.2, 2024000, 69, N'L115')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (70, N'TuanFBN', N'923131234', 2, 3, CAST(N'2020-07-22T13:00:00.000' AS DateTime), CAST(N'2020-07-22T15:00:00.000' AS DateTime), 6.2, 1364000, 70, N'L108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (71, N'HJDDFG', N'9833131234', 3, 3, CAST(N'2020-07-22T07:00:00.000' AS DateTime), CAST(N'2020-07-22T09:00:00.000' AS DateTime), 0.1833333, 39600, 71, N'L120')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (72, N'CuongDSF', N'987453131234', 2, 3, CAST(N'2020-08-13T07:00:00.000' AS DateTime), CAST(N'2020-08-13T09:00:00.000' AS DateTime), 0.3333333, 72600, 72, N'L105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (73, N'CuongDSGGH', N'987453124', 2, 3, CAST(N'2020-08-07T07:00:00.000' AS DateTime), CAST(N'2020-08-07T09:00:00.000' AS DateTime), 0.5333333, 58300, 73, N'S102')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (74, N'ABCSFDG', N'1233557679', 3, 3, CAST(N'2020-08-22T10:00:00.000' AS DateTime), CAST(N'2020-08-22T12:00:00.000' AS DateTime), 3.2, 352000, 74, N'S115')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (75, N'XYZSDG', N'98743', 3, 3, CAST(N'2020-08-05T07:00:00.000' AS DateTime), CAST(N'2020-08-05T09:00:00.000' AS DateTime), 0.5833334, 95700, 75, N'V112')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (76, N'ThangSDFSDF', N'987453132', 1, 3, CAST(N'2020-08-11T17:00:00.000' AS DateTime), CAST(N'2020-08-11T19:00:00.000' AS DateTime), 10.38333, 2283600, 76, N'L107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (77, N'ABCFGHW', N'12335529412', 2, 3, CAST(N'2020-08-18T15:00:00.000' AS DateTime), CAST(N'2020-08-18T17:00:00.000' AS DateTime), 8.25, 907500, 77, N'S111')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (78, N'TuanFDGB', N'9874231234', 2, 3, CAST(N'2020-08-24T08:00:00.000' AS DateTime), CAST(N'2020-08-24T10:00:00.000' AS DateTime), 1.15, 126500, 78, N'S117')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (79, N'ABCSDDSFH', N'982131234', 2, 3, CAST(N'2020-08-09T07:00:00.000' AS DateTime), CAST(N'2020-08-09T09:00:00.000' AS DateTime), 0.5, 55000, 79, N'S116')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (80, N'HJDIII', N'98745324', 4, 3, CAST(N'2020-08-22T12:00:00.000' AS DateTime), CAST(N'2020-08-22T14:00:00.000' AS DateTime), 5.2, 572000, 80, N'S112')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (81, N'CuongIJL,', N'1287634', 2, 3, CAST(N'2020-08-22T10:00:00.000' AS DateTime), CAST(N'2020-08-22T12:00:00.000' AS DateTime), 3.2, 528000, 81, N'V105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (82, N'Thang', N'987453131234', 12, 3, CAST(N'2020-09-22T10:00:00.000' AS DateTime), CAST(N'2020-09-22T12:00:00.000' AS DateTime), 3.15, 693000, 82, N'L109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (83, N'CongDSF', N'12327679', 4, 3, CAST(N'2020-09-22T14:00:00.000' AS DateTime), CAST(N'2020-09-22T16:00:00.000' AS DateTime), 7.15, 1573000, 83, N'L115')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (84, N'XYZFDDG', N'1233552', 3, 3, CAST(N'2020-09-04T10:00:00.000' AS DateTime), CAST(N'2020-09-04T12:00:00.000' AS DateTime), 3.583333, 590700, 84, N'V103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (85, N'HJDSDG', N'98742131234', 2, 3, CAST(N'2020-09-10T07:00:00.000' AS DateTime), CAST(N'2020-09-10T09:00:00.000' AS DateTime), 0.3833333, 41800, 85, N'S112')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (86, N'HJDAQWS', N'9872131234', 2, 3, CAST(N'2020-09-04T13:00:00.000' AS DateTime), CAST(N'2020-09-04T15:00:00.000' AS DateTime), 6.65, 733500, 86, N'S114')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (87, N'CuongFGFG', N'983234', 3, 3, CAST(N'2020-09-15T08:00:00.000' AS DateTime), CAST(N'2020-09-15T09:00:00.000' AS DateTime), 1.266667, 139700, 87, N'S118')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (88, N'CuongQQWAS', N'98231234', 2, 3, CAST(N'2020-09-24T08:00:00.000' AS DateTime), CAST(N'2020-09-24T10:00:00.000' AS DateTime), 1.15, 189750, 88, N'V110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (89, N'TuanFBNG', N'987421234', 2, 3, CAST(N'2020-09-04T10:00:00.000' AS DateTime), CAST(N'2020-09-04T12:00:00.000' AS DateTime), 3.583333, 590700, 89, N'V105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (90, N'CongSA', N'231234', 2, 3, CAST(N'2020-09-11T14:00:00.000' AS DateTime), CAST(N'2020-09-11T16:00:00.000' AS DateTime), 7.35, 1617000, 90, N'L109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (91, N'CongTFD', N'32573849', 2, 3, CAST(N'2020-09-21T07:00:00.000' AS DateTime), CAST(N'2020-09-21T09:00:00.000' AS DateTime), 0.2333333, 25300, 91, N'S103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (92, N'Cuong', N'124527', 5, 3, CAST(N'2020-10-16T07:00:00.000' AS DateTime), CAST(N'2020-10-16T09:00:00.000' AS DateTime), 0.25, 55000, 92, N'L107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (93, N'CuongSFFV', N'213434', 2, 3, CAST(N'2020-10-13T10:00:00.000' AS DateTime), CAST(N'2020-10-13T12:00:00.000' AS DateTime), 3.316667, 730400, 93, N'L117')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (94, N'HJDDFH', N'12333679412', 3, 3, CAST(N'2020-10-08T07:00:00.000' AS DateTime), CAST(N'2020-10-08T09:00:00.000' AS DateTime), 0.5, 55000, 94, N'S120')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (95, N'HJDDFHH', N'123355767945', 4, 3, CAST(N'2020-10-19T14:00:00.000' AS DateTime), CAST(N'2020-10-19T16:00:00.000' AS DateTime), 7.233334, 795300, 95, N'S112')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (96, N'CuongGJ', N'987454', 5, 3, CAST(N'2020-10-09T12:00:00.000' AS DateTime), CAST(N'2020-10-09T15:00:00.000' AS DateTime), 5.483334, 602800, 96, N'S108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (97, N'ThangDFA', N'931234', 3, 3, CAST(N'2020-10-25T10:00:00.000' AS DateTime), CAST(N'2020-10-25T12:00:00.000' AS DateTime), 3.116667, 514800, 97, N'V110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (98, N'ThangGJKR', N'987231234', 2, 3, CAST(N'2020-10-15T10:00:00.000' AS DateTime), CAST(N'2020-10-15T12:00:00.000' AS DateTime), 3.266667, 719400, 98, N'L117')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (99, N'ABCDFGH', N'12335576793', 3, 3, CAST(N'2020-10-04T10:00:00.000' AS DateTime), CAST(N'2020-10-04T12:00:00.000' AS DateTime), 3.583333, 393800, 99, N'S102')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (100, N'XYZFGH', N'98745313122', 2, 3, CAST(N'2020-10-09T07:00:00.000' AS DateTime), CAST(N'2020-10-09T09:00:00.000' AS DateTime), 0.4833333, 105600, 100, N'L103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (101, N'CuongCCC', N'987453334', 3, 3, CAST(N'2020-10-10T12:00:00.000' AS DateTime), CAST(N'2020-10-10T14:00:00.000' AS DateTime), 5.383333, 887700, 101, N'V111')
GO
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (102, N'ThangFGB', N'987453131234', 4, 3, CAST(N'2020-11-10T10:00:00.000' AS DateTime), CAST(N'2020-11-10T12:00:00.000' AS DateTime), 3.383333, 743600, 102, N'L109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (103, N'CuongDSG', N'98745313123433', 3, 3, CAST(N'2020-11-08T12:00:00.000' AS DateTime), CAST(N'2020-11-08T14:00:00.000' AS DateTime), 5.5, 605000, 103, N'S115')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (104, N'CongFGH', N'98312342', 3, 1, CAST(N'2020-11-24T07:00:00.000' AS DateTime), CAST(N'2020-11-24T09:00:00.000' AS DateTime), 0, 0, 104, N'V109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (105, N'XYZFHG', N'7864534', 3, 3, CAST(N'2020-11-06T12:00:00.000' AS DateTime), CAST(N'2020-11-06T15:00:00.000' AS DateTime), 5.533333, 608300, 105, N'S103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (106, N'XYZSDG', N'342343444', 5, 1, CAST(N'2020-11-25T06:30:00.000' AS DateTime), CAST(N'2020-11-25T08:30:00.000' AS DateTime), 0, 0, 106, N'V106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (107, N'CongSDXB', N'987453455', 5, 1, CAST(N'2020-11-30T07:00:00.000' AS DateTime), CAST(N'2020-11-30T09:00:00.000' AS DateTime), 0, 0, 107, N'V116')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (108, N'XYZLDHH', N'434571', 6, 3, CAST(N'2020-11-09T14:00:00.000' AS DateTime), CAST(N'2020-11-09T16:00:00.000' AS DateTime), 7.483334, 1234200, 108, N'V113')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (109, N'CuongGHKKK', N'123479', 4, 3, CAST(N'2020-11-12T16:00:00.000' AS DateTime), CAST(N'2020-11-12T18:00:00.000' AS DateTime), 9.333333, 1539450, 109, N'V109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (111, N'ThangSDF', N'987453131234', 2, 1, CAST(N'2020-12-10T07:30:00.000' AS DateTime), CAST(N'2020-12-10T09:30:00.000' AS DateTime), 0, 0, 111, N'L105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (112, N'Cong', N'2131234', 2, 1, CAST(N'2020-12-02T07:00:00.000' AS DateTime), CAST(N'2020-12-02T09:00:00.000' AS DateTime), 0, 0, 112, N'S103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (113, N'Cuong', N'1233557679', 4, 1, CAST(N'2020-12-13T16:30:00.000' AS DateTime), CAST(N'2020-12-13T18:30:00.000' AS DateTime), 0, 0, 113, N'V110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (114, N'Tuan', N'9874531322', 5, 1, CAST(N'2020-12-18T07:00:00.000' AS DateTime), CAST(N'2020-12-18T09:00:00.000' AS DateTime), 0, 0, 114, N'L112')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (115, N'Thanggfh', N'98745234', 5, 3, CAST(N'2020-02-21T04:30:00.000' AS DateTime), CAST(N'2020-02-21T09:30:00.000' AS DateTime), 2.55, 561000, 115, N'L106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (116, N'Thangffdgh', N'9874521234', 2, 3, CAST(N'2020-02-12T05:00:00.000' AS DateTime), CAST(N'2020-02-12T07:00:00.000' AS DateTime), 2.05, 451000, 116, N'L115')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (117, N'CuongFDGg', N'9874434', 4, 3, CAST(N'2020-08-24T03:30:00.000' AS DateTime), CAST(N'2020-08-24T08:30:00.000' AS DateTime), 3.55, 585750, 117, N'V114')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (118, N'Cuongdfg', N'987431234', 4, 3, CAST(N'2020-11-03T05:00:00.000' AS DateTime), CAST(N'2020-11-03T07:00:00.000' AS DateTime), 2.05, 338250, 118, N'V107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (119, N'ABCFGDH', N'9874541234', 4, 3, CAST(N'2020-10-26T04:00:00.000' AS DateTime), CAST(N'2020-10-26T07:00:00.000' AS DateTime), 3.05, 671000, 119, N'L112')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (120, N'XYZFGH', N'GG', 5, 3, CAST(N'2020-10-22T05:00:00.000' AS DateTime), CAST(N'2020-10-22T09:00:00.000' AS DateTime), 2.066667, 341550, 120, N'V107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1002, N'ThangGHJK', N'123355479', 4, 3, CAST(N'2020-08-18T13:00:00.000' AS DateTime), CAST(N'2020-08-18T16:00:00.000' AS DateTime), 3.633333, 798600, 1002, N'L105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1003, N'CuongFDSG', N'98745313144', 4, 3, CAST(N'2020-09-10T15:00:00.000' AS DateTime), CAST(N'2020-09-10T16:00:00.000' AS DateTime), 1.6, 264000, 1003, N'V108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1004, N'ABCDFSG', N'98745351234', 5, 3, CAST(N'2020-08-10T13:30:00.000' AS DateTime), CAST(N'2020-08-10T15:30:00.000' AS DateTime), 3.083333, 677600, 1004, N'L117')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1005, N'CongHJH', N'98745313123', 4, 3, CAST(N'2020-09-16T10:30:00.000' AS DateTime), CAST(N'2020-09-16T14:30:00.000' AS DateTime), 6.1, 1342000, 1005, N'L110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1006, N'ThangDSFG', N'987431234', 5, 3, CAST(N'2020-09-14T13:00:00.000' AS DateTime), CAST(N'2020-09-14T15:00:00.000' AS DateTime), 3.6, 792000, 1006, N'L115')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1007, N'CongDG', N'9874531234', 5, 3, CAST(N'2020-01-15T12:30:00.000' AS DateTime), CAST(N'2020-01-15T14:30:00.000' AS DateTime), 4.1, 676500, 1007, N'V103')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1008, N'CuongSDF', N'98745341234', 4, 3, CAST(N'2020-02-12T13:00:00.000' AS DateTime), CAST(N'2020-02-12T16:00:00.000' AS DateTime), 3.6, 792000, 1008, N'L108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1009, N'CuongSFG', N'1233557679', 4, 3, CAST(N'2020-02-11T13:00:00.000' AS DateTime), CAST(N'2020-02-11T16:00:00.000' AS DateTime), 3.6, 792000, 1009, N'L106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1010, N'Thang', N'4345715', 4, 3, CAST(N'2020-02-04T15:00:00.000' AS DateTime), CAST(N'2020-02-04T17:00:00.000' AS DateTime), 1.55, 341000, 1010, N'L118')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1011, N'CuongDSGGG', N'555576876', 4, 3, CAST(N'2020-02-24T15:00:00.000' AS DateTime), CAST(N'2020-02-24T17:00:00.000' AS DateTime), 1.633333, 358600, 1011, N'L110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1012, N'CuongHGJ', N'9874531234', 5, 3, CAST(N'2020-10-08T13:00:00.000' AS DateTime), CAST(N'2020-10-08T17:00:00.000' AS DateTime), 3.566667, 785400, 1012, N'L115')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1013, N'CuongGGG', N'987453131234', 4, 3, CAST(N'2020-10-26T12:30:00.000' AS DateTime), CAST(N'2020-10-26T17:30:00.000' AS DateTime), 4.1, 676500, 1013, N'V104')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1014, N'ABCSFDGF', N'9874131234', 5, 3, CAST(N'2020-10-27T12:30:00.000' AS DateTime), CAST(N'2020-10-27T16:30:00.000' AS DateTime), 4.133333, 908600, 1014, N'L113')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1015, N'ABCHGHGH', N'9874531234', 5, 3, CAST(N'2020-10-22T15:00:00.000' AS DateTime), CAST(N'2020-10-22T17:00:00.000' AS DateTime), 1.633333, 358600, 1015, N'L107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1016, N'ThangGHJFF', N'98745311234', 4, 3, CAST(N'2020-10-29T09:00:00.000' AS DateTime), CAST(N'2020-10-29T17:00:00.000' AS DateTime), 7.633333, 1678600, 1016, N'L104')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1017, N'CuongDGF', N'9874531234', 4, 3, CAST(N'2020-10-16T14:00:00.000' AS DateTime), CAST(N'2020-10-16T17:00:00.000' AS DateTime), 2.6, 572000, 1017, N'L105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1018, N'ThangSAF', N'567435', 5, 3, CAST(N'2020-11-09T14:00:00.000' AS DateTime), CAST(N'2020-11-09T17:00:00.000' AS DateTime), 2.566667, 565400, 1018, N'L106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1019, N'CongDDDD', N'9874531234', 5, 3, CAST(N'2020-11-03T13:00:00.000' AS DateTime), CAST(N'2020-11-03T16:00:00.000' AS DateTime), 3.55, 781000, 1019, N'L104')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1020, N'CuongGGGHH', N'98745131234', 5, 3, CAST(N'2020-11-06T11:00:00.000' AS DateTime), CAST(N'2020-11-06T17:00:00.000' AS DateTime), 5.566667, 1225400, 1020, N'L110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1021, N'CuongFDGg', N'9874531234', 4, 3, CAST(N'2020-01-14T13:00:00.000' AS DateTime), CAST(N'2020-01-14T17:00:00.000' AS DateTime), 3.6, 792000, 1021, N'L109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1022, N'CongHJJ', N'1233554', 4, 3, CAST(N'2020-01-19T13:00:00.000' AS DateTime), CAST(N'2020-01-19T17:00:00.000' AS DateTime), 3.6, 594000, 1022, N'V109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1023, N'CuongHGJ', N'98745431234', 4, 3, CAST(N'2020-07-22T12:30:00.000' AS DateTime), CAST(N'2020-07-22T17:30:00.000' AS DateTime), 4.133333, 681450, 1023, N'V115')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1024, N'ThangFDG', N'98731234', 3, 3, CAST(N'2020-09-02T13:00:00.000' AS DateTime), CAST(N'2020-09-02T17:00:00.000' AS DateTime), 3.55, 781000, 1024, N'L108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1025, N'CuongDSF', N'5455678', 5, 3, CAST(N'2020-07-14T15:00:00.000' AS DateTime), CAST(N'2020-07-14T17:00:00.000' AS DateTime), 1.7, 374000, 1025, N'L105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1026, N'CongFHH', N'9874534234', 4, 3, CAST(N'2020-07-22T13:00:00.000' AS DateTime), CAST(N'2020-07-22T17:00:00.000' AS DateTime), 3.7, 814000, 1026, N'L108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1027, N'CuongSAFFDG', N'98745431234', 4, 3, CAST(N'2020-07-22T14:30:00.000' AS DateTime), CAST(N'2020-07-22T17:30:00.000' AS DateTime), 2.2, 484000, 1027, N'L116')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1028, N'Cuong', N'55455', 5, 3, CAST(N'2020-07-14T15:00:00.000' AS DateTime), CAST(N'2020-07-14T17:00:00.000' AS DateTime), 1.7, 187000, 1028, N'S105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1029, N'CongFDG', N'984234', 4, 3, CAST(N'2020-07-22T15:00:00.000' AS DateTime), CAST(N'2020-07-22T17:00:00.000' AS DateTime), 1.7, 280500, 1029, N'V116')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1030, N'ThangSDFD', N'94234', 4, 3, CAST(N'2020-07-22T14:30:00.000' AS DateTime), CAST(N'2020-07-22T17:30:00.000' AS DateTime), 2.2, 363000, 1030, N'V102')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1031, N'THANG', N'654321', 4, 3, CAST(N'2020-11-20T15:30:00.000' AS DateTime), CAST(N'2020-11-22T22:16:00.000' AS DateTime), 6.05, 7023500, 1031, N'L109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1032, N'THANGSF', N'6543212', 4, 3, CAST(N'2020-11-22T16:00:00.000' AS DateTime), CAST(N'2020-11-22T22:44:00.000' AS DateTime), 5.783333, 4241600, 1032, N'L119')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1033, N'THANGÁDFG', N'6543213333', 3, 3, CAST(N'2020-05-22T15:00:00.000' AS DateTime), CAST(N'2020-05-22T19:00:00.000' AS DateTime), 6.866667, 4932400, 1033, N'L110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1034, N'THANG123', N'6543212333', 4, 3, CAST(N'2020-03-11T01:00:00.000' AS DateTime), CAST(N'2020-03-11T08:30:00.000' AS DateTime), 5.95, 139909000, 1034, N'L109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1035, N'Cuong', N'123456', 5, 3, CAST(N'2020-02-12T02:00:00.000' AS DateTime), CAST(N'2020-02-12T10:30:00.000' AS DateTime), 4.983334, 42345600, 1035, N'L108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1036, N'Cuong123', N'654321233344', 4, 3, CAST(N'2020-04-23T03:00:00.000' AS DateTime), CAST(N'2020-04-23T10:30:00.000' AS DateTime), 4.033333, 83386600, 1036, N'L113')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1037, N'THANGÁfghh', N'654321333', 5, 3, CAST(N'2020-05-23T03:00:00.000' AS DateTime), CAST(N'2020-05-23T09:00:00.000' AS DateTime), 4.1, 70202000, 1037, N'L110')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1038, N'CONGFG', N'654321344445', 4, 3, CAST(N'2020-06-23T02:00:00.000' AS DateTime), CAST(N'2020-06-23T10:00:00.000' AS DateTime), 5.133333, 110846450, 1038, N'V106')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1039, N'CONGASFFG', N'12345645', 5, 3, CAST(N'2020-07-23T04:00:00.000' AS DateTime), CAST(N'2020-07-23T09:00:00.000' AS DateTime), 3.183333, 96949600, 1039, N'L105')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1040, N'TUAN124', N'56734848', 8, 3, CAST(N'2020-08-23T04:00:00.000' AS DateTime), CAST(N'2020-08-23T09:00:00.000' AS DateTime), 3.25, 105215000, 1040, N'L108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1041, N'THANGSFFF', N'654321222', 2, 3, CAST(N'2020-09-23T03:00:00.000' AS DateTime), CAST(N'2020-09-23T10:30:00.000' AS DateTime), 4.3, 108196000, 1041, N'L109')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1042, N'THANG76', N'654321333', 3, 3, CAST(N'2020-01-22T04:00:00.000' AS DateTime), CAST(N'2020-01-22T09:00:00.000' AS DateTime), 3.35, 28237000, 1042, N'L104')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1043, N'THANGSFHH', N'6543215', 5, 3, CAST(N'2020-02-23T05:00:00.000' AS DateTime), CAST(N'2020-02-23T09:00:00.000' AS DateTime), 2.35, 28017000, 1043, N'L108')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1044, N'TUANFDGFG', N'65432133', 3, 3, CAST(N'2020-10-23T05:00:00.000' AS DateTime), CAST(N'2020-10-23T10:00:00.000' AS DateTime), 2.4, 96778000, 1044, N'L107')
INSERT [dbo].[Booking] ([PayID], [Name_Cus], [Phone_Cus], [Amount_Cus], [P_Status], [DateTime], [EndTime], [Duration], [Total], [Order_ID], [RoomID]) VALUES (1045, N'THANGYUHJYU', N'6543213334444', 6, 3, CAST(N'2020-11-04T03:00:00.000' AS DateTime), CAST(N'2020-11-04T10:00:00.000' AS DateTime), 4.4, 69718000, 1045, N'L108')
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (1, N'Mì Bò', 30000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (2, N'Mì xào hải sản', 85000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (3, N'Cơm chiên dương châu', 85000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (4, N'Bò lúc lắc', 95000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (5, N'Cafe đá', 60000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (6, N'Cafe Bailey', 60000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (7, N'Sữa tươi', 60000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (8, N'7UP', 60000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (9, N'Sting', 40000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (10, N'Coca', 40000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (11, N'Soda chanh', 60000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (12, N'Khô bò', 80000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (13, N'Khô gà', 80000, 97)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (14, N'Hạt dẻ', 50000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (15, N'Rong biển ', 40000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (16, N'Trái cây tổng hợp', 250000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (17, N'Khô mực nướng', 80000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (18, N'Tôm hấp bia', 120000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (19, N'Khoai tây chiên', 50000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (20, N'Tiger', 40000, 89)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (21, N'Heineken', 40000, 68)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (22, N'333', 30000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (23, N'Mực 1 nắng chiên bơ', 180000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (24, N'Nước suối ', 20000, 89)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (25, N'Tôm kim sa', 60000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (26, N'Phô mai que', 50000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (27, N'Yaourt trái cây', 80000, 96)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (28, N'Sapporo', 30000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (29, N'Chivas 12', 1300000, 88)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (30, N'Chivas 18', 2500000, 717)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (31, N'Shisha', 400000, 97)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (32, N'Bò húc', 30000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (33, N'Tôm hấp nước dừa', 150000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (34, N'Bún gạo xào Singapore', 120000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (35, N'Gỏi bò tái chanh', 170000, 95)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (36, N'Gỏi bò rau sống', 170000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (37, N'Giò heo chiên giòn', 340000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (38, N'Rau muống xào bò', 170000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (39, N'Khổ qua xào trứng', 120000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (40, N'Ô long', 25000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (41, N'Khổ qua xào bò', 170000, 96)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (42, N'Cơm chiên cá mặn', 150000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (43, N'Strongbow', 40000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (44, N'Mực xào chua ngọt', 180000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (45, N'Mì xào thập cẩm', 170000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (46, N'Gà hấp muối', 340000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (47, N'Gà hấp hành', 340000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (48, N'Havana 7 year', 200000, 94)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (49, N'Ciroc', 220000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (50, N'Soju', 30000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (51, N'Budweiser', 50000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (52, N'Combo trái cây 1', 200000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (53, N'Combo trái cây 2', 280000, 97)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (54, N'Combo trái cây 3', 380000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (55, N'Tháp Bia', 400000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (56, N'Set Lady Killer', 600000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (57, N'Set Hawaii', 350000, 99)
INSERT [dbo].[Menu] ([Food_ID], [Name], [Price], [Stock]) VALUES (58, N'Set Bomb', 460000, 99)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (2, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (3, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (4, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (5, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (6, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (7, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (8, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (9, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (10, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (11, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (12, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (13, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (14, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (15, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (16, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (17, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (18, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (19, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (20, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (21, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (22, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (23, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (24, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (25, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (26, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (27, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (28, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (29, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (30, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (31, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (32, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (33, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (34, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (35, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (36, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (37, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (38, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (39, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (40, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (41, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (43, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (45, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (46, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (47, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (48, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (49, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (50, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (51, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (52, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (53, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (54, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (55, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (56, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (57, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (58, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (59, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (60, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (61, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (62, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (63, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (64, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (65, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (66, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (67, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (68, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (69, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (70, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (71, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (72, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (73, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (74, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (75, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (76, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (77, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (78, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (79, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (80, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (81, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (82, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (83, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (84, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (85, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (86, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (87, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (88, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (89, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (90, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (91, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (92, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (93, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (94, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (95, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (96, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (97, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (98, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (99, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (100, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (101, 0)
GO
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (102, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (103, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (104, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (105, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (106, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (107, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (108, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (109, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (111, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (112, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (113, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (114, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (115, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (116, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (117, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (118, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (119, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (120, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1002, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1003, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1004, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1005, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1006, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1007, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1008, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1009, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1010, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1011, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1012, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1013, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1014, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1015, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1016, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1017, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1018, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1019, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1020, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1021, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1022, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1023, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1024, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1025, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1026, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1027, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1028, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1029, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1030, 0)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1031, 5175000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1032, 2700000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1033, 3110000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1034, 126000000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1035, 37500000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1036, 75000000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1037, 63000000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1038, 100000000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1039, 87500000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1040, 95000000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1041, 97500000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1042, 25000000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1043, 25000000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1044, 87500000)
INSERT [dbo].[Order] ([Order_ID], [O_total]) VALUES (1045, 62500000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (1, 2, 1031, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (2, 7, 1031, 21)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (3, 2, 1032, 13)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (4, 1, 1032, 29)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (5, 12, 1032, 21)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (6, 2, 1032, 53)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (7, 10, 1032, 24)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (8, 4, 1033, 35)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (9, 10, 1033, 20)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (10, 12, 1033, 21)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (11, 2, 1033, 31)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (12, 3, 1033, 27)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (13, 3, 1033, 41)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (14, 5, 1034, 48)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (15, 50, 1034, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (16, 15, 1035, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (17, 30, 1036, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (18, 20, 1037, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (19, 10, 1037, 29)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (20, 40, 1038, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (21, 35, 1039, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (22, 38, 1040, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (23, 39, 1041, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (24, 10, 1042, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (25, 10, 1043, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (26, 25, 1045, 30)
INSERT [dbo].[Order_Detail] ([OD_ID], [Quantity], [Order_ID], [Food_ID]) VALUES (27, 35, 1044, 30)
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L101', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L102', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L103', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L104', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L105', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L106', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L107', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L108', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L109', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L110', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L111', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L112', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L113', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L114', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L115', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L116', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L117', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L118', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L119', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'L120', N'Luxury', 200000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S101', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S102', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S103', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S104', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S105', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S106', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S107', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S108', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S109', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S110', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S111', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S112', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S113', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S114', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S115', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S116', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S117', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S118', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S119', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'S120', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V101', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V102', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V103', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V104', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V105', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V106', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V107', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V108', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V109', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V110', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V111', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V112', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V113', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V114', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V115', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V116', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V117', N'Standard', 100000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V118', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V119', N'Vip', 150000, 1)
INSERT [dbo].[Room] ([RoomID], [RoomType], [R_Price], [Status]) VALUES (N'V120', N'Vip', 150000, 1)
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Booking_dbo.Order_Order_ID] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_dbo.Booking_dbo.Order_Order_ID]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Booking_dbo.Room_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_dbo.Booking_dbo.Room_RoomID]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_Detail_dbo.Menu_Food_ID] FOREIGN KEY([Food_ID])
REFERENCES [dbo].[Menu] ([Food_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_dbo.Order_Detail_dbo.Menu_Food_ID]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_Detail_dbo.Order_Order_ID] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_dbo.Order_Detail_dbo.Order_Order_ID]
GO
