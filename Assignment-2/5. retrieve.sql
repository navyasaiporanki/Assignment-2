# Implement Queries Retrieve all Developers
#1
#a
select p.id as ID, username as Username, password as Password, first_name as First, last_name as Last,
type as Type, email as Email, developer_key as DeveloperKey from person p
join developer d on p.id =  d.id and p.type = 'developer';

#b
select distinct p.id as ID, username as Username, password as Password, first_name as First, last_name as Last,
type as Type, email as Email from person p join developer d on p.id = d.id  where p.id = 34;

#c
select person.id, first_name, last_name, username, email, developer_key, role
   from person join developer d on (person.id= d.id ) 
   join website_role  wr on (wr.developer_id=d.id) 
        join website w on (w.id=wr.website_id)
   where w.name='twitter' and role not in ('owner');

#d
select review as developers,  person.id, first_name, last_name, username, email, developer_key
 from pages join person on person.username = pages.review
 join developer d on d.id = person.id
 where views < 300000;


#e
select writer, first_name, last_name, username, email, developer_key from widget w join pages p 
on w.page = p.name
join person pp on p.writer = pp.username 
join developer d on d.id = pp.id
 where w.type = 'heading' and p.website = 'CNET' and w.page = 'Home';
 
 
 #Retrieve Websites
 #a
 select id, name, description, created, updated,  min(visits) as visits from website;

#b
select id, name  from website where id = 678;

#c

select website.name, username,role  from website join pages on 
pages.website = website.name join widget on 
widget.page = pages.name 
join page_role wr on wr.page_id = pages.id
join person p on p.id =  wr.developer_id
where widget.type = 'youtube' and username = 'bob' and role = 'review';


#d
select  name, username, role, email from website 
join website_role on website.id = website_role.website_id
join person on person.id = website_role.developer_id
 where role = 'owner' and username = 'alice';

#e
select name as website_name, username, visits, wr.role from website w join website_role wr on w.id =  wr.website_id
join person p on p.id = wr.developer_id 
join developer d on p.id = d.id
where role = 'admin' and username = 'charlie' and visits > 6000000;
 
 
 #Retireve Pages
 
 #a
    select id, name as title, description, pages.created, pages.update, max(views) 
    from pages where views=(select max(views) from pages);

#b    
select name as title from pages where id = 234;

#c
select p.id, name as title, p.description, website, p.created, p.update, p.views
 from pages p join page_role pr on p.id = pr.page_id 
join person pp on pp.id = pr.developer_id
 join developer d on d.id = pp.id
where username = 'alice' and role = 'editor';

#d
select website, sum(views) as total_views_cnet from pages 
join website w on w.name = pages.website 
where website = 'CNET';

#e
select website, avg(views) as avg_views_wiki from pages 
join website w on w.name = pages.website 
where website = 'Wikipedia';


#4 Retrieve Widgets

#a
select  p.id, p.name as title, description, website, editor, review,writer, created, p.update  from widget w 
join pages p on p.name = w.page 
where p.website = 'CNET' and p.name = 'Home';

#b
select widget.name, type, w.name, pages.name, size
    from widget join pages
    on widget.page = pages.name
    join website w on w.name = pages.website
	where 
	type='youtube' and w.name ='CNN';

#c
select w.* from pages p join widget w
on p.name = w.page
join page_role pr on pr.page_id = p.id
join person ppp on ppp.id = pr.developer_id
join developer d on d.id = ppp.id
 where username = 'alice' and role = 'review' and w.type = 'image';


#d
 
 select count(widget.id) as count_widget from widget join pages on pages.name = widget.page
 join website on website.name = pages.website where website.name = 'Wikipedia' ;
 
 
 #Retrieve triggers
 
 #a
 select website_id, name, p.username,  priviledge from website_priviledge wp
 join website w on wp.website_id = w.id
join 
  person p on p.id = wp.developer_id
  join developer d on d.id = p.id where username = 'bob'
and priviledge = 'delete';

#b
select page_id, name, priviledge from page_priviledge wp
 join pages w on wp.page_id = w.id  join
  person p on p.id = wp.developer_id
  join developer d on d.id = p.id where username = 'charlie'
and priviledge = 'create';
