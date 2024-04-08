/* 
 Question: What skills are required for the top-paying jobs?
 - Use the obtained 10 top-paying jobs from the first query.
 - List the specific skills required for those roles.
 */

 -- CTE
WITH top_paying_jobs AS (
    SELECT 
        jp_fact.job_id,
        jp_fact.job_title,
        cp_dim.name AS company_name,
        jp_fact.salary_year_avg
    FROM 
        job_postings_fact AS jp_fact
        INNER JOIN company_dim AS cp_dim ON jp_fact.company_id = cp_dim.company_id
    WHERE 
        job_country = 'Germany'
        AND job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 
        10
)

SELECT
    top_paying_jobs.*,
    sk_dim.skills
FROM 
    top_paying_jobs
    INNER JOIN skills_job_dim AS skjob_dim ON top_paying_jobs.job_id = skjob_dim.job_id
    INNER JOIN skills_dim AS sk_dim ON skjob_dim.skill_id = sk_dim.skill_id
ORDER BY 
    top_paying_jobs.salary_year_avg DESC  