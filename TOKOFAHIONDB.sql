use master
go
create database TOKOFASHION
go

use TOKOFASHION
go

create table Users
(	email nvarchar(100) primary key,
	username nvarchar(100) not null,
	password nvarchar(100) not null,
	role bit,
	activated bit,
)
go

create table Verifyaccounts(
	idverify int  identity,
	email nvarchar(100),
	Verifycode varchar(8),
	primary key (idverify),
	foreign key (email) references Users(email)
)

go
create table Orders
(
	order_id int primary key identity,
	email nvarchar(100),
	order_date date,
	total bigint,
	foreign key (email) references Users(email)
)

go
create table Categories
(
	category_id nvarchar(30) primary key,
	category_type nvarchar(20) not null
)

go
create table Products
(
	product_id nvarchar(30) primary key,
	category_id nvarchar(30),
	product_name nvarchar(100) not null,
	price bigint not null,
	img1 nvarchar(max),
	img2 nvarchar(max),
	img3 nvarchar(max),
	descmaterial nvarchar(max),
	descsize nvarchar(max),
	descpattern nvarchar(max),

	foreign key (category_id) references Categories(category_id)
)

go

create table Productdetail
(
	Productdetail_id int identity(1,1) ,
	product_id nvarchar(30),
	PD_quantity int, -- Số lượng
	size nvarchar(max) not null,
	foreign key (product_id) references Products(product_id)
)
go

create table Orderdetails
(
	order_details_id int primary key identity,
	order_id int,
	product_id nvarchar(30),
	size nvarchar(max),
	quantity int, -- Số lượng
	foreign key (order_id) references Orders(order_id),
	foreign key (product_id) references Products(product_id)
)

go




insert into Users
values
('tuan268493@gmail.com', 'tuanlm', '123456', 0,1 ),
('hothuan20112003@gmail.com', 'thuanhm', '123456', 1,1 ),
('hieutt@gmail.com', 'hieutt', '123456', 1,1 ),
('antc@gmail.com', 'Antc', '123456', 1, 1),
('vynt@gmail.com', 'vynt', '123456', 1, 1),
('tuanlm@gmail.com', 'tuanlm', '123456', 1,1 ),
('thainq@gmail.com', 'thainq', '123456', 1,1)

insert into Categories
values
('CT001','shirt'),
('CT002', 'Bag'),
('CT003', 'Balo')

insert into Products
values
('TK001', 'CT001', N'Raglan Line Kem Tee Nâu Kem - DRLNAK', 350000,'https://product.hstatic.net/1000281824/product/nta101_orws4d12-1-5zui-hinh_mat_truoc-0_42ecfc93ab9c4171b9e3d54481ba00e7.jpeg','https://product.hstatic.net/1000281824/product/nta101_orws4d12-1-5zui-hinh_mat_sau-0_587d6a69a4e74350a8182e1c1374873d_master.jpeg','https://cdn.discordapp.com/attachments/866228219828895754/1135530297589518356/z4563215945642_09208dbc2f463e6f7025a71cae5408fe.png'
, N'250gsm, cotton 2 chiều',N'S/M/L',N'Được In Cao'),

('TK002', 'CT001', N'Raglan Line Nâu Tee Nâu Kem - DRLNAU', 350000,'https://product.hstatic.net/1000281824/product/nta101_orws4d12-1-evm3-hinh_mat_truoc-0_756fc3b326194c738ce267ca213c7771.jpeg','https://product.hstatic.net/1000281824/product/nta101_orws4d12-1-evm3-hinh_mat_sau-0_262c214e9cca41fb9504312db329ecc1.jpeg','https://cdn.discordapp.com/attachments/866228219828895754/1135530297589518356/z4563215945642_09208dbc2f463e6f7025a71cae5408fe.png'
, N'250gsm, cotton 2 chiều',N'S/M/L',N'Được In Cao'),

