/*
Question: What are the top skills based on salary?
 - Examine the average salary associated for each skill Data Analyst positions.
 - Focus is on job postings with disclosed salaries and located in the USA. (null values should be removed)
 - Identify the top 10 skills in this regard.
*/

SELECT
    sk_dim.skill_id,
    sk_dim.skills,
    ROUND(AVG(jp_fact.salary_year_avg), 0) as avg_salary
FROM 
    job_postings_fact AS jp_fact
    INNER JOIN skills_job_dim AS skjob_dim ON jp_fact.job_id = skjob_dim.job_id
    INNER JOIN skills_dim AS sk_dim ON skjob_dim.skill_id = sk_dim.skill_id
WHERE
    jp_fact.job_country = 'United States'
    AND jp_fact.job_title_short = 'Data Analyst'
    AND jp_fact.salary_year_avg IS NOT NULL
GROUP BY
    sk_dim.skill_id,
    sk_dim.skills
ORDER BY
    avg_salary DESC
LIMIT 10