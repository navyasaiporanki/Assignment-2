
#Updates

#a
update phone set phones = '333-444-5555' 
where phone.primary = 1
and id = (select d.id from person join developer d on person.id = d.id where username ='charlie');


#b

SET SQL_SAFE_UPDATES = 0;
select widget.page into @page from widget where widget.name = 'head345';
select widget.order into @current_value from widget where widget.name = 'head345';
set @updated_value  = 3;

update widget set widget.order = 
case 
   when widget.name = 'head345' then @updated_value
   when (widget.order < @updated_value and widget.order > @current_value and widget.name <> 'head345') then 
	widget.order - 1
   when widget.order = @updated_value then
    widget.order -1
end
where widget.page = @page;   
SET SQL_SAFE_UPDATES = 1;


#c
SET SQL_SAFE_UPDATES = 0;
update pages set name = concat('CNET - ',name) 
where pages.website = 'CNET';


#d
Select page_role.role, page_role.page_id , page_role.developer_id into @bobRole, @pageID, @bobID 
from page_role join pages on pages.id = page_role.page_id 
where page_role.developer_id =(select id from person where username = 'bob' )  
and pages.website = 'CNET' and pages.name = 'Home';
Select page_role.role, page_role.developer_id  into @charlieRole, @charlieID
from page_role join pages on pages.id = page_role.page_id 
where page_role.developer_id =(select id from person where username = 'charlie' ) 
and pages.website = 'CNET' and pages.name = 'Home';
update page_role set role = @charlieRole where developer_id = @bobID and page_id = @pageID;
update page_role set role = @bobRole where developer_id = @charlieID and page_id = @pageID;