('TK003', 'CT001', N'Raglan Line Hồng Tee Đen Hồng - DRLHD', 350000,'https://product.hstatic.net/1000281824/product/nta101_jisqrlku-1-l0fx-hinh_mat_truoc-0_bcc9f1deee6f4fd09f42dd43c54e6c76.jpeg','https://product.hstatic.net/1000281824/product/nta101_jisqrlku-1-l0fx-hinh_mat_sau-0_221639ae1ed44d85b522b74b97012831.jpeg','https://cdn.discordapp.com/attachments/866228219828895754/1135530297589518356/z4563215945642_09208dbc2f463e6f7025a71cae5408fe.png'
, N'250gsm, cotton 2 chiều',N'S/M/L',N'Được In Cao'),

('TK004', 'CT001', N'Raglan Line Đen Tee Đen Hồng - DRLDH', 350000,'https://product.hstatic.net/1000281824/product/nta101_orws4d12-1-rav4-hinh_mat_truoc-0_335e4f890cf24bb3ac2ad000c5ac186e.jpeg','https://product.hstatic.net/1000281824/product/nta101_orws4d12-1-rav4-hinh_mat_sau-0_ab3319d42339485eba92c3f00910312c.jpeg','https://cdn.discordapp.com/attachments/866228219828895754/1135530297589518356/z4563215945642_09208dbc2f463e6f7025a71cae5408fe.png'
, N'250gsm, cotton 2 chiều',N'S/M/L',N'Được In Cao'),

('TK005', 'CT001', N'Raglan Line Kem Tee Green Kem - DRLKG', 350000,'https://product.hstatic.net/1000281824/product/nta101_orws4d12-1-w356-hinh_mat_truoc-0_ec92f159ebfa44d4aa3ab1019451c94e.jpeg','https://product.hstatic.net/1000281824/product/nta101_orws4d12-1-w356-hinh_mat_sau-0_2ca93816460a4ae5bcbeeba37e900139.jpeg','https://cdn.discordapp.com/attachments/866228219828895754/1135530297589518356/z4563215945642_09208dbc2f463e6f7025a71cae5408fe.png'
, N'250gsm, cotton 2 chiều',N'S/M/L',N'Được In Cao'),

('TK006', 'CT001', N'Raglan Line Green Tee Green Kem - DRLGK', 350000,'https://product.hstatic.net/1000281824/product/nta101_jisqrlku-1-36y7-hinh_mat_truoc-0_35a62380048640d2b795cc00f96bd793.jpeg','https://product.hstatic.net/1000281824/product/nta101_jisqrlku-1-36y7-hinh_mat_sau-0_13252dc2b1704934b86e813c8858251a.jpeg','https://cdn.discordapp.com/attachments/866228219828895754/1135530297589518356/z4563215945642_09208dbc2f463e6f7025a71cae5408fe.png'
, N'250gsm, cotton 2 chiều',N'S/M/L',N'Được In Cao'),

('TK007', 'CT001', N'Raglan Line Tee Đen - DRLD', 350000,'https://product.hstatic.net/1000281824/product/img_9923_aed040055a9d4bd9913654286ab017b2.jpeg','https://product.hstatic.net/1000281824/product/img_9919_26d1c4e8cab84d928e701e71d21adb8b.jpeg',''
, N'250gsm, cotton 2 chiều',N'S/M/L',N'Được In Cao'),

('TK008', 'CT002', N' Crocodile Simili Bag - DCC', 350000, 'https://product.hstatic.net/1000281824/product/tui_mini_bac_64ce55d36b29471ab81ad4d1640eb448.png', 'https://product.hstatic.net/1000281824/product/img_0111_da8cb62547fa41a69c003b0ee61c3068.jpeg', 'https://product.hstatic.net/1000281824/product/img_0142_cb66d35cc0e847e6beae15dd7ebfaf3e.jpeg', 
N'Simili', N'23x15x10', N'Logo dập chìm'),

('TK009', 'CT002', N' Black Coffee Simili Bag - DBC', 350000, 'https://product.hstatic.net/1000281824/product/tui_mini_den_2f6aca10364e4754a4dc8a2f57f43b72.png', 'https://product.hstatic.net/1000281824/product/ayya0499_49c04089a96444e0bcf1732967ae516f.jpeg', 'https://product.hstatic.net/1000281824/product/ayya0482_20b235f6f3bf42efa31e9126095d484f.jpeg', 
N'Simili', N'23x15x10', N'Logo dập chìm'),

