﻿CREATE DATABASE What_a_burger;
GO

USE What_a_burger;
GO

-- Create the customer and order tables
CREATE TABLE Stores(
  StoreID bigint NOT NULL PRIMARY KEY,
  StoreName varchar(50) NOT NULL,
  State varchar(50) NOT NULL,
  City varchar(50) NOT NULL,
  ZipCode varchar(50) NOT NULL);

CREATE TABLE Employees(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  StoreID bigint NOT NULL,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  JobTitle varchar(50) NOT NULL);

CREATE TABLE Orders(
  OrderID bigint NOT NULL PRIMARY KEY,
  EmployeeID bigint NOT NULL,
  TotalAmount bigint NOT NULL);

CREATE TABLE OrderDetails(
  OrderDetailsID bigint NOT NULL PRIMARY KEY,
  OrderID bigint NOT NULL,
  OrderDate date NOT NULL,
  OrderTime time NOT NULL,
  ItemID bigint NOT NULL,
  OrderQuantity bigint NOT NULL,
  LinePrice bigint NOT NULL);

CREATE TABLE Menu(
  ItemID bigint NOT NULL PRIMARY KEY,
  ItemName bigint NOT NULL,
  CategoryName varchar(50) NOT NULL,
  Size varchar(50) NOT NULL,
  Price bigint NOT NULL);

  -- Create the relationship:
ALTER TABLE Employees ADD CONSTRAINT FK_Employees_Stores 
FOREIGN KEY (StoreID) REFERENCES Stores(StoreID);

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Employees 
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetails_Orders 
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetails_Menu 
FOREIGN KEY (ItemID) REFERENCES Menu(ItemID);
GO

-- Delete Column from Menu and OrderDetails--
ALTER TABLE Menu DROP COLUMN Size;

ALTER TABLE OrderDetails DROP COLUMN OrderTime; 

-- Add Column to OrderDetails and Stores--
ALTER TABLE OrderDetails ADD DayoftheWeek varchar(50);

ALTER TABLE Stores ADD Street varchar(50);

-- ALter --
ALTER TABLE Menu ALTER COLUMN ItemName varchar(50);

ALTER TABLE Orders ALTER COLUMN TotalAmount numeric(10,2);
ALTER TABLE OrderDetails ALTER COLUMN LinePrice numeric (10,2);
ALTER TABLE Menu ALTER COLUMN Price numeric(10,2);

-- Add info to Stores --
INSERT INTO Stores (StoreID, StoreName, State, City, ZipCode, Street) VALUES
(10001, 'Whataburger #115', 'Alabama', 'Chickasaw', '36611', '100 North Craft Highway'),
(10002, 'Whataburger #761', 'Arizona', 'Pheonix', '85040', '4610 S 48th St'),
(10003, 'Whataburger #874', 'Florida', 'Jacksonville', '32216' , '8840 Beach Blvd'),
(10004, 'Whataburger #931', 'Florida', 'Pace', '32571' , '5648 Woodbine Rd'),
(10005, 'Whataburger #1021', 'Louisiana', 'Lafayette', '70508' , '1845 W Pinhook Rd'),
(10006, 'Whataburger #1027', 'Oklahoma', 'Tulsa', '74133' , '10121 S Memorial Dr'),
(10007, 'Whataburger #758', 'Texas', 'Amarillo', '79110' , '6120 Hollywood Rd'),
(10008, 'Whataburger #1024', 'Texas', 'Dallas', '75248' , '15255 Montfort Dr'),
(10009, 'Whataburger #657', 'Texas', 'Dallas', '75234' , '3105 Forest Ln'),
(10010, 'Whataburger #81', 'Texas', 'Galveston', '77551' , '6327 Stewart Rd');

