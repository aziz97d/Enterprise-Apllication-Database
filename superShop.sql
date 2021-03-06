USE [master]
GO
/****** Object:  Database [dbSuperShop]    Script Date: 3/14/2019 7:49:19 AM ******/
CREATE DATABASE [dbSuperShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbSuperShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbSuperShop.mdf' , SIZE = 32768KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbSuperShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbSuperShop_log.ldf' , SIZE = 13632KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbSuperShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbSuperShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbSuperShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbSuperShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbSuperShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbSuperShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbSuperShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbSuperShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbSuperShop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbSuperShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbSuperShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbSuperShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbSuperShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbSuperShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbSuperShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbSuperShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbSuperShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbSuperShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbSuperShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbSuperShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbSuperShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbSuperShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbSuperShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbSuperShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbSuperShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbSuperShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbSuperShop] SET  MULTI_USER 
GO
ALTER DATABASE [dbSuperShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbSuperShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbSuperShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbSuperShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [dbSuperShop]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[origin] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](200) NULL,
	[categoryId] [int] NULL,
 CONSTRAINT [PK__category__3213E83F1BCE4080] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__category__72E12F1BEE32D20C] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[contact] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](500) NOT NULL,
	[type] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ledger]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ledger](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[contact] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](500) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[dateOfBirth] [date] NULL,
	[address] [varchar](500) NULL,
	[cityId] [int] NULL,
	[createDate] [datetime] NULL,
	[image] [image] NULL,
	[type] [varchar](20) NULL,
 CONSTRAINT [PK__ledger__3213E83FC504C928] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__ledger__870C3C8BA95121E4] UNIQUE NONCLUSTERED 
