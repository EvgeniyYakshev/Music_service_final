-- Создание таблицы "Жанры"
CREATE TABLE IF NOT exists Genres (
    id SERIAL PRIMARY KEY,
    title_genre VARCHAR(60) NOT null UNIQUE
);

--INSERT
--Добавим новые жанры
INSERT into Genres(title_genre)
VALUES('Rock'), ('Heavy metal'), ('Hard rock'), ('Psychedelic rock'), ('Pop'), ('British heavy metal'), ('Blues rock'), ('Country'), ('Rap');

--Создание таблицы "Исполнители"
CREATE TABLE IF NOT exists Performers (
    id SERIAL PRIMARY KEY,
    name_alias VARCHAR(60) NOT null
);

--INSERT
--Добавим новых исполнителей
INSERT INTO	Performers(name_alias)
VALUES('Queen'), ('Scorpions'), ('Europe'), ('Pink Floyd'), ('The Beatles'), ('Iron Maiden'), ('The Animals'), ('Blake Shelton'), ('Eminem');

--DELETE 
--Удалим запись об исполнителе
--DELETE from Performers
--where performer_id = 8;

--update Performers
--set name_alias = 'Blake Shelton'
--where performer_id = 10;

--Создание таблицы "Жанр-Исполнитель"
-- многие ко многим
CREATE TABLE IF NOT exists Genres_performers (
    id serial primary key,
    g_id integer references Genres(id),
    p_id integer references Performers(id)
    --constraint pg primary key (g_id, p_id)
);

--INSERT
--Добавим связи между "Жанр-Исполнитель"
INSERT into Genres_performers(g_id, p_id)
VALUES('1', '1'),('2', '2'),('3', '3'),('4', '4'),('5', '5'), ('6', '6'), ('7', '7'),('8', '8'),('9', '9');

--Создание таблицы "Альбомы"
CREATE TABLE IF NOT exists Albums (
    id SERIAL PRIMARY KEY,
    title_album VARCHAR(60) NOT null,
    year_of_release integer NOT null,
    constraint yor CHECK (year_of_release > 1970)
);

--INSERT
--Добавим новые альбомы
INSERT into Albums(title_album, year_of_release)
VALUES('Live Killers','1979'), ('Live Magic','1986'), ('Hungarian Rhapsody','2004'), ('Live Bites','1995'), ('Unbreakable','2004'), ('Face The Heat','1993'), ('Start from the Dark','2006'), ('Last Look at Eden','2009'), ('Bag Of Bones','2012'), ('Relics','1996'), ('The Dark Side Of The Moon','2011'), ('A Collection Of Great Dance Songs','1988'), ('Raw Energy','1990'), ('Moviemania!','1989'), ('20 Greatest Hits','1982'), ('No Prayer for the Dying','1990'), ('Live at Donington','2002'), ('Somewhere Back in Time','2008'), ('The Singles Plus','1987'), ('Most of the Animals','1992'), ('The Best of the Animals','1996'), ('The Dreamer','2003'), ('Hillbilly Bone','2010'), ('Body Language','2021'), ('The Slim Shady LP','1999'), ('The Marshall Mathers LP','2001'), ('Revival','2017');

--Создание таблицы "Альбом-Исполнитель"
-- многие ко многим
CREATE TABLE IF NOT exists albums_performers (
    id serial primary key,
    album_id integer references Albums(id),
    per_id integer references Performers(id)
    --constraint aper primary key (a_id, per_id)
);

--INSERT
--Добавим связи между "Альбом-Исполнитель"
INSERT into albums_performers(album_id, per_id)
VALUES('1', '1'),('2', '1'),('3', '1'),('4', '2'),('5', '2'),('6', '2'),('7', '3'),('8', '3'),('9', '3'),('10', '4'),('11', '4'),('12', '4'),('13', '5'),('14', '5'),('15', '5'),('16', '6'),('17', '6'),('18', '6'),('19', '7'),('20', '7'),('21', '7'),('22', '8'),('23', '8'),('24', '8'),('25', '9'),('26', '9'),('27', '9');


--Создание таблицы "Музыкальные треки"
-- один к одному
CREATE TABLE IF NOT exists Music_tracks (
    id serial primary key,
    title_track VARCHAR(60) NOT null,
    duration double precision NOT null,
    album_id integer references Albums(id)
);

