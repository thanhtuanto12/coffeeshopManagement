create database CoffeeShopDatabase
go

use CoffeeShopDatabase
go

create table TableFood
(
id int identity primary key,
tableName nvarchar(100) not null,
status nvarchar(100) not null ---Empty or full----
)
go

create table Account
(
username nvarchar(100) primary key,
displayName nvarchar(100) not null,
password nvarchar(1000) not null,
typeAccount int not null
)
go

create table FoodCategory
(
id int identity primary key,
categoryName nvarchar(100) not null,
)
go

create table Food
(
id int identity primary key,
idCategory int not null,
DisplayName nvarchar(100) not null,
price float not null default 0

foreign key(idCategory) references dbo.FoodCategory(id)
)
go

create table Bill
(
id int identity primary key,
DateCheckIn date not null default getdate(),
DateCheckOut date,
idTable int not null,
status int not null default 0 --if 1 => paid --- 0 not paid

foreign key(idTable) references dbo.TableFood(id)
)
go

create table BillInfo
(
id int identity primary key,
idBill int not null,
idFood int not null,
count int not null default 0

foreign key(idBill) references dbo.Bill(id),
foreign key(idFood) references dbo.Food(id)
)
go


