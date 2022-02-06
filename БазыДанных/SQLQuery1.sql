--1. Напишите команду SELECT которая бы вывела номера заказов,
 --сумму, и дату для всех строк из таблицы Заказов. 

--select onum, amt, odate from orders

--4. Напишите запрос, который вывел бы все строки из
 --таблицы Заказов, для которых номер продавца = 1001. 

 --select * from orders where snum=1001

 --8. Напишите команду SELECT которая вывела бы имя и
 --комиссионные каждого продавца из города London. 

 --select sname,comm from Salespeople where city='London'

 --9. Напишите  запрос  который вывел бы значения snum
 --всех продавцов из таблицы Заказов
 --без каких бы то ни было  повторений.

 --select snum from Orders group by snum

 --1. Напишите запрос который может дать вам все  заказы
  --со  значениями суммы заказа выше чем 1,000. 

  --select * from orders where snum>1000

  --4. Напишите запрос, который может выдать вам поля cname и city
 --для всех заказчиков из города San Jose с рейтингом выше 150.

-- select cname,city from Customers where rating>150

--7. Напишите запрос к таблице Продавцов, который дает
--всех Продавцов таких что, если он из города London,
--то его комиссионные не выше 0.11, а иначе - выше 0.13. 

--select sname from Salespeople where city='London' and comm IN( 0.10,0.11,0.14)
--select * from Salespeople where (comm between .10 and .12) and not comm in (.10, .12);--и это воттттттттттт

--1. Напишите запрос, который выведет все заказы на 3 или 4 Октября 2015


--select * from orders where odate in ('2015-10-03','2015-10-04') -- вот это вотттттттттттт

--4. Напишите запрос,  который может вывести всех заказчиков
--чьи  имена начинаются с буквы попадающей в диапазон от A до G.

--select sname from Salespeople where sname between 'A' and 'H'

--7. Напишите запрос, который выберет всех продавцов,
-- чьи имена  заканчиваются на букву s.

--select sname from Salespeople where sname='%s'

--1. Напишите запрос который сосчитал бы все суммы
--приобретений на 3 Октября.

--select sum(amt) from orders where odate='2015-10-03'

--4. Напишите  запрос, который сосчитал бы число различных
 --значений поля city в таблице Продавцов.

 --select count(distinct city) from Salespeople 

 --10. Напишите запрос, который выбрал бы наименьшую сумму
 --заказа для каждого дня.

 --select cnum, MIN(amt) from orders group by cnum;

 --1. Предположим  что каждый продавец имеет 12%  комиссионных.
  --Напишите запрос к таблице Заказов который мог бы вывести
  --номер порядка, номер продавца, и сумму комиссионных продавца
  --для этого заказа. 

 --select onum, snum, amt * .12 from Orders; 

 --4.Напишите запрос к таблице Продавцов, который мог  бы
  --найти  наименьшие комиссионные в каждом городе.
  --Вывод должен быть в такой форме:
  --В городе <Наименование> наименьшие комиссионные <Значение>. */

	
 --select 'В городе ',city,' наименьшие комиссионные ' , min(comm) from Salespeople group by city

 --7. Напишите запрос который бы выводил общую сумму заказов 
--на каждый  день  и помещал результаты в нисходящем порядке. 

--select odate, sum(amt) from orders 
--group by odate 
--order by 2 desc

--1. Напишите  запрос который бы вывел список номеров заказов
 --сопровождающихся именем заказчика который создавал их.

 --select onum,sname from Orders,Salespeople where Orders.snum = Salespeople.snum

 --5. Напишите  запрос  который  бы выводил всех заказчиков
 --обслуживаемых продавцом с комиссионными выше 12%  .
 --Выведите имя заказчика,  имя продавца,
 --и ставку комиссионных продавца. 

 --select cname,sname,comm from Customers,Salespeople where Customers.snum = Salespeople.snum and comm>0.12

 --7. Напишите запрос который вычислил бы сумму комиссионных
 --продавца для каждого заказа заказчика с рейтингом выше 100.

 --select comm, cname ,rating from Customers,Salespeople where rating>100

 --select sname, cname from Salespeople, Customers where sname < cname and rating > 100;--Это воттт


 --select onum, comm * amt 
 --from Salespeople, Orders, Customers 
 --where rating > 100 and Orders.cnum = Customers.cnum and Orders.snum = Salespeople.snum; 
 
 --1. Напишите запрос который бы вывел все пары продавцов
 --живущих в одном и том же городе.  Исключите комбинации
 --продавцов с ними же, а также дубликаты строк выводимых
 --в обратным порядке.

 --select first.sname ,second.sname from Salespeople first ,Salespeople second 
 --where first.city = second.city and first.sname < second.sname

 --2. Напишите запрос, который бы вывел все пары имен заказчиков,
 --которым назначен один и тот же обслуживающий продавец,
 --номер продавца тоже включите в выходную строку.
 --Исключите пары вида (А,А) и повторы вида (А,Б), (Б,А).

 --select first.cname ,second.cname from Customers first , Customers second 
 --where first.snum = second.snum and first.cname != second.cname
 --Order by first.cname 

