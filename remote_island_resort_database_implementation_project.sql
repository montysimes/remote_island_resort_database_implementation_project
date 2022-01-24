-- SECTION-ONE

-- Task 1 
/* Create	 these	 tables	 based	 on	 the	 schema	 provided:	 VillaType,	 Villa,	 Villa_Reservation,	
Reservation,	Payment	and	Customer.
Insert	at	least	5	records	into each	of	the	tables.	 */

-- Table creation
create table villatype(
VillaTypeID char (2),
VillaTypeName varchar(50),
primary key (VillaTypeID)
);

create table villa(
VillaID char (3),
VillaName varchar (50), 
VillaCostPerDay decimal (6,2),
VillaTypeID varchar(50),
primary key (VillaID),
foreign key (VillaTypeID) references villatype(VillaTypeID)
);

create table customer(
CustomerID char (4),
CustomerName varchar (50),
CustomerPhNum char (12),
primary key (CustomerID)
);

create table reservation (
ReservationID char (4),
ReservationDate date,
CustomerID char (4),
primary key (ReservationID),
foreign key (CustomerID) references customer(CustomerID)
);

create table villa_reservation(
ReservationID char (4),
VillaID char (3), 
DateFrom date,
DateTo date,
primary key (ReservationID, VillaID),
foreign key (ReservationID) references reservation(ReservationID),
foreign key (VillaID) references villa(VillaID)
); 

create table payment(
PaymentID char (4),
ReservationID char (4),
PaymentDate date,
PaymentAmount decimal (9,2),
primary key (PaymentID),
foreign key (ReservationID) references reservation(ReservationID)
);

-- Data Insertion
-- villatype data
insert into villatype values ('T1', 'studio sea view');
insert into villatype values ('T2', 'studio jungle view');
insert into villatype values ('T3', 'one-bedroom sea view');
insert into villatype values ('T4', 'one-bedroom jungle view');
insert into villatype values ('T5', 'two-bedroom sea view');
insert into villatype values ('T6', 'two-bedroom sea view with spa');
insert into villatype values ('T7', 'two-bedroom jungle view');


-- villa data
insert into villa values ('V01', 'New York', '750.00', 'T1');
insert into villa values ('V02', 'San Fran', '590.00', 'T1');
insert into villa values ('V03', 'Chicago', '685.50', 'T2');
insert into villa values ('V04', 'Seattle', '350.00', 'T2');
insert into villa values ('V05', 'Philadelphia', '1150.00', 'T3');
insert into villa values ('V06', 'Boston', '1650.00', 'T4');
insert into villa values ('V07', 'Detroit', '1345.50', 'T4');
insert into villa values ('V08', 'Baltimore', '1650.85', 'T4');
insert into villa values ('V09', 'Houston', '2245.50', 'T6');
insert into villa values ('V10', 'L.A.', '255.75', 'T1');
insert into villa values ('V11', 'Phoenix', '1450.55', 'T5');
insert into villa values ('V12', 'Portland', '685.50', 'T2');
insert into villa values ('V13', 'Austin', '2200.50', 'T6');
insert into villa values ('V14', 'Denver', '1150.00', 'T7');
insert into villa values ('V15', 'Dallas', '1850.90', 'T5');

-- customer data 
insert into customer values ('C284', 'Eli Parks', '0496 022 198'); 
insert into customer values ('C853', 'Reina Leblanc', '0411 208 956'); 
insert into customer values ('C458', 'Tori Combs', '0479 179 818'); 
insert into customer values ('C569', 'Abbigail Valencia', '0401 516 271'); 
insert into customer values ('C578', 'Chad Hahn', '0408 956 204'); 
insert into customer values ('C121', 'Gabriela Jordan', '0483 814 989'); 
insert into customer values ('C606', 'Alaina Colon', '0488 186 137'); 
insert into customer values ('C024', 'Darwin Jenkins', '0409 767 412'); 
insert into customer values ('C646', 'Tucker Levine','0419 298 107'); 
insert into customer values ('C694', 'Geovanni Delacruz', '0418 904 917'); 

