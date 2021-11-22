select g.genre_name, count(e.nickname)
from genre as g
left join singer_genre as ge on g.id = ge.genre_id
left join singer as e on ge.singer_id = e.id
group by g.genre_name
order by count(e.id) desc


select a.album_name, a.album_date
from album as a
left join track as t on t.album_id = a.id
where (a.album_date >= 2019) and (a.album_date <= 2020)

select a.album_name, AVG(t.duration)
from album as a
left join track as t on t.album_id = a.id
group by a.album_name
order by AVG(t.duration)

select distinct s.nickname
from singer as s
where s.nickname not in (
    select distinct s.nickname
    from singer as s
    left join singer_album as sa on s.id = sa.singer_id
    left join album as a on a.id = sa.album_id
    where a.album_date = 2020
)
order by s.nickname


select distinct c.collection_album_name
from collection_album as c
left join collection_track as ct on c.id = ct.collection_album_id
left join track as t on t.id = ct.track_id
left join album as a on a.id = t.album_id
left join singer_album as sa on sa.album_id = a.id
left join singer as s on s.id = sa.singer_id
where s.nickname like '%%50cent%%'
order by c.collection_album_name


select a.album_name
from album as a
left join singer_album as sa on a.id = sa.album_id
left join singer as s on s.id = sa.singer_id
left join singer_genre as sg on s.id = sg.singer_id
left join genre as g on g.id = sg.genre_id
group by a.album_name
having count(distinct g.genre_name) > 1
order by a.album_name

select t.track_name
from track as t
left join collection_track as ct on t.id = ct.track_id
where ct.track_id is null


select s.nickname, t.duration
from track as t
left join album as a on a.id = t.album_id
left join singer_album as sa on sa.album_id = a.id
left join singer as s on s.id = sa.singer_id
group by s.nickname, t.duration
having t.duration = (select min(duration) from track)
order by s.nickname


select distinct a.album_name
from album as a
left join track as t on t.album_id = a.id
where t.album_id in (
    select album_id
    from track
    group by album_id
    having count(id) = (
        select count(id)
        from track
        group by album_id
        order by count
        limit 1
    )
)
order by a.album_name