--INSERT
--Добавим новые музыкальные треки
INSERT into Music_tracks(title_track, duration, album_id)
VALUES('We Will Rock You','3.16','1'), ('Let Me Entertain You','3.15','1'), ('Death On Two Legs','3.33','1'), ('One Vision','5.08','2'), ('Tie Your Mother Down','2.59','2'), ('Seven Seas Of Rhye','1.19','2'), ('
I Want To Break Free','3.37','3'), ('Love Of My Life','4.42','3'), (' In The Lap Of The Gods','2.17','3'),('Tease Me Please Me','4.52','4'), ('Is There Anybody There','4.08','4'), ('No Pain No Gain','4.07','4'), ('New Generation','5.51','5'), ('Deep and Dark','3.37','5'), ('Blood Too Hot','4.16','5'), ('Alien Nation','5.44','6'), ('No Pain No Gain','3.55','6'),('Someone To Touch','4.29','6'), (' Got to Have Faith','3.11','7'), (' Start from the Dark','4.12','7'), ('Flames','3.56','7'), (' Prelude','0.54','8'), ('Last Look at Eden','3.55','8'), (' Gonna Get Ready','3.33','8'), (' Riches to Rags','3.05','9'), (' Not Supposed to Sing the Blues','5.13','9'), ('Firebox','3.47','9'), ('Arnold Layne','2.56','10'), (' Interstellar Overdrive','9.42','10'), (' See Emily Play','2.54','10'), (' Speak To Me','1.04','11'), (' Breathe','2.50','11'), ('On The Run','3.36','11'), (' One Of These Days','5.15','12'), (' Money','6.47','12'), (' Sheep','9.47','12'), ('Till There Was You','2.54','13'), ('Take Good Care Of My Baby','2.16','13'), ('Memphis','2.12','13'), ('
A Hard Days Night','3.12','14'), ('
Help','2.21','14'), ('Three Cool Cats','2.56','14'), ('She Loves You','2.21','15'), ('
Love Me Do','2.25','15'), ('
I Want to Hold Your Hand','2.13','15'), ('Tailgunner','4.14','16'), (' Holy Smoke','3.49','16'),(' No Prayer for the Dying','4.23','16'),('Be Quick or Be Dead','3.53','17'),(' The Number of the Beast','4.54','17'),(' Wrathchild','4.44','17'),(' Aces High','4.38','18'),(' Wasted Years','5.07','18'),(' Children of the Damned ','4.35','18'),('Baby Let Me Take You Home','2.22','19'),(' Gonna Send You Back to Walker','2.28','19'),('House of the Rising Sun','4.29','19'),(' Worried Life Blues','4.13','20'),(' Roadrunner','2.51','20'),('Let the Good Times Rol','1.57','20'),(' Baby Let Me Take You Home','2.22','21'),(' Boom Boom','3.18','21'),(' Gonna Send You Back to Walker','2.28','21'),(' The Baby','3.55','22'),(' Asphalt Cowboy','3.39','22'),(' In My Heaven','3.10','22'),(' Hillbilly Bone','3.45','23'),(' Kiss My Country Ass','4.12','23'),(' Delilah','3.41','23'),(' Come Back as a Country Boy','3.42','24'),(' Minimum Wage','3.48','24'),(' Monday Mornin Missin You','3.40','24'),(' Public Service Announcement','0.33','25'),(' My Name Is','4.28','25'),(' Guilty Conscience','3.20','25'),(' The Real Slim Shady','4.44','26'),('The Way I Am','4.51','26'),(' Stan','6.43','26'),(' Walk On Water','5.03','27'),(' Chloraseptic','5.01','27'),(' Untouchable','6.10','27');

--Создание таблицы "Сборник"
CREATE TABLE IF NOT exists Colection (
    id SERIAL PRIMARY KEY,
    title_colection VARCHAR(60) NOT null,
    year_of_release integer NOT null,
    constraint yorel CHECK (year_of_release > 1960)
);

--INSERT
--Добавим новые сборники
INSERT into Colection(title_colection, year_of_release)
VALUES('Colection one','2010'), ('Colection two','2011'), ('Colection  three','2012'), ('Colection  four','2013'),('Colection  five','2014'),('Colection  six','2015'),('Colection  seven','2016'),('Colection  eight','2018'),('Colection   nine','2019'),('Colection  ten','2020'); 


--Создание таблицы "Сборник-Трек"
-- многие ко многим
CREATE TABLE IF NOT exists colections_tracks (
    id SERIAL PRIMARY KEY,
    col_id integer not null references Colection(id),
    track_id integer not null references Music_tracks(id)
);


--INSERT
--Добавим связи между "Сборник-Трек"
INSERT into colections_tracks(col_id, track_id)
VALUES('1', '1'),('2', '2'),('3', '3'),('4', '4'),('5', '5'),('6', '6'),('2', '7'),('7', '8'),('6', '9'),('3', '10'),('8', '11'),('5', '12'),('9', '13'),('2', '14'),('10', '15'),('3', '16'),('9', '17'),('2', '18'),('5', '19'),('6', '20'),('4', '21'),('2', '22'),('3', '23'),('1', '24'),('10', '25'),('9', '26'),('2', '27'),('5', '28'),('6', '29'),('2', '30'),('1', '31'),('9', '32'),('4', '33'),('10', '34'),('7', '35'),('9', '36'),('1', '37'),('9', '38'),('2', '39'),('3', '40'),('8', '41'),('6', '42'),('10', '43'),('5', '44'),('8', '45'),('1', '46'),('4', '47'),('4', '48'),('10', '49'),('6', '50'),('3', '51'),('1', '52'),('7', '53'),('5', '54'),('8', '55'),('1', '56'),('9', '57'),('6', '58'),('10', '59'),('6', '60'),('3', '61'),('4', '62'),('8', '63'),('1', '64'),('7', '65'),('5', '66'),('5', '67'),('3', '68'),('10', '69'),('4', '70'),('8', '71'),('1', '72'),('7', '73'),('8', '74'),('9', '75'),('10', '76'),('7', '77'),('8', '78'),('7', '79'),('7', '80'),('4', '81');

-------------------------------------------------------------------------------------------------------------------------------------

-- 1. Агрегирующие функции
-- найдем: Название и продолжительность самого длительного трека.
SELECT title_track, duration FROM Music_tracks
WHERE duration = (SELECT MAX(duration) FROM Music_tracks);


-- 2. Агрегирующие функции
-- найдем: Название треков, продолжительность которых не менее 3,5 минут.
select title_track, duration FROM Music_tracks
where duration >= 3.5 
GROUP by title_track, duration
ORDER BY duration DESC;



-- 3. Агрегирующие функции
-- найдем: Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title_colection FROM  Colection 
where year_of_release between 2018 and 2020;


-- 4. Агрегирующие функции
-- найдем: Исполнители, чьё имя состоит из одного слова.
select * from Performers
WHERE name_alias NOT LIKE '% %';



-- 5. Агрегирующие функции
-- найдем: Название треков, которые содержат слово «мой» или «my».
SELECT title_track from Music_tracks
where title_track LIKE '%My%';


---------------------------------------------------------------------------------------------------------------------------------------

-- 1. Агрегирующие функции
-- найдем: Количество исполнителей в каждом жанре.
SELECT title_genre,COUNT(name_alias) FROM Performers
JOIN Genres_performers ON Performers.id = Genres_performers.p_id
JOIN Genres ON Genres_performers.g_id = Genres.id
GROUP BY title_genre;



-- 2. Агрегирующие функции
-- найдем: Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT year_of_release,COUNT(title_track) FROM albums a
JOIN Music_tracks t  ON a.id = t.album_id
WHERE a.year_of_release  >= 2017 AND a.year_of_release <= 2021
GROUP BY year_of_release;



-- 3. Агрегирующие функции
-- найдем: Средняя продолжительность треков по каждому альбому.
SELECT title_album,AVG(duration) FROM albums a
JOIN Music_tracks t  ON a.id = t.album_id
GROUP BY title_album;



-- 4. Агрегирующие функции
-- найдем: Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT name_alias,year_of_release FROM albums a
JOIN albums_performers ap  ON a.id = ap.album_id
JOIN Performers p  ON ap.per_id = p.id
WHERE a.year_of_release != 1996;



-- 5. Агрегирующие функции
-- найдем: Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT title_colection FROM Colection c
JOIN colections_tracks ct  ON c.id = ct.col_id
JOIN Music_tracks t  ON ct.track_id = t.id
JOIN albums a  ON t.album_id = a.id
JOIN albums_performers ap  ON a.id = ap.album_id
JOIN Performers p  ON ap.per_id = p.id
WHERE p.name_alias LIKE 'Eminem'
ORDER BY title_colection ASC;

--------------------------------------------------------------------------------------------------------------------------------------

-- 1. Агрегирующие функции
-- найдем: Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT title_album FROM albums a
JOIN albums_performers ap  ON a.id = ap.album_id
JOIN Performers p  ON ap.per_id = p.id
JOIN Genres_performers gp  ON p.id = gp.p_id
GROUP BY p.name_alias, a.title_album
HAVING count(gp.g_id) > 1;



-- 2. Агрегирующие функции
-- найдем: Наименования треков, которые не входят в сборники.
SELECT title_track FROM Music_tracks t
LEFT JOIN colections_tracks ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL;



-- 3. Агрегирующие функции
-- найдем: Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT p.name_alias, t.duration FROM Performers p
JOIN albums_performers ap ON p.id = ap.per_id
JOIN albums a ON ap.album_id = a.id
JOIN Music_tracks t ON a.id = t.album_id
WHERE t.duration IN (SELECT MIN(duration) FROM Music_tracks);



-- 4. Агрегирующие функции
-- найдем: Названия альбомов, содержащих наименьшее количество треков.
SELECT a.title_album, COUNT(t.id) FROM albums a
JOIN Music_tracks t  ON a.id = t.album_id
GROUP BY a.title_album 
HAVING count(t.id) in (
    SELECT COUNT (t.id)
    FROM albums a
    JOIN Music_tracks t  ON a.id = t.album_id
    GROUP BY a.title_album
    ORDER BY count(t.id)
    LIMIT 1);
