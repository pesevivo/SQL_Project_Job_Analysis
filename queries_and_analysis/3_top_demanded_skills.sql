/*
Question: What are the most in-demand skills for data analysts?
 - Focus on all job postings for Germany.
 - Identify the top 5 skills.
*/

SELECT
    sk_dim.skills,
    COUNT(skjob_dim.job_id) AS skill_demand
FROM 
    job_postings_fact AS jp_fact
    INNER JOIN skills_job_dim AS skjob_dim ON jp_fact.job_id = skjob_dim.job_id
    INNER JOIN skills_dim AS sk_dim ON skjob_dim.skill_id = sk_dim.skill_id
WHERE
    jp_fact.job_country = 'Germany' AND
    jp_fact.job_title_short = 'Data Analyst'
GROUP BY
    sk_dim.skills
ORDER BY
    skill_demand DESC
LIMIT 5