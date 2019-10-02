insert into person values (12,'alice','alice','Alice','Wonder','Developer','alice@wonder.com');
insert into developer values (12, '4321rewq');

insert into person values (23,'bob','bob','Bob','Marley','Developer','bob@marley.com');
insert into developer values (23, '5432trew');

insert into person values (34,'charlie','charlie','Charles','Garcia','Developer','chuch@garcia.com');
insert into developer values (34, '6543ytre');

insert into person values (45,'dan','dan','Dan','Martin','User','dan@martin.com');
insert into user values (45, true);

insert into person values (56,'ed','ed','Ed','Karaz','User','ed@kar.com');
insert into user values (56, true);

/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (12,'123-234-3456',1);
INSERT INTO `phone` VALUES (12,'234-345-4566',0);
INSERT INTO `phone` VALUES (23,'345-456-5677',1);
INSERT INTO `phone` VALUES (34,'321-432-5435',1);
INSERT INTO `phone` VALUES (34,'432-432-5433',0);
INSERT INTO `phone` VALUES (34,'543-543-6544',0);
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;


insert into address values (12, '123 Adam St.',null, 'Alton', 'MA', '01234', true);
insert into address values (12, 'Birch St.',null, 'Boston', 'MA', '02345', false);

insert into address values (23, '345 Charles St.',null, 'Chelms', 'MA', '03455', true);
insert into address values (23, '456 Down St.',null, 'Dalton', 'MA', '04566', false);
insert into address values (23, '543 East St.',null, 'Everett', 'MA', '01112', false);

insert into address values (34, '654 Frank St.',null, 'Foulton', 'MA', '04322', true);


