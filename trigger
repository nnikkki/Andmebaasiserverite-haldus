--Trigerid
--SQL Trigerid - protsess,
--mille abil tema sisse
--kirjutatud tegevused automaatselt käivitatakse.

--Insert; update; delete trigerid,
--mis jälgivad antud tegevused tabelites
--ja kirjutavad logi tabeli mida nad jälgisid

create database trigerLOGIT;
use trigerLOGIT;

create table toode(
toodeID int primary key identity(1,1),
toodeNimetus varchar(25),
toodeHind decimal(5,2));
--tabel loogi, mis täidab triger
create table logi(
id int primary key identity(1,1),
tegevus varchar(25),
kuupaev datetime,
andmed text)

--insert trige, mis jälgib andmete lisamine-tabelisses
create trigger toodeLisamine
on toode
for insert
as
insert into logi(tegevus, kuupaev, andmed)
select 'toode on lisatus',
getdate(),
inserted.toodeNimetus
from inserted;

drop trigger toodeLisamine;

--kontroll
insert into toode(toodeNimetus, toodeHind)
values ('cola', 2.20);

select * from toode
select * from logi

--DELETE TRIGGER , mis jäigib kustutsmine tabelis
create trigger toodeKustutamine
on toode
for delete
as
insert into logi(tegevus, kuupaev, andmed)
select 'toode on kustutatud',
getdate(),
concat(deleted.toodeNimetus,
'| tegi kasutaja ', user)
from deleted;

--kontroll
delete from toode
where toodeID=3;
select * from toode
select * from logi

--update trigger, mis jälgib toode uuendamine tabelis
create trigger toodeUueandamine
on toode
for update
as
insert into logi(tegevus, kuupaev, andmed)
select 'toode on uuendatud',
getdate(),
concat('Vanad andmed - ', deleted.toodeNimetus, ', ',deleted.toodeHind,
'Uued andmed - ', inserted.toodeNimetus, ', ', inserted.toodeHind,
'| tegi kasutaja ', user)
from deleted inner join inserted
on deleted.toodeID=inserted.toodeID;

--kontroll
update toode set toodeHind=4.00
where toodeNimetus='Fanta'

select * from toode
select * from logi
