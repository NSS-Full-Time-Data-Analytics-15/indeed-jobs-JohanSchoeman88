select count(*)
from data_analyst_jobs;

--question 2

select *
from data_analyst_jobs
limit 1 offset 9;

--ExxonMobile

--question 3

SELECT
	Sum(case when location = 'TN' then 1 end),
	sum(case when location = 'KY' then 1 end)
from data_analyst_jobs;


--question 4

SELECT count(*)
from data_analyst_jobs
where location = 'TN'
 AND star_rating > 4

 --question 5
 
select COUNT(*)
FROM data_analyst_jobs
where review_count between 500 and 1000;

--question 6
SELECT location as state, AVG(star_rating) AS avg_rating
from data_analyst_jobs
where star_rating is not null
group by state;

--question 7
SELECT count(distinct title) as unique_job_count 
from data_analyst_jobs;

--question 8

SELECT location AS state, count(distinct title) as unique_count
from data_analyst_jobs
where location = 'CA'
group by state;

--question 9

SELECT company,
	avg(star_rating) as avg_star_rating
from data_analyst_jobs
where star_rating is not null
	and company is not null
group by company, review_count
having sum(review_count) > 5000;

--question 9 part b
SELECT count(distinct company) as company_count
from data_analyst_jobs
where star_rating is not null
 and company is not null
HAVING sum(review_count) > 5000;

--question 10
SELECT 
    company, 
    AVG(star_rating) AS avg_star_rating
FROM 
    data_analyst_jobs
WHERE 
    star_rating IS NOT NULL
    AND company IS NOT NULL
GROUP BY 
    company
HAVING 
    SUM(review_count) > 5000
ORDER BY 
    avg_star_rating DESC;

--question 11

SELECT title
from data_analyst_jobs
where title like '%Analyst%';


SELECT count(distinct title)
from data_analyst_jobs
where title like '%Analyst%';

--question 12

select count(distinct title) as unique_job
from data_analyst_jobs
where title not like '%Analyst%'
and title not like '%Analytics%';

select distinct title
from data_analyst_jobs
where title not like '%Analyst%'
and title not like '%Analytics%';

select distinct title
from data_analyst_jobs
where title not Ilike '%Analyst%'
and title not Ilike '%Analytics%';

--- BONUS QUESTION
select domain, count(*) as job_count
from data_analyst_jobs
where domain is not null
and days_since_posting < 21
and skill = 'SQL'
group by domain
order by job_count desc;