-- Add info to Employees --
INSERT INTO Employees (EmployeeID, StoreID, FirstName, LastName, JobTitle) VALUES
(101, 10001, 'Abby', 'Balony', 'Manager'),
(102, 10001, 'Catherine', 'Dillard', 'Cook'),
(103, 10001, 'Ester', 'Fallon', 'Cook'),
(104, 10001, 'George', 'Harron', 'Cashier'),
(105, 10001, 'Isaiah', 'Jackson', 'Cashier'),
(106, 10002, 'Kevin', 'Larry', 'Manager'),
(107, 10002, 'Mallory', 'Nova', 'Cook'),
(108, 10002, 'Oscar', 'Patillo', 'Cook'),
(109, 10002, 'Quincy', 'Robinson', 'Cashier'),
(110, 10002, 'Susan', 'Tubman', 'Cashier'),
(111, 10003, 'Ulises', 'Villan', 'Manager'),
(112, 10003, 'William', 'Xerox', 'Cook'),
(113, 10003, 'Yun', 'Zeiger', 'Cook'),
(114, 10003, 'Amber', 'Barney', 'Cashier'),
(115, 10003, 'Collin', 'Smith', 'Cashier'),
(116, 10004, 'Taylor', 'Swift', 'Manager'),
(117, 10004, 'Selena', 'Lopez', 'Cook'),
(118, 10004, 'Stephanie', 'Luna', 'Cook'),
(119, 10004, 'Kimberly', 'Palacios', 'Cashier'),
(120, 10004, 'Luis', 'Guerrero', 'Cashier'),
(121, 10005, 'Holly', 'Leung', 'Manager'),
(122, 10005, 'Jessica', 'Villalobos', 'Cook'),
(123, 10005, 'Maria', 'Garcia', 'Cook'),
(124, 10005, 'Hillary', 'Clinton', 'Cashier'),
(125, 10005, 'Barack', 'Obama', 'Cashier'),
(126, 10006, 'Dennis', 'Mendoza', 'Manager'),
(127, 10006, 'Ellis', 'Gray', 'Cook'),
(128, 10006, 'Victoria', 'Cruz', 'Cook'),
(129, 10006, 'Miguel', 'Perez', 'Cashier'),
(130, 10006, 'Osvaldo', 'Lopez', 'Cashier'),
(131, 10007, 'Celine', 'Kennedy', 'Manager'),
(132, 10007, 'Albert', 'Pobee', 'Cook'),
(133, 10007, 'Amber', 'Sow', 'Cook'),
(134, 10007, 'Parker', 'Ohara', 'Cashier'),
(135, 10007, 'Steven', 'Barron', 'Cashier'),
(136, 10008, 'Justin', 'Borden', 'Manager'),
(137, 10008, 'Maria', 'Jefferson', 'Cook'),
(138, 10008, 'Caroline', 'Ferguson', 'Cook'),
(139, 10008, 'William', 'Morgan', 'Cashier'),
(140, 10008, 'Tina', 'Miller', 'Cashier'),
(141, 10009, 'Chris', 'Wilson', 'Manager'),
(142, 10009, 'Gerald', 'Jones', 'Cook'),
(143, 10009, 'Edward', 'Johnson', 'Cook'),
(144, 10009, 'Beatrice', 'White', 'Cashier'),
(145, 10009, 'Nicole', 'Simpson', 'Cashier'),
(146, 10010, 'Anthony', 'Richardson', 'Manager'),
(147, 10010, 'Carmen', 'Ngo', 'Cook'),
(148, 10010, 'Anna', 'Smith', 'Cook'),
(149, 10010, 'Luis', 'Toledo', 'Cashier'),
(150, 10010, 'Lizbeth', 'Nava', 'Cashier');