-- reservation data
insert into reservation values ('R200', '2017-01-17', 'C646');
insert into reservation values ('R887', '2017-05-22', 'C024');
insert into reservation values ('R503', '2018-06-05', 'C606');
insert into reservation values ('R856', '2018-09-27', 'C284');
insert into reservation values ('R958', '2019-01-10', 'C853');
insert into reservation values ('R765', '2019-05-22', 'C694');
insert into reservation values ('R046', '2019-10-12', 'C121');
insert into reservation values ('R884', '2020-03-02', 'C569');
insert into reservation values ('R606', '2020-06-24', 'C458');
insert into reservation values ('R781', '2020-07-19', 'C578');

-- villa_reservation data
insert into villa_reservation values ('R200', 'V13', '2017-01-22', '2017-02-05');
insert into villa_reservation values ('R887', 'V10', '2017-07-15', '2017-07-18');
insert into villa_reservation values ('R503', 'V01', '2018-06-20', '2018-06-25');
insert into villa_reservation values ('R503', 'V04', '2018-06-20', '2018-06-25');
insert into villa_reservation values ('R503', 'V15', '2018-06-20', '2018-06-25');
insert into villa_reservation values ('R856', 'V11', '2018-10-03', '2018-10-26');
insert into villa_reservation values ('R958', 'V07', '2019-01-19', '2019-01-23');
insert into villa_reservation values ('R958', 'V06', '2019-01-19', '2019-01-23');
insert into villa_reservation values ('R765', 'V09', '2019-06-05', '2019-06-28');
insert into villa_reservation values ('R046', 'V12', '2019-10-12', '2019-10-13');
insert into villa_reservation values ('R046', 'V05', '2019-10-12', '2019-10-13');
insert into villa_reservation values ('R884', 'V08', '2020-03-04', '2020-03-05');
insert into villa_reservation values ('R606', 'V03', '2020-06-26', '2020-07-03');
insert into villa_reservation values ('R781', 'V07', '2020-07-20', '2020-07-22');

-- payment data
insert into payment values ('P355', 'R200', '2017-02-05', '25807.00');
insert into payment values ('P698', 'R200', '2017-02-09', '5000.00');
insert into payment values ('P015', 'R887', '2017-07-18', '767.25');
insert into payment values ('P879', 'R503', '2018-06-25', '14754.50');
insert into payment values ('P635', 'R958', '2019-01-23', '5382.00');
insert into payment values ('P933', 'R958', '2019-01-24', '6600.00');
insert into payment values ('P391', 'R765', '2019-06-28', '25000.00');
insert into payment values ('P223', 'R765', '2019-07-05', '26646.50');
insert into payment values ('P627', 'R046', '2019-10-13', '1835.50');
insert into payment values ('P791', 'R884', '2020-03-05', '1650.85');
insert into payment values ('P592', 'R606', '2020-06-26', '4798.50');

-- Task 2
/*Write	a	query	to	print	all the details	(ID,	Name,	Cost)	of	the	villa.	Note	that	the	cost	must	
be	prefixed with	a	'$'	sign.	Sort	the	records	in	order	of	price	with	the	most	expensive	villa	
at	the	top	of	the	list. */

select VillaID 'Villa ID', VillaName 'Villa Name', concat('$ ',VillaCostPerDay) 'Cost Per Night'
from villa
order by VillaCostPerDay desc;

-- Task 3

/* Write	a	query	to	print	the	reservation	details	(VillaID,	check	in	and	out	dates,	along	with	
the	number	of	days)	that	each	of	the	villas	in	the	reservation	are	reserved for.*/

select VillaID 'Villa ID', DateFrom 'Check-In' , DateTo 'Check-Out', 
datediff(DateTo,DateFrom) 'Length of Stay (Days)'
from villa_reservation;

