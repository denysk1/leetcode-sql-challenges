/*
Table: Data

+-------------+------+
| Column Name | Type |
+-------------+------+
| first_col   | int  |
| second_col  | int  |
+-------------+------+
This table may contain duplicate rows.
 

Write a solution to independently:

order first_col in ascending order.
order second_col in descending order.
The result format is in the following example.

 

Example 1:

Input: 
Data table:
+-----------+------------+
| first_col | second_col |
+-----------+------------+
| 4         | 2          |
| 2         | 3          |
| 3         | 1          |
| 1         | 4          |
+-----------+------------+
Output: 
+-----------+------------+
| first_col | second_col |
+-----------+------------+
| 1         | 4          |
| 2         | 3          |
| 3         | 2          |
| 4         | 1          |
+-----------+------------+
*/

-- Solution:
select 
    d1.first_col,
    d2.second_col
from (
    select 
        first_col,
        row_number() over (order by first_col asc) as rn
    from Data
) d1
inner join (
    select 
        second_col,
        row_number() over (order by second_col desc) as rn
    from Data
) d2 on d1.rn = d2.rn;
