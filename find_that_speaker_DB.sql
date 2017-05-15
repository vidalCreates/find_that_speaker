/*===================================== CREATE DATABASE AND SELECT IT ======================*/
drop database IF EXISTS find_that_speaker_DB;
create database find_that_speaker_DB;
use find_that_speaker_DB;


/*======================= CREATING TABLES ===================================================*/
create table person(
	person_id varchar(10),
	person_name varchar(20),
	bio varchar(1000),
	primary key(person_id)
);

/*===================== INSERTING VALUES IN TABLES=================================== */
insert into person values('p0001','Barack Obama','Barack Hussein Obama II, born August 4, 1961, is 
	an American politician who served as the 44th President of the United States from 2009 
	to 2017. He is the first African American to have served as president, as well as the 
	first born outside the contiguous United States. He previously served in the U.S. 
	Senate representing Illinois from 2005 to 2008, and in the Illinois State Senate from 1
	997 to 2004.');
insert into person values('p0002','Ellen DeGeneres','Ellen Lee DeGeneres, 
	born January 26, 1958, is an American comedian, television host, actress, writer, and 
	producer. DeGeneres starred in the popular sitcom Ellen from 1994 to 1998 and has hosted 
	her syndicated TV talk show, The Ellen DeGeneres Show, since 2003.');
insert into person values('p0003','Emma Watson','Emma Charlotte Duerre Watson, born 15 April 1990, is 
	a British actress, model, and activist. Born in Paris and brought up in Oxfordshire, Watson attended 
	the Dragon School and trained as an actress at the Oxford branch of Stagecoach Theatre Arts. She rose 
	to prominence after landing her first professional acting role as Hermione Granger in the Harry Potter 
	film series, having acted only in school plays previously. Watson appeared in all eight Harry Potter 
	films from 2001 to 2011, earning worldwide fame, critical accolades, and around $60 million.');
insert into person values('p0004','Kevih Hart','Kevin Darnell Hart (born July 6, 1979)
 	is an American actor, comedian, writer, and producer. Born and raised in Philadelphia, Pennsylvania, 
 	Hart began his career by winning several amateur comedy competitions at clubs throughout New England, 
 	culminating in his first real break in 2000 when he was cast by Judd Apatow for a recurring role on 
 	the TV series Undeclared.');
insert into person values('p0005','Morgan Freeman','Morgan Freeman, born June 1, 1937,is an American actor, 
	producer and narrator. Freeman won an Academy Award in 2005 for Best Supporting Actor with Million Dollar 
	Baby (2004), and he has received Oscar nominations for his performances in Street Smart (1987), 
	Driving Miss Daisy (1989), The Shawshank Redemption (1994) and Invictus (2009). He has also won a 
	Golden Globe Award and a Screen Actors Guild Award.');
/*======================== QUERIES ================================*/
/*SCHEMA*/
/*describe person;*/

