SELECT * FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`;
#Business Analysis 
# Business Q1.
# How many employees are in each department?
Select Department,
	    count(*) as Total_Employees
 From  `wa_fn-usec_-hr-employee-attrition` 
 Group by department
 Order by Total_Employees;
 # Research and Development Department has the largest number of employees (961 
 # with sales department with 46 and lastly for the Human resources with 63 workersResearch & Development has the largest workforce, 
 # indicating that the organization places significant emphasis on research and innovation.
 
 #Q2.
 #What Percentage of employees left in the company ? (Company's attrition rate)
 SELECT 
	COUNT(*) AS Total_Employees,
    SUM(CASE WHEN ATTRITION = 'Yes' Then 1 Else 0 End) As Employees_Left,
    ROUND(
    SUM(CASE WHEN Attrition = 'Yes' Then 1 Else 0 End ) * 100 / Count(*),
    2
    ) AS Attrition_Rate_Percentage 
    FROM  `wa_fn-usec_-hr-employee-attrition` ;
    # This gives Total_Employment 1420, with 237 Employment Left and 16.12 Attrition Rate. 
    # The overall attrition rate is 16.12%, meaning approximately one in every six employees has left the organization. 
    # This is an important HR metric that management should monitor.
    
    #Q3. 
    # Whats the gender distribution of the company ?
    SELECT Gender,
    Count(*) as total_employees
    from  `wa_fn-usec_-hr-employee-attrition` 
    group by Gender 
    Order by  total_employees;
    # A number of 882 makes of males employees wheras 588 are then females 
    # The workforce is predominantly male, with 882 male employees (60%) and 588 female employees (40%).
    
    #Q4.
    #Whats the average monthly income by each department 
    SELECT Department,
	       ROUND(AVG(MonthlyIncome),2) AS Average_Income 
           From `wa_fn-usec_-hr-employee-attrition` 
	GROUP BY  Department
    ORDER BY Average_Income ;
 # Sales Department recorded the highest average income recording 6959.17
 # with  Research 6281.25 and Human Resource deparment 6654.51
 # The Sales department records the highest average monthly income,
 # suggesting higher compensation levels compared to the other departments.
 
 # Q5.
 # What is the average age of employees?
 SELECT
ROUND(AVG(ï»¿Age),2) AS Average_Age
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`;
# The average employee age is 36.92 years, indicating a relatively mature and experienced workforce.