-- Add info to Orders --
INSERT INTO Orders (OrderID, EmployeeID, TotalAmount) VALUES
(700, 101, 37.61),
(701, 104, 49.12),
(702, 105, 30.25),
(703, 106, 36.71),
(704, 109, 45.35),
(705, 110, 4.90),
(706, 111, 16.45),
(707, 114, 27.92),
(708, 115, 1.93),
(709, 116, 23.71),
(710, 119, 3.09),
(711, 120, 10.77),
(712, 121, 25.80),
(713, 124, 21.35),
(714, 125, 52.28),
(715, 126, 7.58),
(716, 129, 11.37),
(717, 130, 9.55),
(718, 131, 21.30),
(719, 109, 11.61),
(720, 110, 30.32),
(721, 111, 12.27),
(722, 114, 17.34),
(723, 104, 14.66),
(724, 105, 17.44),
(725, 150, 5.16),
(726, 131, 30.43),
(727, 109, 8.38),
(728, 110, 55.29),
(729, 149, 17.47),
(730, 119, 27.54),
(731, 120, 4.18),
(732, 121, 7.58),
(733, 124, 13.14),
(734, 111, 18.72),
(735, 114, 6.43),
(736, 115, 6.27),
(737, 116, 24.54),
(738, 101, 12.22),
(739, 104, 2.58),
(740, 105, 2.97),
(741, 106, 13.66),
(742, 150, 11.27),
(743, 135, 2.09),
(744, 136, 21.85),
(745, 139, 1.47),
(746, 140, 3.87),
(747, 141, 25.32),
(748, 144, 9.18),
(749, 145, 6.09),
(750, 146, 27.00),
(751, 134, 13.83),
(752, 135, 8.57),
(753, 136, 18.87),
(754, 139, 0.49),
(755, 144, 2.97),
(756, 145, 5.76),
(757, 134, 18.05),
(758, 135, 13.77),
(759, 136, 17.36),
(760, 139, 12.52),
(761, 105, 9.38),
(762, 106, 18.36),
(763, 134, 27.87),
(764, 135, 5.16),
(765, 136, 7.02),
(766, 139, 15.53),
(767, 140, 12.36),
(768, 141, 10.16),
(769, 144, 3.87),
(770, 145, 8.18),
(771, 119, 1.29),
(772, 120, 5.58),
(773, 121, 11.60),
(774, 124, 9.81),
(775, 111, 9.18),
(776, 114, 12.27),
(777, 115, 8.48),
(778, 106, 1.98);

