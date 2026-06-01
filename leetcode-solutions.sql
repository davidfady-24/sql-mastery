-- LeetCode 175: Combine Two Tables

SELECT firstName, lastName, city, state
FROM Person
LEFT JOIN Address
ON Person.personId = Address.personId;

-- LeetCode 176: Second Highest Salary

SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;


--LeetCode 178. Rank Scores

SELECT
    score,
    DENSE_RANK() OVER (
        ORDER BY score DESC
    ) AS `rank`
FROM Scores
ORDER BY score DESC;

--181. Employees Earning More Than Their Managers
SELECT e2.name as Employee
FROM employee e1
INNER JOIN employee e2 ON e1.id = e2.managerID
WHERE
e1.salary < e2.salary
