create table population(
borough_id varchar(10) primary key,
borough_name varchar(50) not null,
population_2020 bigint,
population_share_of_NYC_in_2020 numeric
);

create table property(
property_id varchar(10) primary key,
property_type varchar(45)
 );


create table room (
room_id varchar(10) primary key,
room_type varchar(100)
);

create table bed_type (
bed_id varchar(10) primary key,
type varchar(100)
);

create table neighbourhood (
neighbour_id varchar(10) primary key,
borough_id varchar(10),
neighbourhood varchar(100)
);


create table house(
house_id varchar(10) primary key,
bedrooms int,
beds int,
price numeric,
accommodates int
);

create table house_info (
house_id varchar(10) primary key,
property_id varchar(10),
room_id varchar(10),
borough_id varchar(10),
bed_id varchar (10),
neighbour_id varchar(10),
foreign key (property_id) references property (property_id),
foreign key (room_id) references room (room_id),
foreign key (borough_id) references population (borough_id),
foreign key (bed_id) references bed_type(bed_id),
foreign key (neighbour_id) references neighbourhood(neighbour_id)
);


create table review(
review_id varchar(10) references house(house_id),
number_of_reviews int,
review_scores_value int
);

create table host(
house_id varchar(10) references house(house_id),
host_name varchar(20),
host_since date,
host_is_superhost varchar(5)
);

create table policy(
policy_id varchar(10) primary key,
instant_bookable varchar(5),
cancellation_policy varchar(255)
);

create table house_policy(
house_id varchar(10),
policy_id varchar (10),
primary key (house_id, policy_id),
constraint fk_house foreign key (house_id) references house (house_id),
constraint fk_policy foreign key (policy_id) references policy (policy_id)
);

create table amenity(
amenity_id varchar(10) references house (house_id),
Wifi varchar(5),
Heating varchar(5),
TV varchar(5),
Kitchen varchar(5)
);

create table parks(
park_id varchar(10) primary key,
borough_id varchar(10),
park_type varchar(50),
foreign key (borough_id) references population (borough_id)
);

create table shooting_incident(
incident_id varchar(10) primary key,
borough_id varchar(10),
occur_date date,
murder varchar(5),
foreign key (borough_id) references population (borough_id)
);

create table maintenance_fee(
fee_id varchar(10) primary key,
borough_id varchar(50),
avg_amount int,
foreign key (borough_id) references population (borough_id)
);