('TK010', 'CT002', N'Coffee Simili Bag - DCSB', 350000, 'https://product.hstatic.net/1000281824/product/nt5138_x4f7f5bh-1-htxy-hinh_nghieng_trai_sau_linh_dong-0_2ae55991b4094071a928780dcd62561a.jpg', 'https://product.hstatic.net/1000281824/product/nt5138_x4f7f5bh-1-htxy-hinh_mo_ra_thay_ben_trong-0_b42b89151f5d4efcaf76a8c7c5377c72.jpg', 'https://product.hstatic.net/1000281824/product/nt5138_x4f7f5bh-1-htxy-hinh_mat_sau-0_ecda3e2fa1234855ad5ebb46b3f53a0b.jpg', 
N'Simili', N'23x15x10', N'Logo dập chìm'),

('TK011', 'CT002', N'Silver Simili Bag - SILV', 350000, 'https://product.hstatic.net/1000281824/product/img_5776_16cbefdb761848c7ab20e13b89c66a17.jpeg', 'https://product.hstatic.net/1000281824/product/c270134e463641b2a5ac67b090a8ac89_6bcc2126cbb54daba74920eb0998a5ae.jpg', 'https://product.hstatic.net/1000281824/product/594a4b429d97450dab7b4fb89aac5011_cb7a424a821e4d34813c2f691316745f.jpg', 
N'Simili', N'23x15x10', N'Logo dập chìm'),

('TK012', 'CT002', N'Crocodile Simili Bag Yellow - DCCY', 350000, 'https://product.hstatic.net/1000281824/product/8c3b43d31c864c019305b94f08d139d5_987efebc259046cab245cd7fe0f5e8ad.jpg', 'https://product.hstatic.net/1000281824/product/img_5781_46aae235d81c4afca8698a186757f685.jpeg', 'https://product.hstatic.net/1000281824/product/db83e229283d47c28f004a2094f9a2b6_d28b98922aa54c4bba608ae6cdae0e88.jpg', 
N'Simili', N'23x15x10', N'Logo dập chìm'),

('TK013', 'CT002', N'Crocodile Slay Bag - SLAY', 480000, 'https://product.hstatic.net/1000281824/product/nt5138_2savwjzb-1-3pb5-hinh_nghieng_trai-0_97a8b0bf67fd4e8b87ee745295e67042.jpeg', 'https://product.hstatic.net/1000281824/product/nt5138_2savwjzb-1-3pb5-hinh_mat_truoc-0_2fc82a06b0474f4bb7e31cf892415e7a.jpeg', 'https://product.hstatic.net/1000281824/product/img_4718_869150c252154aaba2f8c0d640db798f.jpeg', 
N'Simili', N'ngang 18.5, rộng 9, cao 13.5cm', N'Logo kim loại'),

('TK014', 'CT002', N'Canvas Bag - TCV', 380000, 'https://product.hstatic.net/1000281824/product/b0126fca-79f3-4230-a436-8bfb87088f31_0c70a0fbfdc147f2afcbbc29d65f24cc.jpeg', 'https://product.hstatic.net/1000281824/product/e9897e66-7815-472a-839f-659522830406_bc0cd61e0f514d2b90104f17426ed02b.jpeg', 'https://product.hstatic.net/1000281824/product/ea464b33-16e9-42b6-830c-f27652a70000_8fdc1b0e23a64869b1d75e26446d7723.jpeg', 
N'Canvas', N'ngang 38cm, cao 40cm, rộng 12cm', N'thêu trực tiếp'),

('TK015', 'CT003', N'Crocodile Leather Basic Balo - CLBB',430000,'https://product.hstatic.net/1000281824/product/lbb_van_da_ed8f0043b76d4cc79437e67b1425d904.png','https://product.hstatic.net/1000281824/product/b969f00c-6869-4bc1-b948-a1f427199e22_dd2fb8224142488a97a6946b6f10500d.jpeg','https://product.hstatic.net/1000281824/product/e3500588-3889-488c-b3b7-6dff19886204_5f8b4954ebd841ad8a4d8ac604cedfa1.jpeg'
, N'Simili',N'thêu trực tiếp',N'40cm X 30cm X 12cm'),

