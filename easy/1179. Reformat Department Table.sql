/*
Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| revenue     | int     |
| month       | varchar |
+-------------+---------+
In SQL,(id, month) is the primary key of this table.
The table has information about the revenue of each department per month.
The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 

Reformat the table such that there is a department id column and a revenue column for each month.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+
Output: 
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+
Explanation: The revenue from Apr to Dec is null.
Note that the result table has 13 columns (1 for the department id + 12 for the months).
*/

-- Solution:
select 
    id,
    max(JanRevenue) as Jan_Revenue,
    max(FebRevenue) as Feb_Revenue,
    max(MarRevenue) as Mar_Revenue,
    max(AprRevenue) as Apr_Revenue,
    max(MayRevenue) as May_Revenue,
    max(JunRevenue) as Jun_Revenue,
    max(JulRevenue) as Jul_Revenue,
    max(AugRevenue) as Aug_Revenue,
    max(SepRevenue) as Sep_Revenue,
    max(OctRevenue) as Oct_Revenue,
    max(NovRevenue) as Nov_Revenue,
    max(DecRevenue) as Dec_Revenue    
from (
    select 
        id,
        if(month="Jan", revenue, NULL) as JanRevenue,
        if(month="Feb", revenue, NULL) as FebRevenue,
        if(month="Mar", revenue, NULL) as MarRevenue,
        if(month="Apr", revenue, NULL) as AprRevenue,
        if(month="May", revenue, NULL) as MayRevenue,
        if(month="Jun", revenue, NULL) as JunRevenue,
        if(month="Jul", revenue, NULL) as JulRevenue,
        if(month="Aug", revenue, NULL) as AugRevenue,
        if(month="Sep", revenue, NULL) as SepRevenue,
        if(month="Oct", revenue, NULL) as OctRevenue,
        if(month="Nov", revenue, NULL) as NovRevenue,
        if(month="Dec", revenue, NULL) as DecRevenue
    from Department
    order by id asc
) q
group by id;
