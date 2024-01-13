----ETL customer Dim
select c.customer_id ,c.first_name,c.last_name,email ,ass.address_status, street_number,street_name,
city,country_name as country
from customer c left outer join customer_address ca
on c.customer_id = ca.customer_id
left outer join address a
on ca.address_id = a.address_id
left outer join country co
on a.country_id = co.country_id
left outer join address_status ass
on ass.status_id = ca.status_id


----ETL book Dimension 
select b.book_id , title,publication_date,isbn13 ,num_pages ,au.author_name , bl.language_name,bl.language_code , pu.publisher_name from book b 
left outer join book_author  ba on b.book_id=ba.book_id 
 left outer join author au on au.author_id=ba.author_id
 left outer join book_language bl on bl.language_id=b.language_id
 left outer join publisher pu on pu.publisher_id=b.publisher_id



 ---ETL shipping Dim
 select method_id,method_name from shipping_method