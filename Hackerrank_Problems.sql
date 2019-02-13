
/* Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA. */

select * from CITY where population > 100000 and countrycode = 'USA';

/* Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA. */

select name from CITY where population > 120000 and countrycode = 'USA';

/* Query all columns (attributes) for every row in the CITY table. */

select * from city;

/* Query all columns for a city in CITY with the ID 1661. */

select * from city where id = 1661;

/* Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. */

select * from city where countrycode = 'JPN';

/* Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN. */

select name from city where countrycode = 'JPN';

/* Query a list of CITY and STATE from the STATION table. */

select city, state from station;

/* Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude 
   duplicates from your answer. */

select distinct city from station where mod(id, 2) = 0;

/* difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. */

select  count(city) - count(distinct city) from station;

/* Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
   (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that 
   comes first when ordered alphabetically. */

select city, length(city) from station having length(city) = (select max(a.len) from (select length(city) as len from station) a) order by city limit 1;

select city, length(city) from station having length(city) = (select min(a.len) from (select length(city) as len from station) a) order by city limit 1;
 
/* Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. */

select distinct city from station where left(city, 1) in ('a', 'e', 'i', 'o', 'u');

select distinct city from station where substr(city, 1, 1) in ('a', 'e', 'i', 'o', 'u');

/* Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates. */

select distinct city from station where right(city, 1) in ('a', 'e', 'i', 'o', 'u');

/* Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
   Your result cannot contain duplicates. */
   
select distinct city from station where right(city, 1) in ('a', 'e', 'i', 'o', 'u') and left(city, 1) in ('a', 'e', 'i', 'o', 'u'); 

/* Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates. */

select distinct city from station where left(city, 1) not in ('a', 'e', 'i', 'o', 'u');

/* Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates. */

select distinct city from station where right(city, 1) not in ('a', 'e', 'i', 'o', 'u');

/* Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
   Your result cannot contain duplicates. */
   
select distinct city from station where right(city, 1) not in ('a', 'e', 'i', 'o', 'u') or left(city, 1) not in ('a', 'e', 'i', 'o', 'u'); 
   
/* Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates. */

select distinct city from station where right(city, 1) not in ('a', 'e', 'i', 'o', 'u') and left(city, 1) not in ('a', 'e', 'i', 'o', 'u'); 

/* Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order. */

select name from employee order by name;

/* Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 
   $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id. */

select name from employee where salary > 2000 and months < 10 order by employee_id;