/*!40000 ALTER TABLE `priviledge` DISABLE KEYS */;
INSERT INTO `priviledge` VALUES ('create');
INSERT INTO `priviledge` VALUES ('delete');
INSERT INTO `priviledge` VALUES ('read');
INSERT INTO `priviledge` VALUES ('update');
/*!40000 ALTER TABLE `priviledge` ENABLE KEYS */;

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('admin');
INSERT INTO `role` VALUES ('editor');
INSERT INTO `role` VALUES ('owner');
INSERT INTO `role` VALUES ('reviewer');
INSERT INTO `role` VALUES ('writer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

INSERT INTO `data_type` VALUES ('heading');
INSERT INTO `data_type` VALUES ('html');
INSERT INTO `data_type` VALUES ('image');
INSERT INTO `data_type` VALUES ('widget');
INSERT INTO `data_type` VALUES ('youtube');

INSERT INTO `website` VALUES (123,'Facebook','an online social media and social networking service','alice','bob','charlie','2019-09-30 23:56:51','2019-09-30 23:56:51',1234234);
INSERT INTO `website` VALUES (234,'Twitter','an online news and social networking service','bob','charlie','alice','2019-09-30 23:56:51','2019-09-30 23:56:51',4321543);
INSERT INTO `website` VALUES (345,'Wikipedia','a free online encyclopedia','charlie','alice','bob','2019-09-30 23:56:51','2019-09-30 23:56:51',3456654);
INSERT INTO `website` VALUES (456,'CNN','an American basic cable and satellite television news channel','alice','bob','charlie','2019-09-30 23:56:51','2019-09-30 23:56:51',6543345);
INSERT INTO `website` VALUES (567,'CNET','an American media website that publishes reviews, news, articles, blogs, podcasts and videos on \ntechnology and consumer electronics','bob','charlie','alice','2019-10-01 03:30:27','2019-10-01 03:30:27',5433455);
INSERT INTO `website` VALUES (678,'Gizmodo','a design, technology, science and science fiction website that also \nwrites articles on politics','charlie','alice','bob','2019-09-30 23:56:51','2019-09-30 23:56:51',4322345);


/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (123,'Home','Landing Page','CNET','alice','bob','charlie','2019-09-04','2019-10-01 03:29:18',123434);
INSERT INTO `pages` VALUES (234,'About','Website Description','Gizmodo','bob','charlie','alice','2019-09-04','2019-10-01 03:29:18',234545);
INSERT INTO `pages` VALUES (345,'Contact','Addresses, phones, and contact info','Wikipedia','charlie','alice','bob','2019-09-04','2019-10-01 03:29:18',345656);
INSERT INTO `pages` VALUES (456,'Preferences','Where users can configure their preferences','CNN','alice','bob','charlie','2019-09-04','2019-10-01 03:29:18',456776);
INSERT INTO `pages` VALUES (567,'Profile','Users can configure their personal information','CNET','bob','charlie','alice','2019-09-04','2019-10-01 03:29:18',567878);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
INSERT INTO `widget` VALUES (123,'head123','heading','Welcome','0',NULL,NULL,'Home',NULL,NULL,2,NULL,NULL,NULL,NULL);
INSERT INTO `widget` VALUES (234,'post234','html','<p>Lorem</p>','0',NULL,NULL,'About',NULL,NULL,2,NULL,NULL,NULL,NULL);
INSERT INTO `widget` VALUES (345,'head345','heading','Hi','3',NULL,NULL,'Contact',NULL,NULL,2,NULL,NULL,NULL,NULL);
INSERT INTO `widget` VALUES (456,'intro456','html','<h1>Hi</h1>','1',NULL,NULL,'Contact',NULL,NULL,2,NULL,NULL,NULL,NULL);
INSERT INTO `widget` VALUES (567,'image345','image',NULL,'2','50 X 100','/img/567.png','Contact',NULL,NULL,2,NULL,NULL,NULL,NULL);
INSERT INTO `widget` VALUES (678,'video456','youtube','null','','400 X 300','https://youtu.be/h67VX51QXiQ','Preferences',NULL,NULL,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;




insert into page_role(developer_id,page_id,role) values(12,123,'editor');
insert into page_role(developer_id,page_id,role) values(23,123,'review');
insert into page_role(developer_id,page_id,role) values(34,123,'writer');

insert into page_role(developer_id,page_id,role) values(23,234,'editor');
insert into page_role(developer_id,page_id,role) values(34,234,'review');
insert into page_role(developer_id,page_id,role) values(12,234,'writer');

insert into page_role(developer_id,page_id,role) values(34,345,'editor');
insert into page_role(developer_id,page_id,role) values(12,345,'review');
insert into page_role(developer_id,page_id,role) values(23,345,'writer');

insert into page_role(developer_id,page_id,role) values(12,456,'editor');
insert into page_role(developer_id,page_id,role) values(23,456,'review');
insert into page_role(developer_id,page_id,role) values(34,456,'writer');

insert into page_role(developer_id,page_id,role) values(23,567,'editor');
insert into page_role(developer_id,page_id,role) values(34,567,'review');
insert into page_role(developer_id,page_id,role) values(12,567,'writer');






insert into website_role(developer_id, website_id,role) values (12,123,'owner');
insert into website_role(developer_id, website_id,role) values (23,123,'editor');
insert into website_role(developer_id, website_id,role) values (34,123,'admin');

insert into website_role(developer_id, website_id,role) values (23,234,'owner');
insert into website_role(developer_id, website_id,role) values (34,234,'editor');
insert into website_role(developer_id, website_id,role) values (12,234,'admin');

insert into website_role(developer_id, website_id,role) values (34,345,'owner');
insert into website_role(developer_id, website_id,role) values (12,345,'editor');
insert into website_role(developer_id, website_id,role) values (23,345,'admin');

insert into website_role(developer_id, website_id,role) values (12,456,'owner');
insert into website_role(developer_id, website_id,role) values (23,456,'editor');
insert into website_role(developer_id, website_id,role) values (34,456,'admin');

insert into website_role(developer_id, website_id,role) values (23,567,'owner');
insert into website_role(developer_id, website_id,role) values (34,567,'editor');
insert into website_role(developer_id, website_id,role) values (12,567,'admin');

insert into website_role(developer_id, website_id,role) values (34,678,'owner');
insert into website_role(developer_id, website_id,role) values (12,678,'editor');
insert into website_role(developer_id, website_id,role) values (23,678,'admin');


