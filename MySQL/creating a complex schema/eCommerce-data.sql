USE eCommerce;

INSERT INTO customer VALUES (1001,'Anna','Castro','1986-11-23','F',NULL,NULL,NULL,NULL),		
(1002,'John','Ancona','1987-3-23','M',NULL,NULL,NULL,NULL),
(1003,'Dilbert','Donahue','1991-10-6','M',NULL,NULL,NULL,NULL),
(1004,'Jane','Zheng','1989-8-16','F',NULL,NULL,NULL,NULL),
(1005,'Rosa','Hernandez','1996-8-19','F',NULL,NULL,NULL,NULL);

COMMIT;

INSERT INTO phone VALUES (10001,1001,1,531,2836774,NULL,'Mobile', TRUE),
(10002,1001,1,531,7705843,123,'Work', FALSE),
(10003,1001,1,531,7708465,NULL,'Fax', FALSE),
(10004,1002,1,203,7796292,NULL,'Mobile', TRUE),
(10005,1003,1,971,6526066,NULL,'Mobile', TRUE),
(10006,1004,1,554,7741089,NULL,'Mobile', TRUE),
(10007,1005,1,566,3043971,NULL,'Mobile', TRUE);

COMMIT;

UPDATE customer
SET primary_phone = 10001
WHERE cust_id = 1001;

UPDATE customer
SET primary_phone = 10004
WHERE cust_id = 1002;

UPDATE customer
SET primary_phone = 10005
WHERE cust_id = 1003;

UPDATE customer
SET primary_phone = 10006
WHERE cust_id = 1004;

UPDATE customer
SET primary_phone = 10007
WHERE cust_id = 1005;
COMMIT;

INSERT INTO email VALUES (10001,1001,'it1234@gmail.com','Personal', TRUE),
(10002,	1001,'anna.castro@macrosoft.com','Work', FALSE),
(10003,	1002,'j_ancona123@hotmail.com','Personal', TRUE),
(10004,	1002,'jancona@urw.edu','School', FALSE),
(10005,	1003,'dd257@yahoo.com','Personal', TRUE),
(10006,	1004,'jane@aol.com','Personal', TRUE),
(10007,	1005,'rosa@aim.com','Personal', TRUE);

COMMIT; 

UPDATE customer
SET primary_email = 10001
WHERE cust_id = 1001;

UPDATE customer
SET primary_email = 10003
WHERE cust_id = 1002;

UPDATE customer
SET primary_email = 10005
WHERE cust_id = 1003;

UPDATE customer
SET primary_email = 10006
WHERE cust_id = 1004;

UPDATE customer
SET primary_email = 10007
WHERE cust_id = 1005;
COMMIT;

INSERT INTO payment VALUES 
(100001,1001,'368544623795203','AmEx',NULL,11,2022,4764, TRUE),
(100002,1002,'4937515149549500','Visa',NULL,9,2024,321, TRUE),
(100003,1003,'4808437630180081','Visa',NULL,1,2023,456, TRUE),
(100004,1004,'4828526348154572','Visa',NULL,4,2023,987, TRUE),
(100005,1005,'4248168108403535','Visa',NULL,12,2020,159, TRUE);

COMMIT;

UPDATE customer
SET primary_payment = 100001
WHERE cust_id = 1001;

UPDATE customer
SET primary_payment = 100002
WHERE cust_id = 1002;

UPDATE customer
SET primary_payment = 100003
WHERE cust_id = 1003;

UPDATE customer
SET primary_payment = 100004
WHERE cust_id = 1004;

UPDATE customer
SET primary_payment = 100005
WHERE cust_id = 1005;
COMMIT;

# address
INSERT INTO address VALUES (1001,1001,'7028 Rocky River Lane', NULL,'Brentwood','NY',11717,'USA','Home',TRUE),
(1002,1001,'9114 S. Queen Road','S. 309','Brentwood','NY',11717,'USA','Work',FALSE),
(1003,1002,'82 Roosevelt Rd',NULL,'Miami','FL',33125,'USA','Home',TRUE),
(1004,1003,'35 Goldfield Drive',NULL,'Bonita Springs','FL',34135,'USA','Home',TRUE),
(1005,1004,'34 W. James Dr','Apt 7','Altoona','PA',16601,'USA','Home',TRUE),
(1006,1005,'68 Ohio Street',NULL,'Mableton','GA',30126,'USA','Home',TRUE);


