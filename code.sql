SELECT (count(*)/683788)*100 as Alive_percentage FROM `bigquery-public-data.new_york_trees.tree_census_2015`
where status = 'Alive';

SELECT ((select count(*) FROM `bigquery-public-data.new_york_trees.tree_census_2015` where status='Alive')-(select count(*) FROM `bigquery-public-data.new_york_trees.tree_census_1995`))/(select count(*) FROM `bigquery-public-data.new_york_trees.tree_census_1995`)*100;

SELECT tree_size, environmental_tolerances
FROM `bigquery-public-data.new_york_trees.tree_census_2015` as cencus inner join `bigquery-public-data.new_york_trees.tree_species` as species 
on cencus.spc_latin = species.species_scientific_name
group by environmental_tolerances, tree_size
order by tree_size;

SELECT max(spc_latin) FROM `bigquery-public-data.new_york_trees.tree_census_2015`;

SELECT extract(month from plant_date) as Year, count(*) as Planted_Tree FROM `bigquery-public-data.san_francisco.street_trees` 
group by year
having year is not null
order by Planted_Tree;

SELECT extract(year from plant_date) as Year, count(*) as Planted_Tree FROM `bigquery-public-data.san_francisco.street_trees` 
group by Year
having year is not null
order by Planted_tree desc;

SELECT (select count(*)  FROM `bigquery-public-data.new_york.tree_census_2015`)/783.8 as new_york, 
(SELECT count(*)FROM `bigquery-public-data.san_francisco_trees.street_trees`)/121.4 as san_francisco;