-- Task 4
/*Write	a	query	to	print	the	all	details	(Name,	Cost)	of	the	villa	if	they	are	two-bedroom
villas.	You	will	need	to	have	the	phrase	‘two-bedroom’	in	the	description	of	villa	type.*/

select VillaName 'Villa Name', concat('$ ', VillaCostPerDay) 'Villa Cost per Night'
from villa
where VillaTypeID in (
	select VillaTypeID
	from villatype
    where VillaTypeName like ('%two-bedroom%')
    );
    
-- Task 5
/* Write	a	query	 to	print	 the	ReservationID if	 the	reservation	was	paid	 for	within	5	days	
from	the	date	of	reservation.	Please	ensure	no	duplicate	results	are	included.*/

select distinct p.ReservationID
from payment p, reservation r
where p.ReservationID = r.ReservationID
and datediff(p.PaymentDate,r.ReservationDate) < 5;

-- Task 6
/*Using	 a	 subquery,	 print	 Customer	 names	 and	 phone	 numbers,	 if	 they	 have	 made	 a	
reservation	(reservation	date) within	the	last	6	months	calculated	from	today */

select CustomerName 'Customer Name', CustomerPhNum 'Phone Number'
from customer
where CustomerID in (
	select CustomerID
    from reservation
    where timestampdiff(month, ReservationDate, curdate()) < 6
    );

-- Task 7
/*Rewrite	Task	6	using	a	Join. */

Select c.CustomerName 'Customer Name', c.CustomerPhNum 'Phone Number'
from customer c join reservation r
on c.CustomerID = r.CustomerID
where timestampdiff(month, r.ReservationDate, curdate()) < 6;

-- Task 8
/*Write	a	query	to	print	all	the	names	of	customers	who	have	booked	villas	that	costs	less	
than	$1000	per	day.	Please	ensure	no	duplicate	results	are	included	in	the	result. */

select distinct c.CustomerName 'Customer Name'
from customer c, reservation r, villa_reservation vr, villa v
where c.CustomerID = r.CustomerID
and r.ReservationID = vr.ReservationID
and vr.VillaID = v.VillaID
and v.VillaCostPerDay < 1000;

-- Task 9
/*Write	 a	 query	 to	 print	 the	 total	 amount	 of	 payments that	 have	 been	 made	 for	 each	
reservation.	Sort	 the	 records	in	 order	 of	the	 total	payments made with	 the	most	paid	
reservations at	the	top	of	the	list. */

select ReservationID 'Reservation ID', 
concat('$ ',cast(sum(PaymentAmount) as decimal (8,2))) 'Total Paid'
from payment
group by ReservationID
order by sum(PaymentAmount) desc; 

-- Task 10
/*Write	a	query	to	print	the	reservation	details	(ID,	Date)	along	with	the	number	of	villas	
that	have	been	booked	for	each	reservation,	but	only	show	the	reservation	details	if	the	
number	of	villas	reserved	are	more	than	one. */

select r.ReservationID 'Reservation ID', r.ReservationDate 'Reservation Date', 
count(vr.ReservationID) 'No. Villas Booked'
from reservation r, villa_reservation vr
where r.ReservationID = vr.ReservationID
group by vr.ReservationID
having count(vr.ReservationID) > 1;

-- Task 11
/*Write	a	query	to	print	the	details	of	all	villas	which	have	never	been	booked */

select v.*
from villa v left join villa_reservation vr
on v.VillaID = vr.VillaID
where vr.ReservationID is null;

-- Task 12
/* Write	a	query	to	print	the	details	of	any	payment	that	is	more	$1500.	Only	include	the	
payments	that	have	been	made	in	either	January	of	any	year	or	in	any	months	in	the	year	
of	2020	or	the	year	of	2018.		Sort	the	results	by	payment	amount	in	descending	order.
*/

select *
from payment
where PaymentAmount > 1500
and (month(PaymentDate) = 1 
	or year(PaymentDate) in (2018, 2020))
order by PaymentAmount desc;

