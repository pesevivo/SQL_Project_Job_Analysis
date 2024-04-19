/* 
Question: What are the top-paying data analyst jobs?
- Identify the 10 top-paying data analyst jobs in the USA.
- Focus is on job postings with disclosed salaries. (null values should be removed)
 */

 SELECT
    jp_fact.job_id,
    jp_fact.job_title,
    cp_dim.name AS company_name,
    jp_fact.job_schedule_type,
    jp_fact.salary_year_avg,
    jp_fact.job_posted_date
FROM
    job_postings_fact AS jp_fact 
    INNER JOIN company_dim AS cp_dim ON jp_fact.company_id = cp_dim.company_id
WHERE 
    job_country = 'United States'
    AND job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT
    10