#Q6.
# Who is the youngest and oldest employee?
SELECT
MIN(ï»¿Age) AS Youngest_Employee,
MAX(ï»¿Age) AS Oldest_Employee
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`;
# Most employees (606) fall within the 26–35 age group, making it the organization's largest workforce segment.

#Q7.
# Whats the age group of the company
SELECT
CASE
    WHEN ï»¿Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN ï»¿Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN ï»¿Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN ï»¿Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END AS Age_Group,
COUNT(*) AS Total_Employees
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
GROUP BY Age_Group
ORDER BY Total_Employees DESC;
# Only 47 employees are aged 56 years and above, suggesting a relatively small population approaching retirement.
# The company employs people across a broad age range (18–60 years), supporting workforce diversity.

#Q8.
# Which Age Group Has the Highest Employee Attrition?
SELECT
CASE
    WHEN ï»¿Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN ï»¿Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN ï»¿Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN ï»¿Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END AS Age_Group,
COUNT(*) AS Employees_Left
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY Age_Group
ORDER BY Employees_Left DESC;

# Which Department Has the Highest Attrition?
SELECT Department,
       COUNT(*) AS Employees_Left
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Employees_Left DESC;
# Business Insight
# Research & Development recorded the highest number of employee departures (133 employees), accounting for over half of all resignations.
# The Sales department also experienced significant turnover (92 employees).
# Human Resources recorded the fewest resignations (12 employees).
# Business Recommendation
# Management should investigate employee satisfaction, workload, career development opportunities, and leadership practices 
# within the Research & Development department to reduce turnover.

# Does Overtime Affect Employee Attrition?
SELECT OverTime,
       COUNT(*) AS Employees_Left
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY OverTime;
# Business Insight
# Employees who worked overtime left the company slightly more often than those who did not.
# Business Recommendation
# While the difference is not large, HR should assess whether overtime policies, workload, or work-life balance contribute to employee turnover.

# Which Marital Status Has the Highest Attrition?
SELECT MaritalStatus,
       COUNT(*) AS Employees_Left
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY MaritalStatus
ORDER BY Employees_Left DESC;
# Business Insight
# Single employees recorded the highest number of resignations.
# Divorced employees had the fewest resignations.
#  Business Recommendation
# The company should explore whether younger employees, career mobility, 
# or work-life priorities contribute to the higher attrition among single employees.

# Which Job Role Has the Highest Attrition?
SELECT JobRole,
       COUNT(*) AS Employees_Left
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY Employees_Left DESC;
# Business Insight
# Laboratory Technicians experienced the highest employee turnover (62 resignations).
# Sales Executives and Research Scientists also showed relatively high attrition.
# Research Directors had the lowest turnover, suggesting stronger retention at senior leadership levels.
# Business Recommendation
# The organization should investigate the reasons behind the high turnover among Laboratory Technicians, 
# including workload, compensation, career progression, and work environment.

# Which Job Roles Have the Highest Average Monthly Income?
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
GROUP BY JobRole
ORDER BY Average_Monthly_Income DESC;
# Business Insight
# Managers earn the highest average monthly salary (17,181.68), reflecting their leadership responsibilities and experience.
# Sales Representatives receive the lowest average monthly salary (2,626.00), indicating they occupy more junior or entry-level positions.
# Business Recommendation
# The company should regularly review compensation across job roles to ensure pay remains competitive and aligned with responsibilities, helping to retain top talent.

# Which Education Level Has the Highest Average Salary?
SELECT
    Education,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
GROUP BY Education
ORDER BY Average_Monthly_Income DESC;
# Business Insight
#Employees with a Doctoral degree earn the highest average monthly salary.
# There is a general trend of increasing salary with higher educational attainment.
# Business Recommendation
# The company should continue investing in employee education and professional development, as higher qualifications are associated with higher-value roles.

# Which Department Has the Highest Total Payroll?
SELECT
    Department,
    ROUND(SUM(MonthlyIncome), 2) AS Total_Payroll
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
GROUP BY Department
ORDER BY Total_Payroll DESC;
# Business Insight
# Research & Development has the largest payroll, likely because it has both the largest workforce and several highly paid technical and managerial roles.
# Human Resources has the smallest payroll, reflecting its smaller workforce.
# Business Recommendation
# Since Research & Development represents the largest salary investment, management 
# should monitor productivity and retention in this department to maximize return on payroll costs.


# Who Are the Top 10 Highest Paid Employees?
SELECT
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
ORDER BY MonthlyIncome DESC
LIMIT 10;
# Business Insight
# The highest-paid employees are predominantly Managers and Research Directors.
# Most of these employees work within the Research & Development department, reinforcing its strategic importance to the organization.
# Business Recommendation
# The company should ensure that succession planning and retention strategies are in place for these high-impact leadership roles.

# Does Job Satisfaction Affect Attrition?
SELECT
    JobSatisfaction,
    COUNT(*) AS Employees_Left
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;
# Business Insight
# Employees with a High (3) job satisfaction level recorded the highest number of resignations (73).
# Employees with Medium (2) job satisfaction recorded the fewest resignations (46).

# Does Performance Rating Affect Attrition?
SELECT
    PerformanceRating,
    COUNT(*) AS Employees_Left
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY PerformanceRating
ORDER BY PerformanceRating;
# Business Insight
# Most employees who left had a Performance Rating of 3.
# Only 37 employees with a Performance Rating of 4 left the company.
# Business Recommendation
# Management should investigate whether employees with solid performance ratings (3) 
# are leaving because of factors such as career growth, workload, or compensation rather than poor performance.

# Does Overtime Influence Attrition Rate?
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
GROUP BY OverTime;
# Business Insight
# Employees who worked overtime had an attrition rate of 30.53%, nearly three times the attrition rate of employees who did not work overtime (10.44%).
# This suggests a strong relationship between overtime and employee turnover.
# Business Recommendation
# The organization should review overtime policies, staffing levels, and workload distribution to improve work-life balance and reduce employee turnover.

# Which Employees Earn More Than the Company's Average Salary?
SELECT
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
)
ORDER BY MonthlyIncome DESC;
# Business Insight
# The query identified all employees earning above the company's average monthly salary.
# Most of these employees occupy managerial, director-level, or specialized technical roles, 
# indicating that leadership and highly skilled positions receive significantly higher compensation.
# A large proportion of these employees are concentrated in the Research & Development department, 
# reinforcing its strategic importance and investment within the organization.
# This analysis helps HR identify high-value employees whose retention is critical to maintaining business performance.

# Business Recommendation
# The organization should prioritize retention strategies for employees earning above the average salary,
# as they are likely to hold critical leadership or specialized positions. Succession planning, career development, 
# and employee engagement initiatives should be targeted toward these key contributors.

# Rank Employees by Salary Within Each Department  
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    RANK() OVER (
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
    ) AS Salary_Rank
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`;

