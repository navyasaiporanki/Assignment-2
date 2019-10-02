DELIMITER $$
create TRIGGER AFTER_PAGES_UPDATE
  AFTER UPDATE ON pages
  FOR EACH ROW   
  BEGIN
  
        delete from page_priviledge where developer_id = 
          (select id from person where username = (old.editor)) and page_id = old.id; 
          
	  set @x = (select id from person where username = (new.editor)); 
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'read' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'update' );
    
     

        delete from page_priviledge where developer_id = 
          (select id from person where username = (old.writer)) and page_id = old.id; 
          
	  set @x = (select id from person where username = (new.writer)); 
	  insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'create' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'read' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'update' );
    
     
	
        delete from page_priviledge where developer_id = 
          (select id from person where username = (old.review)) and page_id = old.id; 
          
	 set @x = (select id from person where username = (new.review)); 
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'read' );

  END$$
  DELIMITER ;
  
  
  
  
  DELIMITER $$
create TRIGGER AFTER_PAGES_INSERT
  AFTER INSERT ON pages
  FOR EACH ROW   
  BEGIN
	  set @x = (select id from person where username = (new.editor)); 
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'read' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'update' );
      
	  set @x = (select id from person where username = (new.writer)); 
	  insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'create' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'read' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'update' );
      
	 set @x = (select id from person where username = (new.review)); 
      insert into page_priviledge(developer_id, page_id,priviledge ) values (@x,new.id,'read' );
  END$$
  DELIMITER ;
  
  
  DELIMITER $$
create TRIGGER AFTER_WEBSITE_UPDATE
  AFTER UPDATE ON website
  FOR EACH ROW   
  BEGIN
  
  if new.owner <> old.owner
   then
      delete from website_priviledge where developer_id = 
          (select id from person where username = (old.owner)) and website_id = old.id; 
	  set @x = (select id from person where username = (new.owner)); 
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'create' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'update' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'delete' );
   end if ; 
   
     if new.editor <> old.editor
   then
         delete from website_priviledge where developer_id = 
          (select id from person where username = (old.editor)) and website_id = old.id; 
	  set @x = (select id from person where username = (new.editor)); 
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'update' );
    end if;  
   
  if new.admin <> old.admin
   then
            delete from website_priviledge where developer_id = 
          (select id from person where username = (old.admin)) and website_id = old.id;
	 set @x = (select id from person where username = (new.admin)); 
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'create' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'update' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'delete' );
      end if;
  END$$
  DELIMITER ;
  
  
  
  DELIMITER $$
create TRIGGER AFTER_WEBSITE_INSERT
  AFTER INSERT ON website
  FOR EACH ROW   
  BEGIN
	  set @x = (select id from person where username = (new.owner)); 
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'create' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'update' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'delete' );
      
	  set @x = (select id from person where username = (new.editor)); 
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'update' );
      
	 set @x = (select id from person where username = (new.admin)); 
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'create' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'update' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (@x,new.id,'delete' );
  END$$
  DELIMITER ;
  