-- Add info to OrderDetails --
INSERT INTO OrderDetails (OrderDetailsID, OrderID, OrderDate, ItemID, OrderQuantity, LinePrice, DayoftheWeek) VALUES
(1,	700, '2018-02-01', 1, 2, 6.18, 'Thursday'),
(2, 700, '2018-02-01', 6, 2, 4.18, 'Thursday'),
(3,	700, '2018-02-01', 12, 1, 0.49, 'Thursday'),
(4,	700, '2018-02-01', 19, 3, 7.02, 'Thursday'),
(5,	700, '2018-02-01', 14, 1, 0.99, 'Thursday'),
(6,	700, '2018-02-01', 7, 1, 2.39, 'Thursday'),
(7,	700, '2018-02-01', 3, 4, 16.36, 'Thursday'),
(8,	701, '2018-02-01', 2, 2, 9.18, 'Thursday'),
(9, 701, '2018-02-01', 13, 3, 27.87, 'Thursday'),
(10, 701, '2018-02-01', 17, 4, 5.16, 'Thursday'),
(11, 701, '2018-02-01', 18, 1, 2.32, 'Thursday'),
(12, 701, '2018-02-01', 4, 1, 4.59, 'Thursday'),
(13, 702, '2018-02-02', 9, 1, 4.04, 'Friday'),
(14, 702, '2018-02-02', 10, 2, 1.98, 'Friday'),
(15, 702, '2018-02-02', 17, 3, 3.87, 'Friday'),
(16, 702, '2018-02-02', 3, 2, 8.18, 'Friday'),
(17, 702, '2018-02-02', 5, 2, 12.18, 'Friday'),
(18, 703, '2018-02-02', 7, 1, 2.39, 'Friday'),
(19, 703, '2018-02-02', 8, 4, 25.16, 'Friday'),
(20, 703, '2018-02-02', 18, 1, 2.32, 'Friday'),
(21, 703, '2018-02-02', 11, 1, 0.99, 'Friday'),
(22, 703, '2018-02-02', 16, 2, 2.88, 'Friday'),
(23, 703, '2018-02-02', 10, 3, 2.97, 'Friday'),
(24, 704, '2018-02-02', 19, 4, 9.36, 'Friday'),
(25, 704, '2018-02-02', 20, 4, 5.16, 'Friday'),
(26, 704, '2018-02-02', 2, 4, 18.36, 'Friday'),
(27, 704, '2018-02-02', 4, 2, 9.18, 'Friday'),
(28, 704, '2018-02-02', 15, 1, 1.29, 'Friday'),
(29, 705, '2018-02-03', 18, 1, 2.32, 'Saturday'),
(30, 705, '2018-02-03', 20, 2, 2.58, 'Saturday'),
(31, 706, '2018-02-03', 3, 3, 12.27, 'Saturday'),
(32, 706, '2018-02-03', 6, 2, 4.18, 'Saturday'),
(33, 707, '2018-02-03', 7, 4, 9.56, 'Saturday'),
(34, 707, '2018-02-03', 2, 4, 18.36, 'Saturday'),
(35, 708, '2018-02-05', 12, 1, 0.49, 'Monday'),
(36, 708, '2018-02-05', 16, 1, 1.44, 'Monday'),
(37, 709, '2018-02-05', 19, 2, 4.68, 'Monday'),
(38, 709, '2018-02-05', 3, 3, 12.27, 'Monday'),
(39, 709, '2018-02-05', 20, 2, 2.58, 'Monday'),
(40, 709, '2018-02-05', 6, 2, 4.18, 'Monday'),
(41, 710, '2018-02-06', 1, 1, 3.09, 'Tuesday'),
(42, 711, '2018-02-06', 3, 1, 4.09, 'Tuesday'),
(43, 711, '2018-02-06', 2, 1, 4.59, 'Tuesday'),
(44, 711, '2018-02-06', 6, 1, 2.09, 'Tuesday'),
(45, 712, '2018-02-07', 18, 2, 4.64, 'Wednesday'),
(46, 712, '2018-02-07', 15, 2, 2.58, 'Wednesday'),
(47, 712, '2018-02-07', 13, 2, 18.58, 'Wednesday'),
(48, 713, '2018-02-07', 9, 3, 12.12, 'Wednesday'),
(49, 713, '2018-02-07', 18, 2, 4.64, 'Wednesday'),
(50, 713, '2018-02-07', 2, 1, 4.59, 'Wednesday'),
(51, 714, '2018-02-08', 5, 4, 24.36, 'Thursday'),
(52, 714, '2018-02-08', 7, 4, 9.56, 'Thursday'),
(53, 714, '2018-02-08', 4, 4, 18.36, 'Thursday'),
(54, 715, '2018-02-09', 8, 1, 6.29, 'Friday'),
(55, 715, '2018-02-09', 17, 1, 1.29, 'Friday'),
(56, 716, '2018-02-09', 3, 1, 4.09, 'Friday'),
(57, 716, '2018-02-09', 14, 1, 0.99, 'Friday'),
(58, 716, '2018-02-09', 8, 1, 6.29, 'Friday'),
(59, 717, '2018-02-09', 12, 3, 1.47, 'Friday'),
(60, 717, '2018-02-09', 9, 2, 8.08, 'Friday'),
(61, 718, '2018-02-09', 15, 4, 5.16, 'Friday'),
(62, 718, '2018-02-09', 3, 3, 12.27, 'Friday'),
(63, 718, '2018-02-09', 17, 3, 3.87, 'Friday'),
(64, 719, '2018-02-10', 2, 1, 4.59, 'Saturday'),
(65, 719, '2018-02-10', 19, 3, 7.02, 'Saturday'),
(66, 720, '2018-02-10', 8, 4, 25.16, 'Saturday'),
(67, 720, '2018-02-10', 15, 4, 5.16, 'Saturday'),
(68, 721, '2018-02-10', 3, 3, 12.27, 'Saturday'),
(69, 722, '2018-02-10', 14, 2, 1.98, 'Saturday'),
(70, 722, '2018-02-10', 1, 2, 6.18, 'Saturday'),
(71, 722, '2018-02-10', 2, 2, 9.18, 'Saturday'),
(72, 723, '2018-02-10', 7, 1, 2.39, 'Saturday'),
(73, 723, '2018-02-10', 3, 3, 12.27, 'Saturday'),
(74, 724, '2018-02-10', 9, 2, 8.08, 'Saturday'),
(75, 724, '2018-02-10', 19, 4, 9.36, 'Saturday'),
(76, 725, '2018-02-11', 20, 4, 5.16, 'Sunday'),
(77, 726, '2018-02-11', 5, 4, 24.36, 'Sunday'),
(78, 726, '2018-02-11', 14, 2, 1.98, 'Sunday'),
(79, 726, '2018-02-11', 3, 1, 4.09, 'Sunday'),
(80, 727, '2018-02-12', 8, 1, 6.29, 'Monday'),
(81, 727, '2018-02-12', 6, 1, 2.09, 'Monday'),
(82, 728, '2018-02-12', 17, 5, 6.45, 'Monday'),
(83, 728, '2018-02-12', 4, 5, 22.95, 'Monday'),
(84, 728, '2018-02-12', 9, 3, 12.12, 'Monday'),
(85, 728, '2018-02-12', 2, 3, 13.77, 'Monday'),
(86, 729, '2018-02-12', 3, 2, 8.18, 'Monday'),
(87, 729, '2018-02-12', 13, 1, 9.29, 'Monday'),
(88, 730, '2018-02-13', 4, 3, 13.77, 'Tuesday'),
(89, 730, '2018-02-13', 2, 3, 13.77, 'Tuesday'),
(90, 731, '2018-02-13', 6, 2, 4.18, 'Tuesday'),
(91, 732, '2018-02-14', 8, 1, 6.29, 'Wednesday'),
(92, 732, '2018-02-14', 17, 1, 1.29, 'Wednesday'),
(93, 733, '2018-02-14', 19, 2, 4.68, 'Wednesday'),
(94, 733, '2018-02-14', 20, 3, 3.87, 'Wednesday'),
(95, 733, '2018-02-14', 4, 1, 4.59, 'Wednesday'),
(96, 734, '2018-02-15', 14, 4, 3.96, 'Thursday'),
(97, 734, '2018-02-15', 5, 2, 12.18, 'Thursday'),
(98, 734, '2018-02-15', 17, 2, 2.58, 'Thursday'),
(99, 735, '2018-02-15', 3, 1, 4.09, 'Thursday'),
(100, 735, '2018-02-15', 19, 1, 2.34, 'Thursday'),
(101, 736, '2018-02-16', 6, 3, 6.27, 'Friday'),
(102, 737, '2018-02-16', 2, 2, 9.18, 'Friday'),
(103, 737, '2018-02-16', 4, 2, 9.18, 'Friday'),
(104, 737, '2018-02-16', 1, 2, 6.18, 'Friday'),
(105, 738, '2018-02-16', 9, 1, 4.04, 'Friday'),
(106, 738, '2018-02-16', 3, 2, 8.18, 'Friday'),
(107, 739, '2018-02-16', 17, 2, 2.58, 'Friday'),
(108, 740, '2018-02-16', 14, 3, 2.97, 'Friday'),
(109, 741, '2018-02-17', 19, 5, 11.70, 'Saturday'),
(110, 741, '2018-02-17', 12, 4, 1.96, 'Saturday'),
(111, 742, '2018-02-17', 11, 2, 1.98, 'Saturday'),
(112, 742, '2018-02-17', 13, 1, 9.29, 'Saturday'),
(113, 743, '2018-02-17', 6, 1, 2.09, 'Saturday'),
(114, 744, '2018-02-17', 2, 3, 13.77, 'Saturday'),
(115, 744, '2018-02-17', 9, 2, 8.08, 'Saturday'),
(116, 745, '2018-02-17', 12, 3, 1.47, 'Saturday'),
(117, 746, '2018-02-17', 15, 2, 2.58, 'Saturday'),
(118, 746, '2018-02-17', 17, 1, 1.29, 'Saturday'),
(119, 747, '2018-02-17', 18, 3, 6.96, 'Saturday'),
(120, 747, '2018-02-17', 2, 4, 18.36, 'Saturday'),
(121, 748, '2018-02-17', 4, 2, 9.18, 'Saturday'),
(122, 749, '2018-02-18', 5, 1, 6.09, 'Sunday'),
(123, 750, '2018-02-18', 8, 3, 18.87, 'Sunday'),
(124, 750, '2018-02-18', 3, 1, 4.09, 'Sunday'),
(125, 750, '2018-02-18', 9, 1, 4.04, 'Sunday'),
(126, 751, '2018-02-19', 1, 4, 12.36, 'Monday'),
(127, 751, '2018-02-19', 12, 3, 1.47, 'Monday'),
(128, 752, '2018-02-19', 1, 2, 6.18, 'Monday'),
(129, 752, '2018-02-19', 7, 1, 2.39, 'Monday'),
(130, 753, '2018-02-20', 8, 3, 18.87,'Tuesday'),
(131, 754, '2018-02-20', 12, 1, 0.49, 'Tuesday'),
(132, 755, '2018-02-21', 14, 3, 2.97, 'Wednesday'),
(133, 756, '2018-02-21', 16, 4, 5.76, 'Wednesday'),
(134, 757, '2018-02-22', 18, 5, 11.60, 'Thursday'),
(135, 757, '2018-02-22', 20, 5, 6.45, 'Thursday'),
(136, 758, '2018-02-22', 2, 3, 13.77, 'Thursday'),
(137, 759, '2018-02-22', 3, 2, 8.18, 'Thursday'),
(138, 759, '2018-02-22', 4, 2, 9.18, 'Thursday'),
(139, 760, '2018-02-23', 7, 1, 2.39, 'Friday'),
(140, 760, '2018-02-23', 9, 1, 4.04, 'Friday'),
(141, 760, '2018-02-23', 5, 1, 6.09, 'Friday'),
(142, 761, '2018-02-23', 8, 1, 6.29, 'Friday'),
(143, 761, '2018-02-23', 1, 1, 3.09, 'Friday'),
(144, 762, '2018-02-23', 2, 4, 18.36, 'Friday'),
(145, 763, '2018-02-23', 13, 3, 27.87, 'Friday'),
(146, 764, '2018-02-23', 15, 2, 2.58, 'Friday'),
(147, 764, '2018-02-23', 17, 2, 2.58, 'Friday'),
(148, 765, '2018-02-23', 19, 3, 7.02, 'Friday'),
(149, 766, '2018-02-24', 20, 2, 2.58, 'Saturday'),
(150, 766, '2018-02-24', 4, 1, 4.59, 'Saturday'),
(151, 766, '2018-02-24', 6, 4, 8.36, 'Saturday'),
(152, 767, '2018-02-24', 1, 4, 12.36, 'Saturday'),
(153, 768, '2018-02-24', 12, 2, 0.98, 'Saturday'),
(154, 768, '2018-02-24', 2, 2, 9.18, 'Saturday'),
(155, 769, '2018-02-24', 15, 3, 3.87, 'Saturday'),
(156, 770, '2018-02-24', 3, 2, 8.18, 'Saturday'),
(157, 771, '2018-02-25', 17, 1, 1.29, 'Sunday'),
(158, 772, '2018-02-25', 4, 1, 4.59, 'Sunday'),
(159, 772, '2018-02-25', 10, 1, 0.99, 'Sunday'),
(160, 773, '2018-02-26', 18, 5, 11.60, 'Monday'),
(161, 774, '2018-02-26', 10, 3, 2.97, 'Monday'),
(162, 774, '2018-02-26', 15, 3, 3.87, 'Monday'),
(163, 774, '2018-02-26', 14, 3, 2.97, 'Monday'),
(164, 775, '2018-02-27', 2, 2, 9.18, 'Tuesday'),
(165, 776, '2018-02-28', 3, 3, 12.27, 'Wednesday'),
(166, 777, '2018-02-28', 7, 1, 2.39, 'Wednesday'),
(167, 777, '2018-02-28', 5, 1, 6.09, 'Wednesday'),
(168, 778, '2018-02-28', 11, 2, 1.98, 'Wednesday');