-- Task 13
/*Write	a	query	to	print	the	details	of	any	payment	that	has	been	made	on	a	reservation	of	
a one-bedroom	villa	by	a	customer	whose	surname	begins	with	J.	 */

select p.*
from payment p, reservation r, villa_reservation vr, villa v, villatype vt, customer c
where c.CustomerID = r.CustomerID
and p.ReservationID = r.ReservationID
and r.ReservationID = vr.ReservationID
and vr.VillaID = v.VillaID
and v.VillaTypeID = vt.VillaTypeID
and vt.VillaTypeName like '%one-bedroom%'
and c.CustomerName like '% J%';

-- SECTION-TWO

/* Insert table creation and data for populating the tables */
create table activity(
ActivityID char (3),
ActivityName varchar (50),
ActivityCost decimal (5,2),
ActivityType enum ('I', 'O', 'B'),
primary key (ActivityID)
);

create table staff(
StaffID char (2),
StaffName varchar (50),
ManagerID char (2),
primary key (StaffID),
foreign key (ManagerID) references staff(StaffID)
);

create table activitybooking(
ActivityID char (3),
ReservationID char (4),
ActivityTime datetime,
NumPeople int (1),
GuideID char (2),
primary key (ActivityID, ReservationID, ActivityTime),
foreign key (ActivityID) references activity(ActivityID),
foreign key (ReservationID) references reservation(ReservationID),
foreign key (GuideID) references staff(StaffID)
);

-- activity data 
insert into activity values ('A01', 'Water Skiiing', '125.50', 'O');
insert into activity values ('A02', 'Golf', '85.00', 'O');
insert into activity values ('A03', 'Paddle boarding', '185.50', 'O');
insert into activity values ('A04', 'Spa treatment', '285.50', 'I');
insert into activity values ('A05', 'Yoga', '65.75', 'I');
insert into activity values ('A06', 'Wave Pool', '45.00', 'I');
insert into activity values ('A07', 'Bowling', '12.50', 'I');
insert into activity values ('A08', 'Package-1', '245.50', 'B');
insert into activity values ('A09', 'Package-2', '100.00', 'B');

-- staff data
insert into staff values ('S1', 'Ina Lowe', null);
insert into staff values ('S2', 'Acacia Dyer', 'S1');
insert into staff values ('S3', 'Amy Pender', 'S1');
insert into staff values ('S4', 'Quinten Burnham', null);
insert into staff values ('S5', 'Norm Hyland', 'S4');
insert into staff values ('S7', 'Nate Blackwood', null);
insert into staff values ('S6', 'Katharyn Kirby', 'S7');
insert into staff values ('S8', 'Minerva Rey', null);
insert into staff values ('S9', 'Jolene George', 'S4');

-- activitybooking data
insert into activitybooking values ('A03', 'R200', '2017-01-25 13:30', '3', 'S4');
insert into activitybooking values ('A05', 'R503', '2018-06-21 09:30', '2', 'S1');
insert into activitybooking values ('A09', 'R958', '2019-01-20 13:00', '4', null);
insert into activitybooking values ('A04', 'R958', '2019-01-20 10:00', '2', 'S8');
insert into activitybooking values ('A07', 'R046', '2019-10-12 15:00', '4', null);
insert into activitybooking values ('A08', 'R606', '2020-06-29 09:00', '2', 'S1');
insert into activitybooking values ('A01', 'R781', '2020-07-21 08:30', '1', 'S4');

-- Task 14
/*Write	a	query	to	print	the	ReservationID and	the	total	amount	that	it	has	costed	(Cost	of	
villa	per	night	*	number	of	days	it	has	been	reserved	for).	Only	include	reservations	that	
exceed	a	total	amount	of	$10,000. */

select vr.ReservationID 'Reservation ID', 
concat('$ ',cast(sum((datediff(vr.DateTo,vr.DateFrom)*v.VillaCostPerDay)) as decimal (9,2))) 
'Total Cost of Villas'
from villa_reservation vr, villa v
where vr.VillaID = v.VillaID
group by vr.ReservationID
having sum((datediff(vr.DateTo,vr.DateFrom)*v.VillaCostPerDay)) > 10000;

