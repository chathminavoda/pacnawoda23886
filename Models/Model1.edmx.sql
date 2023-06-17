
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/05/2023 05:23:51
-- Generated from EDMX file: C:\Users\HarshaRathnayake\source\repos\ERPsystemproj\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [erp_db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [orderId] int IDENTITY(1,1) NOT NULL,
    [createddate] nvarchar(max)  NOT NULL,
    [modifiedBy] nvarchar(max)  NOT NULL,
    [quantity] nvarchar(max)  NOT NULL,
    [Customer_customerId] int  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [customerId] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [contact] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Storages'
CREATE TABLE [dbo].[Storages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [binId] nvarchar(max)  NOT NULL,
    [location] nvarchar(max)  NOT NULL,
    [StorageOrder_Storage_orderId] int  NOT NULL
);
GO

-- Creating table 'Payments'
CREATE TABLE [dbo].[Payments] (
    [paymentId] int IDENTITY(1,1) NOT NULL,
    [paymentRefId] nvarchar(max)  NOT NULL,
    [PaymentOrder_Payment_orderId] int  NOT NULL
);
GO

-- Creating table 'Order_Line'
CREATE TABLE [dbo].[Order_Line] (
    [lineitemId] int IDENTITY(1,1) NOT NULL,
    [productId] nvarchar(max)  NOT NULL,
    [quantity] nvarchar(max)  NOT NULL,
    [Order_orderId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [orderId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([orderId] ASC);
GO

-- Creating primary key on [customerId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([customerId] ASC);
GO

-- Creating primary key on [Id] in table 'Storages'
ALTER TABLE [dbo].[Storages]
ADD CONSTRAINT [PK_Storages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [paymentId] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [PK_Payments]
    PRIMARY KEY CLUSTERED ([paymentId] ASC);
GO

-- Creating primary key on [lineitemId] in table 'Order_Line'
ALTER TABLE [dbo].[Order_Line]
ADD CONSTRAINT [PK_Order_Line]
    PRIMARY KEY CLUSTERED ([lineitemId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Customer_customerId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_OrderCustomer]
    FOREIGN KEY ([Customer_customerId])
    REFERENCES [dbo].[Customers]
        ([customerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderCustomer'
CREATE INDEX [IX_FK_OrderCustomer]
ON [dbo].[Orders]
    ([Customer_customerId]);
GO

-- Creating foreign key on [StorageOrder_Storage_orderId] in table 'Storages'
ALTER TABLE [dbo].[Storages]
ADD CONSTRAINT [FK_StorageOrder]
    FOREIGN KEY ([StorageOrder_Storage_orderId])
    REFERENCES [dbo].[Orders]
        ([orderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StorageOrder'
CREATE INDEX [IX_FK_StorageOrder]
ON [dbo].[Storages]
    ([StorageOrder_Storage_orderId]);
GO

-- Creating foreign key on [PaymentOrder_Payment_orderId] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [FK_PaymentOrder]
    FOREIGN KEY ([PaymentOrder_Payment_orderId])
    REFERENCES [dbo].[Orders]
        ([orderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaymentOrder'
CREATE INDEX [IX_FK_PaymentOrder]
ON [dbo].[Payments]
    ([PaymentOrder_Payment_orderId]);
GO

-- Creating foreign key on [Order_orderId] in table 'Order_Line'
ALTER TABLE [dbo].[Order_Line]
ADD CONSTRAINT [FK_OrderOrder_Line]
    FOREIGN KEY ([Order_orderId])
    REFERENCES [dbo].[Orders]
        ([orderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderOrder_Line'
CREATE INDEX [IX_FK_OrderOrder_Line]
ON [dbo].[Order_Line]
    ([Order_orderId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------