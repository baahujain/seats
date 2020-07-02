

CREATE TABLE Organization(OrganizationId int not null AUTO_INCREMENT,
OrganizationName varchar(255) not null ,
PRIMARY KEY(OrganizationId)
);																								

CREATE TABLE Employee( EmployeeId int not null,																										
OrganizationId int not null,																										
PRIMARY KEY (EmployeeId),																										
FOREIGN KEY (OrganizationId) REFERENCES Organization(OrganizationId)																										
)																										


CREATE TABLE Site(SiteId int not null AUTO_INCREMENT,																										
SiteName varchar(255) not null ,																										
SiteAddress  varchar(512) not null ,																										
OrganizationId int not null,																										
PRIMARY KEY(SiteId),																										
FOREIGN KEY (OrganizationId) REFERENCES Organization(OrganizationId)																										

);																										

CREATE TABLE Tower(TowerId int not null AUTO_INCREMENT,
TowerName varchar(255) ,
SiteId int not null,
PRIMARY KEY(TowerId),
FOREIGN KEY (SiteId) REFERENCES Site(SiteId)
);																							


CREATE TABLE Floor(FloorId int not null  AUTO_INCREMENT,																										
FloorName varchar(255) not null,																										
TowerId int not null,																										
PRIMARY KEY(FloorId),																										
FOREIGN KEY(TowerId) REFERENCES Tower(TowerId)																										
)		;																								



CREATE TABLE Wing(WingId int not null AUTO_INCREMENT,																										
WingName varchar(255) not null,																										
FloorId int not null,																										
PRIMARY KEY(WingId),																										
FOREIGN KEY(FloorId) REFERENCES Floor(FloorId)																										
)	;																									

CREATE TABLE Seat(Seatid int not null AUTO_INCREMENT ,																										
SeatNumber varchar(100) not null,																										
FloorId int not null,																																																				
Shared boolean not null,																										
PRIMARY KEY (SeatId),																										
FOREIGN KEY (FloorId) REFERENCES Floor(FloorId)																																																				
);																										


-- Foreign keys of all tables present here so that we can easily search for free seats based on company,tower etc
CREATE TABLE Booking(BookingId int not null AUTO_INCREMENT,																										
EmployeeId int not null,																										
SeatId int not null,																										
StartDate datetime not null,																										
EndDate datetime not null,																										
OrganizationId int not null,																										
SiteId int not null,																									
TowerId int not null,																								
FloorId int not null,																										
PRIMARY KEY (BookingId),																										
FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),																										
FOREIGN KEY (SeatId) REFERENCES Seat(SeatId),																										
FOREIGN KEY (OrganizationId) REFERENCES Organization(OrganizationId),																										
FOREIGN KEY (SiteId) REFERENCES Site(SiteId),																										
FOREIGN KEY (TowerId) REFERENCES Tower(TowerId),																										
FOREIGN KEY (FloorId) REFERENCES Floor(FloorId)																										
)	;																									