('TK016', 'CT003', N'Leather Basic Balo - LBB',430000,'https://product.hstatic.net/1000281824/product/c39b1fb4b6754c47962405b8fee6fa0c_49eab7d9ab424059ac2ea87b564fd4e8.jpg','https://product.hstatic.net/1000281824/product/z3781359744010_1b2fbbbd6ef76561ffc18f0f68de9d07_8c928045cb914ddfa6dd0eef433a2f11.jpg','https://product.hstatic.net/1000281824/product/z3781359767914_e6ad93b5de5dbb09a9b212be5d820113_e15254eb80ad43e2b8993237ac1bd97b.jpg'
, N'Simili',N'thêu trực tiếp',N'40cm X 30cm X 12cm'),

('TK017', 'CT003', N'Leather Flap Backpack - DLFB', 580000,'https://product.hstatic.net/1000281824/product/bf0fa9b9-dbc8-4ef2-8ec6-7cd4f0a75121_d30663a6153e4caf86627e82c7f1e0b8.jpeg','https://product.hstatic.net/1000281824/product/z4016644286902_3ae7cea9465af6bfe0a6a241fb155847_4961a03e19f34f139cc0639841b0a748.jpg','https://product.hstatic.net/1000281824/product/z4016644284842_57352530ce11238d4974550602fa8bd3_bfb772258a7d49ceb3ac6cf06d00cb28.jpg'
, N'Simili',N'thêu trực tiếp',N'45cm X 30cm X 12cm'),

('TK018', 'CT003', N'Leather Basic Balo Rêu - LBBR', 350000,'https://product.hstatic.net/1000281824/product/2d866695-b448-4f5c-b52b-3401db3098dd_76b9baaa3f14443f82f5b9a69f641062.jpeg','https://product.hstatic.net/1000281824/product/f1825a49-ddbe-492e-b608-f8e9b1218bc5_b6f5da56018c404fa2cdff3e60e01604.jpeg','https://product.hstatic.net/1000281824/product/87a4e803-7c0e-4996-b040-8c52e962830c_2812fc67a4d646ff92642d687d1f3bc2.jpeg'
, N'Simili',N'thêu trực tiếp',N'40cm X 30cm X 12cm'),

('TK019', 'CT003', N' Balo Nắp Basic - NAP', 430000,'https://product.hstatic.net/1000281824/product/9cbf00a55a22438aaaa83aaef59e1927_dd641acca30642e9af77c7ff2df1c491.jpeg','https://product.hstatic.net/1000281824/product/32c81fe22ee24c0f8958312477988fce_ea40b8ecf5cd409a8d235c529de37387.jpeg','https://product.hstatic.net/1000281824/product/img_5289_8f52515a4bb342d48567f89566b7aa9c.jpeg'
, N'Canvas trượt nước',N'logo kim loại',N'ngang 29, rộng 15, cao 41cm '),

('TK020', 'CT003', N'Basic Backpack - BBD', 349000,'https://product.hstatic.net/1000281824/product/bbd_92c990a1e92b4f14aba34207ad27e4e9.gif','https://product.hstatic.net/1000281824/product/cb366bdcf3cd7dea26e298fa02d41473__1__a82f9108cefb46cab95c980b43c036d3.jpeg','https://product.hstatic.net/1000281824/product/8e27bee09f45a7e0e7d84bb08708ad5f__1__6396f575699449e5a8a650c13d830684.jpeg',
N'Canvas pha Poly',N'Được in trực tiếp lên sản phẩm',N'40cm X 30cm X 12cm'),

('TK021', 'CT003', N'Basic Backpack Xám - BBD Xám', 349000,'https://product.hstatic.net/1000281824/product/300_e2b80b862fd2499f858a17736ac4a613.jpg','https://product.hstatic.net/1000281824/product/f9639da2d2edd93aa7aaa6b5ef33ad20_f007b97c0d514ad7aed32a2337c12509.jpeg','https://product.hstatic.net/1000281824/product/83554b0869a08ed7960b8ba75d89c2c9_2815f3f2273b4fd6b74707711ce8a5d4.jpeg'
, N'Canvas pha Poly',N'Được in trực tiếp lên sản phẩm',N'40cm X 30cm X 12cm')