-- Task 15
/*Write	a	query	to	print	the	names	of	the	customers	who	have	made	bookings	of	outdoor	
activities	those	of	which	have	a	cost	that	is	strictly	less	than	the	average	cost	of	outdoor	
activities.	The	average	should	include	both	outdoor	and	package	activities. */

select distinct c.CustomerName 'Customer Name'
from customer c, reservation r, activitybooking ab, activity a
where c.CustomerID = r.CustomerID
and r.ReservationID = ab.ReservationID
and ab.ActivityID = a.ActivityID
and a.ActivityType in ('O')
and a.ActivityCost < (
	select avg(ActivityCost) 
	from activity 
	where ActivityType in ('O', 'B')
    or ActivityName like '%Package%');

-- SECTION-THREE

/* Insert table creation and data for populating the tables */
create table supportstaff(
RosterID char (5),
ActivityID char (3),
ReservationID char (4),
ActivityTime datetime,
StaffID char (2),
HoursNeeded int (1),
primary key (RosterID),
foreign key (ActivityID, ReservationID, ActivityTime) references 
activitybooking(ActivityID, ReservationID, ActivityTime),
foreign key (StaffID) references staff(StaffID)
);

-- supportstaff data 
insert into supportstaff values ('R1532', 'A03', 'R200', '2017-01-25 13:30', 'S4', '2');
insert into supportstaff values ('R3225', 'A05', 'R503', '2018-06-21 09:30', 'S1', '2');
insert into supportstaff values ('R5771', 'A05', 'R503', '2018-06-21 09:30', 'S3', '1');
insert into supportstaff values ('R6454', 'A09', 'R958', '2019-01-20 13:00', 'S9', '4');
insert into supportstaff values ('R2700', 'A09', 'R958', '2019-01-20 13:00', 'S6', '2');
insert into supportstaff values ('R0261', 'A04', 'R958', '2019-01-20 10:00', 'S8', '4');
insert into supportstaff values ('R4573', 'A07', 'R046', '2019-10-12 15:00', 'S6', '2');
insert into supportstaff values ('R3656', 'A08', 'R606', '2020-06-29 09:00', 'S1', '2');
insert into supportstaff values ('R4630', 'A08', 'R606', '2020-06-29 09:00', 'S3', '2');
insert into supportstaff values ('R1635', 'A01', 'R781', '2020-07-21 08:30', 'S4', '1');

-- Task 16
/*Write	a	query	to	print	the	names	of	the	customers	and	all	the	activities	they	have	booked	
in	the	afternoon	(after	mid-day and	before	4pm)	along	with	the	names	of	the	guides.	Only	
include	guides	who	are	Managers. */

select c.CustomerName 'Customer Name', a.ActivityName 'Activity between 12pm and 4pm', 
s.StaffName 'Guide Name'
from customer c, reservation r, activitybooking ab, staff s, activity a
where c.CustomerID = r.CustomerID
and r.ReservationID = ab.ReservationID
and ab.ActivityID = a.ActivityID
and s.StaffID = ab.GuideID
and time(ab.ActivityTime) between '12:00' and '16:00'
and ab.GuideID in (
	select ManagerID
    from staff);
		
-- Task 17
/*Write	a	query	to	print	the names	of	Staff	and	their	managers,	only	if	the	managers	manage	
2	staff	or	more	 */

select s1.StaffName 'Staff Name', s2.StaffName 'Manager Name'
from staff s1, staff s2
where s1.ManagerID = s2.StaffID
and s1.ManagerID in
(select ManagerID
from staff 
group by ManagerID
having count(StaffID) >=2);

-- SECTION-FOUR

/* Insert table creation and data for populating the tables */
create table package(
PackageActivityID char (3),
ChildActivityID char (3),
primary key (PackageActivityID, ChildActivityID), 
foreign key (PackageActivityID) references activity(ActivityID),
foreign key (ChildActivityID) references activity(ActivityID)
);

