use carDealershipTest;

create table make(
`name` varchar(30) primary key not null,
user varchar(50) not null,
dateAdded timestamp not null default current_timestamp
);

create table model(
`name` varchar(30) primary key not null,
user varchar(50) not null,
dateAdded timestamp not null default current_timestamp,
make varchar (30) not null,
foreign key (make) references make(`name`));

create table vehicle(
vehicleID int primary key auto_increment,
bodyStyle varchar(30) not null,
trans varchar (30) not null,
color varchar (30) not null,
interior varchar (30) not null,
mileage int not null default 0,
vin int not null,
salePrice int not null,
msrpPrice int not null,
`year` int not null,
make varchar (30) not null,
model varchar (30) not null,
`type` varchar (30) not null,
available boolean not null default true,
featured boolean not null default false,
foreign key (make) references make(`name`),
foreign key (model) references model(`name`));

create table `role`(
`role` varchar (20) primary key 
);

create table `user`(
userID int primary key auto_increment,
firstName varchar(30) not null,
lastName varchar(30) not null,
email varchar(50) not null,
`role` varchar (20) not null,
foreign key (`role`) references `role`(`role`));

create table state(
state varchar (2) primary key not null,
stateName varchar (20) not null);

create table sale(
saleID int primary key auto_increment,
vehicleID int not null,
`name` varchar(30) not null,
phone varchar(10) not null,
email varchar (30) not null,
street1 varchar (30) not null,
street2 varchar (30) not null,
city varchar (30) not null,
state varchar (2) not null,
zipcode int (5) not null,
purchasePrice int not null,
purchaseType varchar (30) not null,
foreign key (vehicleID) references vehicle(vehicleID),
foreign key (state) references state(state));

INSERT into state values 
('AL', 'Alabama'),
('AK', 'Alaska'),
('AZ', 'Arizona'),
('AR', 'Arkansas'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DE', 'Delaware'),
('DC', 'District of Columbia'),
('FL', 'Florida'),
('GA', 'Georgia'),
('HI', 'Hawaii'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('IA', 'Iowa'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('ME', 'Maine'),
('MD', 'Maryland'),
('MA', 'Massachusetts'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MS', 'Mississippi'),
('MO', 'Missouri'),
('MT', 'Montana'),
('NE', 'Nebraska'),
('NV', 'Nevada'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NY', 'New York'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PA', 'Pennsylvania'),
('PR', 'Puerto Rico'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VT', 'Vermont'),
('VA', 'Virginia'),
('WA', 'Washington'),
('WV', 'West Virginia'),
('WI', 'Wisconsin'),
('WY', 'Wyoming');

INSERT into `role` values
('Admin'),
('Sales'),
('Disabled');