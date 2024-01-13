USE [master]
GO
/****** Object:  Database [gravity_books_DWH]    Script Date: 1/9/2024 7:20:21 PM ******/
CREATE DATABASE [gravity_books_DWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gravity_books_DWH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\gravity_books_DWH.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gravity_books_DWH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\gravity_books_DWH_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [gravity_books_DWH] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gravity_books_DWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gravity_books_DWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gravity_books_DWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gravity_books_DWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gravity_books_DWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gravity_books_DWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET RECOVERY FULL 
GO
ALTER DATABASE [gravity_books_DWH] SET  MULTI_USER 
GO
ALTER DATABASE [gravity_books_DWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gravity_books_DWH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gravity_books_DWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gravity_books_DWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gravity_books_DWH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gravity_books_DWH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'gravity_books_DWH', N'ON'
GO
ALTER DATABASE [gravity_books_DWH] SET QUERY_STORE = ON
GO
ALTER DATABASE [gravity_books_DWH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [gravity_books_DWH]
GO
/****** Object:  Table [dbo].[dim_book]    Script Date: 1/9/2024 7:20:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_book](
	[book_sk] [int] IDENTITY(1,1) NOT NULL,
	[book_id] [int] NOT NULL,
	[isBn13] [varchar](13) NOT NULL,
	[language_code] [varchar](400) NULL,
	[language_name] [varchar](50) NULL,
	[num_pages] [int] NULL,
	[publication_date] [date] NULL,
	[publication_name] [varchar](400) NULL,
	[author_name] [varchar](400) NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NOT NULL,
	[source_system_code] [tinyint] NOT NULL,
	[tittle] [varchar](400) NULL,
 CONSTRAINT [pk_dim_book] PRIMARY KEY CLUSTERED 
(
	[book_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_customer]    Script Date: 1/9/2024 7:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_customer](
	[customer_sk] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](200) NULL,
	[last_name] [varchar](200) NULL,
	[email] [varchar](350) NULL,
	[address_status] [varchar](30) NULL,
	[street_number] [nvarchar](10) NULL,
	[street_name] [varchar](200) NULL,
	[city] [nvarchar](100) NULL,
	[country] [varchar](200) NULL,
	[is_current] [tinyint] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [pk_dim_customer] PRIMARY KEY CLUSTERED 
(
	[customer_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_date]    Script Date: 1/9/2024 7:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_date](
	[DateSK] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Day] [char](2) NOT NULL,
	[DaySuffix] [varchar](4) NOT NULL,
	[DayOfWeek] [varchar](9) NOT NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[DayOfYear] [int] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[Month] [char](2) NOT NULL,
	[MonthName] [varchar](9) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[Year] [char](4) NOT NULL,
	[StandardDate] [varchar](10) NULL,
	[HolidayText] [varchar](50) NULL,
	[FiscalDay] [char](2) NULL,
	[FiscalMonth] [char](2) NULL,
	[FiscalMonthName] [varchar](9) NULL,
	[FiscalQuarter] [tinyint] NULL,
	[FiscalQuarterName] [varchar](6) NULL,
	[FiscalYear] [char](4) NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_shipping]    Script Date: 1/9/2024 7:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_shipping](
	[shipping_sk] [int] IDENTITY(1,1) NOT NULL,
	[shipping_id] [int] NOT NULL,
	[shipping_method] [varchar](100) NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NOT NULL,
 CONSTRAINT [pk_dim_shipping] PRIMARY KEY CLUSTERED 
(
	[shipping_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_book_sales]    Script Date: 1/9/2024 7:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_book_sales](
	[customer_sk] [int] NOT NULL,
	[book_sk] [int] NOT NULL,
	[shipping_sk] [int] NOT NULL,
	[date_sk] [int] NOT NULL,
	[price] [decimal](5, 2) NULL,
	[shipping_cost] [decimal](6, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [dim_book_book_id]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [dim_book_book_id] ON [dbo].[dim_book]
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [dim_customer_city]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [dim_customer_city] ON [dbo].[dim_customer]
(
	[city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [dim_customer_customer_id]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [dim_customer_customer_id] ON [dbo].[dim_customer]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_dim_Time_HolidayText]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_dim_Time_HolidayText] ON [dbo].[dim_date]
(
	[HolidayText] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_Date]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_DimDate_Date] ON [dbo].[dim_date]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_Day]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Day] ON [dbo].[dim_date]
(
	[Day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_DayOfWeek]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_DayOfWeek] ON [dbo].[dim_date]
(
	[DayOfWeek] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_DayOfYear]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_DayOfYear] ON [dbo].[dim_date]
(
	[DayOfYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_DOWInMonth]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_DOWInMonth] ON [dbo].[dim_date]
(
	[DOWInMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_FiscalMonth]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalMonth] ON [dbo].[dim_date]
(
	[FiscalMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_FiscalMonthName]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalMonthName] ON [dbo].[dim_date]
(
	[MonthName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_FiscalQuarter]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalQuarter] ON [dbo].[dim_date]
(
	[FiscalQuarter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_FiscalQuarterName]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalQuarterName] ON [dbo].[dim_date]
(
	[FiscalQuarterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_FiscalYear]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalYear] ON [dbo].[dim_date]
(
	[FiscalYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_Month]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Month] ON [dbo].[dim_date]
(
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_MonthName]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_MonthName] ON [dbo].[dim_date]
(
	[MonthName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_Quarter]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Quarter] ON [dbo].[dim_date]
(
	[Quarter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_QuarterName]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_QuarterName] ON [dbo].[dim_date]
(
	[QuarterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_WeekOfMonth]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_WeekOfMonth] ON [dbo].[dim_date]
(
	[WeekOfMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_WeekOfYear]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_WeekOfYear] ON [dbo].[dim_date]
(
	[WeekOfYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_Year]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Year] ON [dbo].[dim_date]
(
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [dim_shipping_method]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [dim_shipping_method] ON [dbo].[dim_shipping]
(
	[shipping_method] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [dim_shipping_shipping_id]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [dim_shipping_shipping_id] ON [dbo].[dim_shipping]
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fact_book_sales_dim_customer]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [fact_book_sales_dim_customer] ON [dbo].[fact_book_sales]
(
	[customer_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fact_sales_dim_date]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [fact_sales_dim_date] ON [dbo].[fact_book_sales]
(
	[date_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fact_sales_dim_territory]    Script Date: 1/9/2024 7:20:23 PM ******/
CREATE NONCLUSTERED INDEX [fact_sales_dim_territory] ON [dbo].[fact_book_sales]
(
	[book_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dim_book] ADD  CONSTRAINT [DF__dim_book__start___0A688BB1]  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[dim_book] ADD  CONSTRAINT [DF__dim_book__is_cur__0B5CAFEA]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[dim_customer] ADD  CONSTRAINT [DF__dim_custo__is_cu__1B9317B3]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[dim_customer] ADD  CONSTRAINT [DF__dim_custo__start__1C873BEC]  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[dim_shipping] ADD  CONSTRAINT [DF__dim_shipp__start__12FDD1B2]  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[dim_shipping] ADD  CONSTRAINT [DF__dim_shipp__is_cu__13F1F5EB]  DEFAULT ((1)) FOR [is_current]
GO
ALTER TABLE [dbo].[fact_book_sales]  WITH CHECK ADD  CONSTRAINT [fk_fact_book_sales_dim_customer] FOREIGN KEY([customer_sk])
REFERENCES [dbo].[dim_customer] ([customer_sk])
GO
ALTER TABLE [dbo].[fact_book_sales] CHECK CONSTRAINT [fk_fact_book_sales_dim_customer]
GO
ALTER TABLE [dbo].[fact_book_sales]  WITH CHECK ADD  CONSTRAINT [fk_fact_sales_dim_book] FOREIGN KEY([book_sk])
REFERENCES [dbo].[dim_book] ([book_sk])
GO
ALTER TABLE [dbo].[fact_book_sales] CHECK CONSTRAINT [fk_fact_sales_dim_book]
GO
ALTER TABLE [dbo].[fact_book_sales]  WITH CHECK ADD  CONSTRAINT [fk_fact_sales_dim_date] FOREIGN KEY([date_sk])
REFERENCES [dbo].[dim_date] ([DateSK])
GO
ALTER TABLE [dbo].[fact_book_sales] CHECK CONSTRAINT [fk_fact_sales_dim_date]
GO
ALTER TABLE [dbo].[fact_book_sales]  WITH CHECK ADD  CONSTRAINT [fk_fact_sales_dim_shipping] FOREIGN KEY([shipping_sk])
REFERENCES [dbo].[dim_shipping] ([shipping_sk])
GO
ALTER TABLE [dbo].[fact_book_sales] CHECK CONSTRAINT [fk_fact_sales_dim_shipping]
GO
USE [master]
GO
ALTER DATABASE [gravity_books_DWH] SET  READ_WRITE 
GO