--5. Напишите  запрос  который вывел бы имена(cname)
 --и города(city) всех заказчиков с такой же оценкой(rating)
 --как у Hoffmanа. Напишите запрос использующий поле cnum
 --Hoffmanа а не его оценку,  так чтобы оно могло быть
 --использовано если его оценка вдруг изменится. 

--select a.cname, a.city from Customers a, Customers b where a.rating = b.rating and b.cnum = 2001; 

--1. Напишите  запрос,  который  бы  использовал подзапрос для получения
-- всех заказов заказчика с именем Cisneros.  Предположим, что вы
-- не знаете номера этого заказчика, указываемого в поле cnum.

--select* from orders where cnum =(select cnum from customers where cname = 'Cisneros')

--5. Напишите запрос который бы выбрал общую сумму всех  приобретений  в
--заказах  для  каждого продавца,  у которого эта общая сумма больше
-- чем наибольшая стоимость заказов в таблице.

 --select snum, sum(amt) from Orders group by snum 
 --having SUM (amt) > (select max(amt) from Orders); 

-- 4. Напишите запрос который вывел бы имена и комиссионные тех продавцов,
-- которые обслуживают хотя бы одного заказчика с рейтингом выше среднего.	

--select distinct sname, comm,cname,rating
--from salespeople, orders, customers where rating > (select AVG (rating) from customers)
--and orders.snum = salespeople.snum and orders.snum = customers.snum;

--select distinct cname, rating from Customers, Orders where rating > (select avg (rating) from Customers) and Orders.cnum = Customers.cnum;--это?


--1. Напишите команду SELECT использующую соотнесенный подзапрос,  кото-
--   рая  выберет  имена и номера всех заказчиков с максимальными для их
--   городов рейтингами.

--select cnum, cname from Customers c1 
--where rating = (select MAX (rating) from Customers c2 
--         where c1.city = c2.city);

--4. Напишите запрос который бы использовал оператор EXISTS для извлече-
--   ния всех продавцов которые имеют заказчиков с оценкой 300.

-- select * from Salespeople first 
-- where EXISTS 
--(select * from Customers second 
-- where first.snum = second.snum and rating = 300); 

--6. Напишите  запрос  который извлекал бы из таблицы Заказчиков каждого
--   заказчика назначенного к продавцу который в данный момент имеет  по
--   крайней мере еще одного заказчика ( кроме заказчика которого вы вы-
--   берете ) с заказами в таблице Заказов

--select * from Customers a 
--where exists (select * from Orders b 
--where a.snum = b.snum 
--and a.cnum != b.cnum) 
 






 --6.
--SELECT * from salespeople where city != 'London' and comm > 0.11;

 --7. Напишите запрос к таблице Продавцов, который дает
--всех Продавцов таких что, если он из города London,
--то его комиссионные не выше 0.11, а иначе - выше 0.13. 

--select sname from Salespeople where city='London' and comm IN( 0.10,0.11,0.14)
--select * from Salespeople where (comm between .10 and .12) and not comm in (.10, .12);--и это воттттттттттт

--1. Напишите запрос, который выведет все заказы на 3 или 4 Октября 2015


--select * from orders where odate in ('2015-10-03','2015-10-04') -- вот это вотттттттттттт

 -- 4. Напишите запрос который вывел бы имена и комиссионные тех продавцов,
-- которые обслуживают хотя бы одного заказчика с рейтингом выше среднего.	

--select distinct sname, comm,cname,rating
--from salespeople, orders, customers where rating > (select AVG (rating) from customers)
--and orders.snum = salespeople.snum and orders.snum = customers.snum;

--select distinct cname, rating from Customers, Orders where rating > (select avg (rating) from Customers) and Orders.cnum = Customers.cnum;--это