-- package data 
insert into package values ('A08', 'A03');
insert into package values ('A08', 'A05');
insert into package values ('A09', 'A02');
insert into package values ('A09', 'A07');

-- Task 18
/*Write	a	query	to	print	the	details	of	activity	booking	(ActivityID,	ReservationID,	Time	of	
the	 Activity	 Reservation,	Name	 of	 the	 Activity) and	 the	names	 of	 staff	involved	in	 the	
activities.	This	should	involve	the	guide	and	all	the	support	staff	involved */

select ab.ActivityID 'Activity ID', ab.ReservationID 'Reservation ID', 
ab.ActivityTime 'Time of Activity', a.ActivityName 'Activity Name', s.StaffName 'Staff'
from activitybooking ab, activity a, staff s, supportstaff ss
where a.ActivityID = ab.ActivityID
and ab.ActivityID = ss.ActivityID
and ab.ReservationID = ss.ReservationID
and ab.ActivityTime = ss.ActivityTime
and s.StaffID = ss.StaffID
and ab.GuideID = ss.StaffID
union
select ab.ActivityID 'Activity ID', ab.ReservationID 'Reservation ID', 
ab.ActivityTime 'Time of Activity', a.ActivityName 'Activity Name', s.StaffName 'Staff'
from activitybooking ab, activity a, staff s, supportstaff ss
where a.ActivityID = ab.ActivityID
and ab.ActivityID = ss.ActivityID
and ab.ReservationID = ss.ReservationID
and ab.ActivityTime = ss.ActivityTime
and s.StaffID = ss.StaffID
and (ss.StaffID not like ab.GuideID 
or ab.GuideID is null);

-- Task 19
/*List	the	details	of	package	activities	(id,	name	and	cost)	along	with	the	details	(id,	name	
and	cost)	of	its	least	expensive	sub	activities	 */

select distinct a1.ActivityID 'Package ID', a1.ActivityName 'Package', 
concat('$ ',a1.ActivityCost) 'Package Cost', a2.ActivityID 'Activity ID' , 
a2.ActivityName 'Cheapest sub-activity', concat('$ ',a2.ActivityCost) 'Sub-activity cost'
from activity a1, activity a2, package p
where a1.ActivityID = p.PackageActivityID
and a2.ActivityID = p.ChildActivityID
and a2.ActivityCost in(
select min(ActivityCost)
from activity , package  
where ActivityID = ChildActivityID
group by PackageActivityID);

-- Task 20 
/*Write	a	query	to	list	the	details	of	reservation	(id)	along	with	the	total	cost	(in	currency	
format)	of	both	activities	calculated	from	the	booking	 (number	of	people	*	the	cost	of	an	
activity)	and	villa	reservation	(number	of	days*	Cost	per	night)	for	each	of	the	villa)	for	
each	 of the	 reservation.	 If	 the	 reservation	 doesn't	involve	 activity	 booking,	 0	must	 be	
displayed	then	0	must	be	displayed	as	the	cost. */

select r.ReservationID 'Reservation ID' , 
concat('$ ',ifnull(sum(ab.NumPeople*a.ActivityCost),0)) 'Total Activity Cost', 
concat('$ ',cast(sum((datediff(vr.DateTo,vr.DateFrom)*v.VillaCostPerDay))as decimal (9,2))) 'Total Villa Cost',
concat('$ ',cast(ifnull(sum(ab.NumPeople*a.ActivityCost),0)+sum((datediff(vr.DateTo,vr.DateFrom)*v.VillaCostPerDay))as decimal (9,2)))
 'Total Cost'
from activity a join activitybooking ab
on a.ActivityID = ab.ActivityID
right join reservation r 
on ab.ReservationID = r.ReservationID 
left join villa_reservation vr 
on r.ReservationID = vr.ReservationID
join villa v
on v.VillaID = vr.VillaID
group by r.ReservationID;