# Who is the highest-paid employee in each department?   
WITH Salary_Ranking AS
(
    SELECT
        EmployeeNumber,
        Department,
        JobRole,
        MonthlyIncome,
        RANK() OVER (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS Salary_Rank
    FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
)

SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome
FROM Salary_Ranking
WHERE Salary_Rank = 1;

#Which Employees Earn More Than Their Department's Average Salary?
WITH Department_Average AS
(
    SELECT
        Department,
        AVG(MonthlyIncome) AS Avg_Department_Salary
    FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
    GROUP BY Department
)

SELECT
    e.EmployeeNumber,
    e.Department,
    e.JobRole,
    e.MonthlyIncome,
    ROUND(d.Avg_Department_Salary,2) AS Department_Average
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition` e
JOIN Department_Average d
ON e.Department = d.Department
WHERE e.MonthlyIncome > d.Avg_Department_Salary
ORDER BY e.Department, e.MonthlyIncome DESC;

# Which department has the greatest number of employees earning above their department's average salary?
WITH Department_Average AS
(
    SELECT
        Department,
        AVG(MonthlyIncome) AS Avg_Department_Salary
    FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
    GROUP BY Department
)

SELECT
    e.Department,
    COUNT(*) AS Employees_Above_Average
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition` e
JOIN Department_Average d
    ON e.Department = d.Department
WHERE e.MonthlyIncome > d.Avg_Department_Salary
GROUP BY e.Department
ORDER BY Employees_Above_Average DESC;

# Business Insights
# Research & Development has the highest number of employees earning above their department's average salary (306 employees).
# This reflects the department's larger workforce and concentration of specialized technical and leadership roles.
# The Sales department has 160 employees earning above its departmental average, indicating a significant number of experienced or high-performing employees.
# Human Resources has only 17 employees earning above its departmental average, which aligns with its smaller department size.
# The results suggest that salary distribution varies across departments, with Research & Development receiving the largest share of above-average earners. 
# This reinforces our earlier findings that R&D has the highest payroll and contains many senior, specialized positions.

# Business Recommendation
# The company should periodically review salary structures within each department to ensure compensation 
# remains fair and competitive. Departments with many above-average earners should also have strong performance 
# evaluation and career development processes to justify higher salary investments.

# Create a View for High-Paid Employees
CREATE VIEW High_Paid_Employees AS
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
);
SELECT *
FROM High_Paid_Employees;

# Which Department Has the Highest Average Job Satisfaction?
SELECT
    Department,
    ROUND(AVG(JobSatisfaction), 2) AS Average_Job_Satisfaction
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
GROUP BY Department
ORDER BY Average_Job_Satisfaction DESC;
# Business Insight
# The Sales Department achieved the highest average performance rating, indicating consistently strong employee performance.
# Departments with lower performance ratings may benefit from additional coaching, mentoring, or training initiatives.
# Business Recommendation
# Management should study the practices of high-performing departments and implement successful performance management strategies across the organization

# Which Job Roles Have the Longest Average Years at the Company?
SELECT
    JobRole,
    ROUND(AVG(YearsAtCompany),2) AS Average_Years
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
GROUP BY JobRole
ORDER BY Average_Years DESC;
# Business Insight
# Employees working as _Healthcare Representative have the longest average tenure, indicating strong retention within this role.
# Job roles with shorter average tenure may experience higher employee turnover or career mobility.
# Business Recommendation
# company should examine retention strategies used in long-tenure roles and consider applying similar approaches to positions with shorter employee tenure.

# Which Departments Invest the Most in Employee Training?
SELECT
    Department,
    ROUND(AVG(TrainingTimesLastYear),2) AS Average_Training
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
GROUP BY Department
ORDER BY Average_Training DESC;
#  Insight
# The Sales Department records the highest average number of training sessions per employee.
# Departments with lower training participation may have opportunities to improve employee development and skill enhancement.
#Recommendation
# The organization should continue investing in employee development while ensuring training opportunities are distributed fairly across all departments.

# Which Department Has the Highest Attrition Rate?
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM `hr_analytics`.`wa_fn-usec_-hr-employee-attrition`
GROUP BY Department
ORDER BY Attrition_Rate DESC;
#  Business Insight
# The Sales Department has the highest employee attrition rate, meaning it loses a larger proportion of its workforce than other departments.
# though Research & Development recorded the highest number of resignations, another department may have the highest attrition rate once department size is considered.
# Business Recommendation
# HR should prioritize retention strategies in departments with the highest attrition rates by reviewing workload, 
# employee engagement, compensation, career progression, and leadership effectiveness.

