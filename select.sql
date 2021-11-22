1.SELECT album_name, album_date  from album where album_date = 2018
2 SELECT track_name,duration from track where duration = (select max(duration) from track)
3 SELECT track_name from track where duration > 330
3 SELECT collection_album_name  from collection_album where collection_album_date between 2017 and 2020
4 select nickname from singer where not nickname like '%% %%'
5 select track_name from track where track_name like '%%my%%'