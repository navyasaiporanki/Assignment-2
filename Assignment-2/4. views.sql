

create view deleveloper_roles_and_privileges as 
     select distinct first_name, last_name, username, email, website.name,website.visits, website.updated,
  wr.role, wp.priviledge, pages.name as title, pages.views, pages.update , pr.role as page_role,
  pp.priviledge as page_priviledge from
   person p join developer d on p.id= d.id 
   join website_role wr on (p.id = wr.developer_id)
   join website  on (website.id = wr.website_id  and p.id = wr.developer_id)
    join website_priviledge wp on (wp.developer_id = p.id  and wp.website_id = website.id)
    join pages on (pages.id = website.id)
  join page_role pr on (pr.developer_id  = p.id and pr.page_id = pages.id)
   join page_priviledge pp on (pp.page_id = pr.page_id and pr.developer_id = pp.developer_id);