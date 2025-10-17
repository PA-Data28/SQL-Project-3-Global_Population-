create database Population;
use Population;
create table population(Country varchar(25),
PopulationAged014  float,
PopulationAge60 float,
Populationdensity float,
Population float,
FemalePopulation float,
MalePopulation float,
Sexratio float);

Select * from population;

/*Basic Retrieval Queries
What is the total population of Nigeria?

Find the population density of Singapore.

What percentage of the population in Italy is aged 60 and over?

Show the sex ratio for the United Arab Emirates.

What are the male and female population numbers for Canada?

Ranking & Sorting Queries
Which are the 10 most populous countries in the world?

List the 10 countries with the lowest population density.

Which 5 countries have the highest percentage of their population aged 0 to 14?

Rank the countries by the highest sex ratio (most males per 100 females).

Which 10 countries have the oldest populations, based on the percentage aged 60 and over?

Conditional & Filtering Queries
List all countries with a total population greater than 200 million.

Find all countries where the population aged 0 to 14 is higher than 40%.

Which countries have a sex ratio of less than 90 (more females than males)?

Show all countries where the percentage of the population over 60 is greater than the percentage of the population under 14.

Find countries with a population density greater than 1000 people per square kilometer.

Aggregate & Calculation Queries
What is the total combined population of all countries listed in the dataset?

What is the average population density for the entire world, based on this data?

Calculate the average percentage for the "Population Aged 0 to 14" column across all countries.

What is the sum of the male population across all countries?

What is the worldwide average sex ratio?

Comparative Queries
Compare the total population and population density of India versus China.

Which country has a younger population, Vietnam or the Philippines, based on the percentage aged 0-14?

How do the age demographics (% aged 0-14 vs % aged 60+) of Japan and Germany compare?

List 5 countries with a population between 50 and 60 million.

Which countries have both a population over 100 million and a population density below 100?

Deeper Analytical Queries
Which country has the highest absolute number of people aged 60 and over? (Requires calculating: Population(in millions) * Population Aged 60 and Over (%))

Which country has the largest land area? (Requires calculating: Population(in millions) * 1,000,000 / Population density)

Identify countries with a very low youth population (under 15%) but a high total population (over 50 million).

Is there a tendency for countries with higher population density to have a lower percentage of the population aged 0 to 14?

Find countries with a near-equal balance of young and old populations (where the difference between '% Aged 0 to 14' and '% Aged 60 and Over' is less than 1%).*/

/*What is the total population of Nigeria?*/
select population
from population
where Country='Nigeria';

/*Find the population density of Singapore.*/

select Populationdensity
 from population where country='Singapore';
 
 /*What percentage of the population in Italy is aged 60 and over?*/
 
 select PopulationAge60 from population where country='Italy';
 
 /*Show the sex ratio for the United Arab Emirates.*/
 select Sexratio from population where country='United Arab Emirates';
 
 /*What are the male and female population numbers for Canada?*/
 select country , FemalePopulation,MalePopulation from population
 where country = 'Canada';
 
/* Which are the 10 most populous countries in the world?*/
select country,Population from population
order by population desc
limit 10;

/*List the 10 countries with the lowest population density.*/
select country, Population from population order by population asc
 limit 10;


/*Which 5 countries have the highest percentage of their population aged 0 to 14?*/

select country,PopulationAged014 from population order by population desc
limit 5;

/*Rank the countries by the highest sex ratio (most males per 100 females).*/
select country,Sexratio from population order by Sexratio Desc ;

/*Which 10 countries have the oldest populations, based on the percentage aged 60 and over?*/

select country,PopulationAge60 from population order by PopulationAge60 desc limit 10; 

/*List all countries with a total population greater than 200 million.*/
select country,Population from population where Population >200;

/*Find all countries where the population aged 0 to 14 is higher than 40%.*/
select country, PopulationAged014 from population where PopulationAged014 >40;

/*Which countries have a sex ratio of less than 90 (more females than males)?*/
select country,Sexratio from population where Sexratio <90;



/*Show all countries where the percentage of the population over 60 is greater than the percentage of the population under 14*/
select country,PopulationAged014,PopulationAge60 from population where PopulationAge60 > PopulationAged014;

/*Find countries with a population density greater than 1000 people per square kilometer.*/
select country,Populationdensity from Population where populationdensity >1000;

/*What is the total combined population of all countries listed in the dataset?*/
select sum(Population) as total_combined_population from population;
/*What is the average population density for the entire world, based on this data?*/
select avg(Populationdensity)  from population;

/*Calculate the average percentage for the "Population Aged 0 to 14" column across all countries.*/
select avg(PopulationAged014) from population;

/*What is the sum of the male population across all countries?*/

select sum(MalePopulation)  from population;

/*What is the worldwide average sex ratio?*/
select avg(Sexratio) from population;

/*Compare the total population and population density of India versus China.*/
select country , population,populationdensity from population where  country in ('India' , 'China');

/*Which country has a younger population, Vietnam or the Philippines, based on the percentage aged 0-14?*/

select country,PopulationAged014 from population where country in ('Vietnam','Philippines') order by population014 desc; 

/*How do the age demographics (% aged 0-14 vs % aged 60+) of Japan and Germany compare?*/
select country,  PopulationAged014,PopulationAge60 from population where country in ('Japan','Germany');

/*List 5 countries with a population between 50 and 60 million.*/

select country,population from population where population between 50 and 60 order by population desc limit 5;


/*Which countries have both a population over 100 million and a population density below 100?*/
select country,population,populationdensity from population where population >100 and Populationdensity<100 ;


/*Which country has the highest absolute number of people aged 60 and over? (Requires calculating: Population(in millions) * Population Aged 60 and Over (%)*/

SELECT
    Country,
    CAST(`Population` AS DECIMAL(10,2)) * CAST(`PopulationAge60` AS DECIMAL(10,2)) / 100 AS population_over_60
FROM
    population
ORDER BY
    population DESC
LIMIT 1;

/*Which country has the largest land area? (Requires calculating: Population(in millions) * 1,000,000 / Population density)*/

SELECT
    Country,
    (CAST(`Population` AS DECIMAL(15,2)) * 1000000) / CAST(`Populationdensity` AS DECIMAL(10,1)) AS land_area_sq_km
FROM
    population
ORDER BY
    land_area_sq_km DESC
LIMIT 1;


/*Is there a tendency for countries with higher population density to have a lower percentage of the population aged 0 to 14?*/

select country,Populationdensity,PopulationAged014 from population order by CAST(`Populationdensity` AS DECIMAL(10,1)) DESC;

/*Identify countries with a very low youth population (under 15%) but a high total population (over 50 million).*/
select country,population, populationAged014 from population where populationAged014 <15 and Population >50;

/*Find countries with a near-equal balance of young and old populations (where the difference between '% Aged 0 to 14' and '% Aged 60 and Over' is less than 1%).*/

SELECT
    `Country`,
    `PopulationAged014`,
    `PopulationAge60`,
    ABS(CAST(`PopulationAged014` AS DECIMAL(10,1)) - CAST(`PopulationAge60` AS DECIMAL(10,1))) AS difference
FROM
    population
WHERE
    ABS(CAST(`PopulationAged014` AS DECIMAL(10,1)) - CAST(`PopulationAge60` AS DECIMAL(10,1))) < 1
ORDER BY
    difference;






 
 

 
 
