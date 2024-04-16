/*
Question: What are the most optimal skills to learn? (high demand and high paying)
 - Examine the average salary associated for each skill Data Analyst positions.
 - Focus is on job postings with disclosed salaries and located in Germany. (null values should be removed)

*/

SELECT 
    sk_dim.skill_id,
    sk_dim.skills,
    COUNT(skjob_dim.job_id) AS skill_demand,
    ROUND(AVG(jp_fact.salary_year_avg), 0) as avg_salary
FROM 
    job_postings_fact AS jp_fact
    INNER JOIN skills_job_dim AS skjob_dim ON jp_fact.job_id = skjob_dim.job_id
    INNER JOIN skills_dim AS sk_dim ON skjob_dim.skill_id = sk_dim.skill_id
WHERE
    jp_fact.job_country = 'Germany'
    AND jp_fact.job_title_short = 'Data Analyst'
    AND jp_fact.salary_year_avg IS NOT NULL
GROUP BY
    sk_dim.skill_id,
    sk_dim.skills
HAVING
   COUNT(skjob_dim.job_id) >= 5
ORDER BY
    skill_demand DESC,
    avg_salary DESC
