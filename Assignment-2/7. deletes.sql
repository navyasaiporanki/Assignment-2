
#Deletes

#a
delete from address where address.primary = 1 
and id = (select p.id from person p join developer d on p.id = d.id where username = 'alice')  ;

#b

delete widget from widget join pages on pages.name = widget.page where pages.name = 'Contact' 
and widget.order =(select x from (select max(widget.order) as x from widget ) as y); 

#c
DELETE pages FROM pages JOIN website
	ON pages.website = website.name
WHERE website.name = 'Wikipedia'and pages.update in (SELECT x from (select max(pages.update) as x from pages) as x);

						
#d 
delete from website where website.name = 'CNET';  -- will delete roles because of triggers
