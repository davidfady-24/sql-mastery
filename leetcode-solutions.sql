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
