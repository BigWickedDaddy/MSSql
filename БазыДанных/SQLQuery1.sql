--1. �������� ������� SELECT ������� �� ������ ������ �������,
 --�����, � ���� ��� ���� ����� �� ������� �������. 

--select onum, amt, odate from orders

--4. �������� ������, ������� ����� �� ��� ������ ��
 --������� �������, ��� ������� ����� �������� = 1001. 

 --select * from orders where snum=1001

 --8. �������� ������� SELECT ������� ������ �� ��� �
 --������������ ������� �������� �� ������ London. 

 --select sname,comm from Salespeople where city='London'

 --9. ��������  ������  ������� ����� �� �������� snum
 --���� ��������� �� ������� �������
 --��� ����� �� �� �� ����  ����������.

 --select snum from Orders group by snum

 --1. �������� ������ ������� ����� ���� ��� ���  ������
  --��  ���������� ����� ������ ���� ��� 1,000. 

  --select * from orders where snum>1000

  --4. �������� ������, ������� ����� ������ ��� ���� cname � city
 --��� ���� ���������� �� ������ San Jose � ��������� ���� 150.

-- select cname,city from Customers where rating>150

--7. �������� ������ � ������� ���������, ������� ����
--���� ��������� ����� ���, ���� �� �� ������ London,
--�� ��� ������������ �� ���� 0.11, � ����� - ���� 0.13. 

--select sname from Salespeople where city='London' and comm IN( 0.10,0.11,0.14)
--select * from Salespeople where (comm between .10 and .12) and not comm in (.10, .12);--� ��� �������������

--1. �������� ������, ������� ������� ��� ������ �� 3 ��� 4 ������� 2015


--select * from orders where odate in ('2015-10-03','2015-10-04') -- ��� ��� ��������������

--4. �������� ������,  ������� ����� ������� ���� ����������
--���  ����� ���������� � ����� ���������� � �������� �� A �� G.

--select sname from Salespeople where sname between 'A' and 'H'

--7. �������� ������, ������� ������� ���� ���������,
-- ��� �����  ������������� �� ����� s.

--select sname from Salespeople where sname='%s'

--1. �������� ������ ������� �������� �� ��� �����
--������������ �� 3 �������.

--select sum(amt) from orders where odate='2015-10-03'

--4. ��������  ������, ������� �������� �� ����� ���������
 --�������� ���� city � ������� ���������.

 --select count(distinct city) from Salespeople 

 --10. �������� ������, ������� ������ �� ���������� �����
 --������ ��� ������� ���.

 --select cnum, MIN(amt) from orders group by cnum;

 --1. �����������  ��� ������ �������� ����� 12%  ������������.
  --�������� ������ � ������� ������� ������� ��� �� �������
  --����� �������, ����� ��������, � ����� ������������ ��������
  --��� ����� ������. 

 --select onum, snum, amt * .12 from Orders; 

 --4.�������� ������ � ������� ���������, ������� ���  ��
  --�����  ���������� ������������ � ������ ������.
  --����� ������ ���� � ����� �����:
  --� ������ <������������> ���������� ������������ <��������>. */

	
 --select '� ������ ',city,' ���������� ������������ ' , min(comm) from Salespeople group by city

 --7. �������� ������ ������� �� ������� ����� ����� ������� 
--�� ������  ����  � ������� ���������� � ���������� �������. 

--select odate, sum(amt) from orders 
--group by odate 
--order by 2 desc

--1. ��������  ������ ������� �� ����� ������ ������� �������
 --���������������� ������ ��������� ������� �������� ��.

 --select onum,sname from Orders,Salespeople where Orders.snum = Salespeople.snum

 --5. ��������  ������  �������  �� ������� ���� ����������
 --������������� ��������� � ������������� ���� 12%  .
 --�������� ��� ���������,  ��� ��������,
 --� ������ ������������ ��������. 

 --select cname,sname,comm from Customers,Salespeople where Customers.snum = Salespeople.snum and comm>0.12

 --7. �������� ������ ������� �������� �� ����� ������������
 --�������� ��� ������� ������ ��������� � ��������� ���� 100.

 --select comm, cname ,rating from Customers,Salespeople where rating>100

 --select sname, cname from Salespeople, Customers where sname < cname and rating > 100;--��� �����


 --select onum, comm * amt 
 --from Salespeople, Orders, Customers 
 --where rating > 100 and Orders.cnum = Customers.cnum and Orders.snum = Salespeople.snum; 
 
 --1. �������� ������ ������� �� ����� ��� ���� ���������
 --������� � ����� � ��� �� ������.  ��������� ����������
 --��������� � ���� ��, � ����� ��������� ����� ���������
 --� �������� �������.

 --select first.sname ,second.sname from Salespeople first ,Salespeople second 
 --where first.city = second.city and first.sname < second.sname

 --2. �������� ������, ������� �� ����� ��� ���� ���� ����������,
 --������� �������� ���� � ��� �� ������������� ��������,
 --����� �������� ���� �������� � �������� ������.
 --��������� ���� ���� (�,�) � ������� ���� (�,�), (�,�).

 --select first.cname ,second.cname from Customers first , Customers second 
 --where first.snum = second.snum and first.cname != second.cname
 --Order by first.cname 

