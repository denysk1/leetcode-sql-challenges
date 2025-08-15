/*
Table: Experiments

+-----------------+------+
| Column Name     | Type |
+-----------------+------+
| experiment_id   | int  |
| platform        | enum |
| experiment_name | enum |
+-----------------+------+
experiment_id is the column with unique values for this table.
platform is an enum (category) type of values ('Android', 'IOS', 'Web').
experiment_name is an enum (category) type of values ('Reading', 'Sports', 'Programming').
This table contains information about the ID of an experiment done with a random person, the platform used to do the experiment, and the name of the experiment.
 

Write a solution to report the number of experiments done on each of the three platforms for each of the three given experiments. Notice that all the pairs of (platform, experiment) should be included in the output including the pairs with zero experiments.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input:
Experiments table:
+---------------+----------+-----------------+
| experiment_id | platform | experiment_name |
+---------------+----------+-----------------+
| 4             | IOS      | Programming     |
| 13            | IOS      | Sports          |
| 14            | Android  | Reading         |
| 8             | Web      | Reading         |
| 12            | Web      | Reading         |
| 18            | Web      | Programming     |
+---------------+----------+-----------------+
Output: 
+----------+-----------------+-----------------+
| platform | experiment_name | num_experiments |
+----------+-----------------+-----------------+
| Android  | Reading         | 1               |
| Android  | Sports          | 0               |
| Android  | Programming     | 0               |
| IOS      | Reading         | 0               |
| IOS      | Sports          | 1               |
| IOS      | Programming     | 1               |
| Web      | Reading         | 2               |
| Web      | Sports          | 0               |
| Web      | Programming     | 1               |
+----------+-----------------+-----------------+
Explanation: 
On the platform "Android", we had only one "Reading" experiment.
On the platform "IOS", we had one "Sports" experiment and one "Programming" experiment.
On the platform "Web", we had two "Reading" experiments and one "Programming" experiment.
*/

-- Solution:
with platforms_cte as (
    select "Android" as platform
    union
    select "IOS" as platform
    union
    select "Web" as platform
),
experiments_cte as (
    select "Reading" as experiment_name
    union
    select "Sports" as experiment_name
    union
    select "Programming" as experiment_name
),
final_cte as (
    select 
        p.platform,
        e.experiment_name
    from platforms_cte p
    cross join experiments_cte e
)
select
    f.platform, 
    f.experiment_name,
    sum(case when e.experiment_id is null then 0 else 1 end) as num_experiments
from final_cte f
left join Experiments e on f.platform = e.platform and f.experiment_name = e.experiment_name
group by f.platform, f.experiment_name;