-- Add info to Menu --
INSERT INTO Menu (ItemID, ItemName, CategoryName, Price) VALUES
(1, 'Whataburger', 'Burgers', 3.09),
(2, 'Double Meat Whataburger', 'Burgers', 4.59),
(3, 'Jalapeno & Cheese Whataburger', 'Burgers', 4.09),
(4, 'Bacon & Cheese Whataburger', 'Burgers', 4.59),
(5, 'Triple Meat Whataburger', 'Burgers', 6.09),
(6, 'French Fries', 'Side', 2.09),
(7, 'Onion Rings', 'Side', 2.39),
(8, 'Apple & Cranberry Chicken Salad', 'Salad', 6.29),
(9, 'Garden Salad', 'Salad', 4.04),
(10, 'Hot Apple Pie', 'Dessert', 0.99),
(11, 'Hot Lemon Pie', 'Dessert', 0.99),
(12, 'Fruit Chews', 'Dessert', 0.49),
(13, 'Cinnamon Roll', 'Dessert', 9.29),
(14, 'Cookies', 'Dessert', 0.99),
(15, 'Coke', 'Drinks', 1.29),
(16, 'Coffee', 'Drinks', 1.44),
(17, 'Tea', 'Drinks', 1.29),
(18, 'Vanilla Shakes', 'Drinks', 2.32),
(19, 'Malts', 'Drinks', 2.34),
(20, 'Milk', 'Drinks', 1.29);