--5. ��������  ������  ������� ����� �� �����(cname)
 --� ������(city) ���� ���������� � ����� �� �������(rating)
 --��� � Hoffman�. �������� ������ ������������ ���� cnum
 --Hoffman� � �� ��� ������,  ��� ����� ��� ����� ����
 --������������ ���� ��� ������ ����� ���������. 

--select a.cname, a.city from Customers a, Customers b where a.rating = b.rating and b.cnum = 2001; 

--1. ��������  ������,  �������  ��  ����������� ��������� ��� ���������
-- ���� ������� ��������� � ������ Cisneros.  �����������, ��� ��
-- �� ������ ������ ����� ���������, ������������ � ���� cnum.

--select* from orders where cnum =(select cnum from customers where cname = 'Cisneros')

--5. �������� ������ ������� �� ������ ����� ����� ����  ������������  �
--�������  ���  ������� ��������,  � �������� ��� ����� ����� ������
-- ��� ���������� ��������� ������� � �������.

 --select snum, sum(amt) from Orders group by snum 
 --having SUM (amt) > (select max(amt) from Orders); 

-- 4. �������� ������ ������� ����� �� ����� � ������������ ��� ���������,
-- ������� ����������� ���� �� ������ ��������� � ��������� ���� ��������.	

--select distinct sname, comm,cname,rating
--from salespeople, orders, customers where rating > (select AVG (rating) from customers)
--and orders.snum = salespeople.snum and orders.snum = customers.snum;

--select distinct cname, rating from Customers, Orders where rating > (select avg (rating) from Customers) and Orders.cnum = Customers.cnum;--���?


--1. �������� ������� SELECT ������������ ������������ ���������,  ����-
--   ���  �������  ����� � ������ ���� ���������� � ������������� ��� ��
--   ������� ����������.

--select cnum, cname from Customers c1 
--where rating = (select MAX (rating) from Customers c2 
--         where c1.city = c2.city);

--4. �������� ������ ������� �� ����������� �������� EXISTS ��� �������-
--   ��� ���� ��������� ������� ����� ���������� � ������� 300.

-- select * from Salespeople first 
-- where EXISTS 
--(select * from Customers second 
-- where first.snum = second.snum and rating = 300); 

--6. ��������  ������  ������� �������� �� �� ������� ���������� �������
--   ��������� ������������ � �������� ������� � ������ ������ �����  ��
--   ������� ���� ��� ������ ��������� ( ����� ��������� �������� �� ��-
--   ������ ) � �������� � ������� �������

--select * from Customers a 
--where exists (select * from Orders b 
--where a.snum = b.snum 
--and a.cnum != b.cnum) 
 






 --6.
--SELECT * from salespeople where city != 'London' and comm > 0.11;

 --7. �������� ������ � ������� ���������, ������� ����
--���� ��������� ����� ���, ���� �� �� ������ London,
--�� ��� ������������ �� ���� 0.11, � ����� - ���� 0.13. 

--select sname from Salespeople where city='London' and comm IN( 0.10,0.11,0.14)
--select * from Salespeople where (comm between .10 and .12) and not comm in (.10, .12);--� ��� �������������

--1. �������� ������, ������� ������� ��� ������ �� 3 ��� 4 ������� 2015


--select * from orders where odate in ('2015-10-03','2015-10-04') -- ��� ��� ��������������

 -- 4. �������� ������ ������� ����� �� ����� � ������������ ��� ���������,
-- ������� ����������� ���� �� ������ ��������� � ��������� ���� ��������.	

--select distinct sname, comm,cname,rating
--from salespeople, orders, customers where rating > (select AVG (rating) from customers)
--and orders.snum = salespeople.snum and orders.snum = customers.snum;

--select distinct cname, rating from Customers, Orders where rating > (select avg (rating) from Customers) and Orders.cnum = Customers.cnum;--���

