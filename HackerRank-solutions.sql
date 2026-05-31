/*

Question:
Generate the following two result sets:

1. Query an alphabetically ordered list of all names in OCCUPATIONS,
   immediately followed by the first letter of each profession in parentheses.

2. Query the number of occurrences of each occupation in OCCUPATIONS.
   Sort by occurrence count ascending, then occupation name alphabetically.
   Output format:
   There are a total of [occupation_count] [occupation]s.
*/

-- Solution

SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')')
FROM OCCUPATIONS
ORDER BY Name;

SELECT CONCAT(
    'There are a total of ',
    COUNT(*),
    ' ',
    LOWER(Occupation),
    's.'
)
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;

