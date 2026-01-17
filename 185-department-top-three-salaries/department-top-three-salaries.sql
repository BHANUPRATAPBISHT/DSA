# Write your MySQL query statement below
SELECT department, employee, salary
FROM (
    SELECT d.name AS department,
           e.name AS employee,
           e.salary,
           DENSE_RANK() OVER (
               PARTITION BY d.name
               ORDER BY e.salary DESC
           ) AS rnk
    FROM employee e
    JOIN department d
      ON e.departmentId = d.id
) t
WHERE rnk <= 3;