COMMIT;

UPDATE customer
SET primary_address = 1001
WHERE cust_id = 1001;

UPDATE customer
SET primary_address = 1002
WHERE cust_id = 1003;

UPDATE customer
SET primary_address = 1003
WHERE cust_id = 1004;

UPDATE customer
SET primary_address = 1004
WHERE cust_id = 1005;

UPDATE customer
SET primary_address = 1005
WHERE cust_id = 1006;
COMMIT;

INSERT INTO order_details VALUES 
(1000001,1001,NULL,100001,'2019-12-20','2019-12-20','2019-12-20','FedEx Ground','2019-12-24',NULL,NULL),
(1000002,1001,NULL,100001,'2020-2-1','2020-2-1','2020-2-1','FedEx Ground','2020-3-4',NULL,'2020-3-8'),
(1000003,1001,NULL,100001,'2020-3-1','2020-3-1','2020-3-1','FedEx Ground','2020-3-5', NULL, NULL),		
(1000004,1002,NULL,100002,'2019-4-1','2019-4-1','2019-4-1','UPS Next Day','2019-4-5',NULL,NULL),		
(1000005,1003,NULL,100003,'2019-5-7','2019-5-7','2019-5-7','USPS Media Mail','2019-5-11',NULL,NULL),		
(1000006,1004,NULL,100004,'2019-3-8','2019-3-8','2019-3-8','USPS Media Mail','2019-3-15','2019-3-15','2019-3-20'),
(1000007,1005,NULL,100005,'2020-5-20','2020-5-20','2020-5-20','USPS Registered Mail',NULL, NULL,NULL);

COMMIT;
INSERT INTO cart VALUES 
(1000011,1000001,NULL,1,NULL),
(1000012,1000002,NULL,1,NULL),	
(1000013,1000003,NULL,1,NULL),	
(1000014,1000004,NULL,1,NULL),	
(1000015,1000005,NULL,1,NULL),	
(1000016,1000006,NULL,1,NULL),	
(1000017,1000007,NULL,1,NULL);

COMMIT;	

UPDATE order_details
SET cart_id = 1000011
WHERE order_id = 1000001;

UPDATE order_details
SET cart_id = 1000012
WHERE order_id = 1000002;

UPDATE order_details
SET cart_id = 1000013
WHERE order_id = 1000003;

UPDATE order_details
SET cart_id = 1000014
WHERE order_id = 1000004;

UPDATE order_details
SET cart_id = 1000015
WHERE order_id = 1000005;

UPDATE order_details
SET cart_id = 1000016
WHERE order_id = 1000006;

UPDATE order_details
SET cart_id = 1000017
WHERE order_id = 1000007;

COMMIT;

INSERT INTO product_catalog VALUES 
(10000000,'Desktop computer',1001,'Dell',1,2,1,1000,10),
(10000001,'Laptop Computer',1001,'Dell',1,1,1,800,3),
(10000002,'Laptop Computer',1002,'Apple',2,1,1,1200,3),
(10000003,'Laptop Computer',1003,'Acer',1,1,1,900,3),
(10000004,'Laptop Computer',1004,'Lenovo',1,1,1,800,3);

UPDATE cart
SET product_id = 10000002
WHERE cart_id = 1000011;

UPDATE cart
SET product_id = 10000002
WHERE cart_id = 1000012;

UPDATE cart
SET product_id = 10000002
WHERE cart_id = 1000013;

UPDATE cart
SET product_id = 10000003
WHERE cart_id = 1000014;

UPDATE cart
SET product_id = 10000002
WHERE cart_id = 1000015;

UPDATE cart
SET product_id = 10000004
WHERE cart_id = 1000016;

UPDATE cart
SET product_id = 10000000
WHERE cart_id = 1000017;

COMMIT;










