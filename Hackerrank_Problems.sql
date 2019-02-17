
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

/* Query the total population of all cities in CITY where District is California. */

select sum(population) from city where district = 'California';

/* Query the average population of all cities in CITY where District is California. */

select avg(population) from city where district = 'california';

/* Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer. */

select  ceil(avg(salary) - avg(replace(salary, '0', ''))) from employees;

 /* query to find the maximum total earnings for all employees as well as the total number of employees who have maximum 
    total earnings */
                                       
select (salary * months) as income, count(*) from employee group by 1 order by income desc limit 1;

                                       
 /* Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.*/

 select round(sum(lat_n), 2), round(sum(long_w), 2) from station;                                 
                                       
 /* Query the difference between the maximum and minimum populations in CITY. */
                                       
 select max(population) - min(population) from city;
 
 /* Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN. */                                     
                                       
select sum(population) from city where countrycode = 'JPN';

/* Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places. */
                                       
select  round(sum(lat_n), 4) from station where lat_n > 38.7880 and lat_n < 137.2345;                                       

/* Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places. */
                                       
select round(abs(min(lat_n) - max(lat_n)) + abs(min(long_w) - max(long_w)), 4)  from station;                                      

/* Query the Euclidean Distance between points P1 and P2 and round it to a scale of 4 decimal places. */
                                       
select round(
    sqrt(
        power(
            (min(lat_n) - max(lat_n)), 2) + 
        power(
            (min(long_w) - max(long_w)), 2)), 4)  from station;                                      
                                       
                                       
                                       
                                       
                                       
                                       