go

insert into Productdetail
values
('TK001', 5, N'S'),  -- Raglan Line Kem Tee Nâu Kem - DRLNAK
('TK001', 5, N'M'),  -- Raglan Line Kem Tee Nâu Kem - DRLNAK
('TK001', 5, N'L'),  -- Raglan Line Kem Tee Nâu Kem - DRLNAK
('TK002', 5, N'S'),  -- Raglan Line Nâu Tee Nâu Kem - DRLNAU
('TK002', 5, N'M'),  -- Raglan Line Nâu Tee Nâu Kem - DRLNAU
('TK002', 5, N'L'),  -- Raglan Line Nâu Tee Nâu Kem - DRLNAU
('TK003', 5, N'S'),  -- Raglan Line Hồng Tee Đen Hồng - DRLHD
('TK003', 5, N'M'),  -- Raglan Line Hồng Tee Đen Hồng - DRLHD
('TK003', 5, N'L'),  -- Raglan Line Hồng Tee Đen Hồng - DRLHD
('TK004', 5, N'S'),  -- Raglan Line Đen Tee Đen Hồng - DRLDH
('TK004', 5, N'M'),  -- Raglan Line Đen Tee Đen Hồng - DRLDH
('TK004', 5, N'L'),  -- Raglan Line Đen Tee Đen Hồng - DRLDH
('TK005', 5, N'S'),  -- Raglan Line Kem Tee Green Kem - DRLKG
('TK005', 5, N'M'),  -- Raglan Line Kem Tee Green Kem - DRLKG
('TK005', 5, N'L'),  -- Raglan Line Kem Tee Green Kem - DRLKG
('TK006', 5, N'S'),  -- Raglan Line Green Tee Green Kem - DRLGK
('TK006', 5, N'M'),  -- Raglan Line Green Tee Green Kem - DRLGK
('TK006', 5, N'L'),  -- Raglan Line Green Tee Green Kem - DRLGK
('TK007', 5, N'S'),  -- Raglan Line Tee Đen - DRLD
('TK007', 5, N'M'),  -- Raglan Line Tee Đen - DRLD
('TK007', 5, N'L'),  --  Raglan Line Tee Đen - DRLD
('TK008', 5, N'23x15x10'), --Crocodile Simili Bag - DCC
('TK009', 5, N'23x15x10'), --Black Coffee Simili Bag - DBC
('TK010', 5, N'23x15x10'), --Coffee Simili Bag - DCSB
('TK011', 5, N'23x15x10'), --Silver Simili Bag - SILV
('TK012', 5, N'23x15x10'), --Crocodile Simili Bag Yellow - DCCY
('TK013', 5, N'ngang 18.5, rộng 9, cao 13.5cm'), --Crocodile Slay Bag - SLAY
('TK014', 5, N'ngang 38cm, cao 40cm, rộng 12cm'), --Canvas Bag - TCV
('TK015', 5, N'40cm X 30cm X 12cm'),  --Crocodile Leather Basic Balo - CLBB
('TK016', 5, N'40cm X 30cm X 12cm'),  --Leather Basic Balo - LBB
('TK017', 5, N'45cm X 30cm X 12cm'),  --Leather Flap Backpack - DLFB
('TK018', 5, N'40cm X 30cm X 12cm'),  --Leather Basic Balo Rêu - LBBR
('TK019', 5, N'40cm X 30cm X 12cm'),  -- Balo Nắp Basic - NAP
('TK020', 5, N'40cm X 30cm X 12cm'),  --Basic Backpack - BBD
('TK021', 5, N'40cm X 30cm X 12cm')   --Basic Backpack Xám - BBD Xám
go

--INSERT INTO Orders 
--VALUES (1,'ID001', '1900-01-01');
--select * from orders
--select * from Orderdetails
----
--delete from Orders 

select * from Productdetail