(
	[contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__ledger__AB6E6164B6AE648E] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[code] [varchar](200) NOT NULL,
	[description] [varchar](500) NULL,
	[brandId] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[createDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productImage]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[image] [image] NOT NULL,
	[title] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productPrice]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productPrice](
	[productId] [int] NOT NULL,
	[unitId] [int] NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[purchase]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NOT NULL,
	[dateTime] [datetime] NULL,
	[supplierId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[total] [float] NOT NULL,
	[vat] [float] NOT NULL,
	[discount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[purchaseDetails]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchaseDetails](
	[purchaseId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[rate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchaseId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sale]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](20) NULL,
	[datetime] [datetime] NULL,
	[customerLedgerId] [int] NOT NULL,
	[total] [float] NULL,
	[vat] [float] NULL,
	[discount] [float] NULL,
	[employeeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[saleDetails]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[saleDetails](
	[saleId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[qty] [float] NULL,
	[rate] [float] NULL,
	[vat] [float] NULL,
	[discount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[saleId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[transaction]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](200) NOT NULL,
	[reference] [varchar](200) NULL,
	[dateTime] [datetime] NULL,
	[ledgerId] [int] NULL,
	[employeeId] [int] NULL,
	[debit] [float] NULL,
	[credit] [float] NULL,
	[remarks] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[unit]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[description] [varchar](500) NULL,
	[primaryQty] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vwCashFlow]    Script Date: 3/14/2019 7:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwCashFlow]
as
select number, reference, ledgerid, debit, credit from [transaction]
GO
/****** Object:  View [dbo].[vwSale]    Script Date: 3/14/2019 7:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view
[dbo].[vwSale]
as
select s.id, s.number, s.datetime, s.customerLedgerId, l.name as customer, 
s.total, s.vat as GrandVat, s.discount as GrandDiscount, (s.total + (s.total * s.vat/100) -(s.total * s.discount/100)) as finalPrice,
s.employeeId, l2.name as employee, sd.productId, p.name as product, sd.qty, sd.rate, sd.vat, sd.discount,
((sd.rate*sd.qty) + (sd.rate*sd.qty)*sd.vat/100 - (sd.rate * sd.qty)*sd.discount/100) as SubTotal
from sale as s
left join saleDetails as sd on sd.saleId = s.id
left join ledger as l on s.customerLedgerId = l.id
left join ledger as l2 on s.employeeId = l2.id
left join product as p on sd.productId = p.id
GO
/****** Object:  View [dbo].[vwSaleVoucher]    Script Date: 3/14/2019 7:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwSaleVoucher]
as
select s.id, s.number, s.datetime, l.name as customer, l.contact, l.email, e.name as employee , 
p.name as product, p.code, sd.discount as Ediscount, sd.vat as Evat, sd.qty, sd.rate, (sd.rate + (sd.rate*sd.vat) - (sd.rate * sd.vat))*sd.qty as subTotal ,s.total, s.discount, s.vat
from sale as s
left join ledger as l on l.id=s.customerLedgerId
left join ledger as e on e.id = s.employeeId
left join saleDetails as sd on sd.saleId = s.id
left join product as p on p.id = sd.productId
GO
/****** Object:  View [dbo].[vwStock]    Script Date: 3/14/2019 7:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwStock]
as

SELECT p.id, p.name, p.code, p.description, p.createDate, pp.price, u.name as unit, b.name AS brand, c.name AS category
FROM  dbo.product AS p LEFT OUTER JOIN
dbo.brand AS b ON b.id = p.brandId LEFT OUTER JOIN
dbo.category AS c ON c.id = p.categoryId LEFT OUTER JOIN
dbo.productPrice AS pp ON pp.productId = p.id
left join unit as u on u.id = pp.unitId
GO
ALTER TABLE [dbo].[ledger] ADD  CONSTRAINT [DF__ledger__createDa__15502E78]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[purchase] ADD  DEFAULT (getdate()) FOR [dateTime]
GO
ALTER TABLE [dbo].[sale] ADD  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[transaction] ADD  DEFAULT (getdate()) FOR [dateTime]
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FK__category__catego__1CF15040] FOREIGN KEY([categoryId])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FK__category__catego__1CF15040]
GO
ALTER TABLE [dbo].[ledger]  WITH CHECK ADD  CONSTRAINT [FK__ledger__type__164452B1] FOREIGN KEY([cityId])
REFERENCES [dbo].[city] ([id])
GO
ALTER TABLE [dbo].[ledger] CHECK CONSTRAINT [FK__ledger__type__164452B1]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__categor__2E1BDC42] FOREIGN KEY([categoryId])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__categor__2E1BDC42]
GO
ALTER TABLE [dbo].[productPrice]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[productPrice]  WITH CHECK ADD FOREIGN KEY([unitId])
REFERENCES [dbo].[unit] ([id])
GO
ALTER TABLE [dbo].[purchase]  WITH CHECK ADD FOREIGN KEY([employeeId])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[sale]  WITH CHECK ADD FOREIGN KEY([customerLedgerId])
REFERENCES [dbo].[ledger] ([id])
GO
ALTER TABLE [dbo].[sale]  WITH CHECK ADD  CONSTRAINT [FK__sale__employeeLe__03F0984C] FOREIGN KEY([employeeId])
REFERENCES [dbo].[ledger] ([id])
GO
ALTER TABLE [dbo].[sale] CHECK CONSTRAINT [FK__sale__employeeLe__03F0984C]
GO
ALTER TABLE [dbo].[saleDetails]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[saleDetails]  WITH CHECK ADD FOREIGN KEY([saleId])
REFERENCES [dbo].[sale] ([id])
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK__transacti__emplo__37A5467C] FOREIGN KEY([employeeId])
REFERENCES [dbo].[ledger] ([id])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK__transacti__emplo__37A5467C]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK__transacti__ledge__36B12243] FOREIGN KEY([ledgerId])
REFERENCES [dbo].[ledger] ([id])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK__transacti__ledge__36B12243]
GO
USE [master]
GO
ALTER DATABASE [dbSuperShop] SET  READ_WRITE 
GO
