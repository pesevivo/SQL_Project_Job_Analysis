/* 
Question: What skills are required for the top-paying job?
- Use the obtained 10 top-paying jobs from the first query.
- Discover the specific skills required for those roles.
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
    job_country = 'Germany' AND
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT
    10