-- -----------------Stored Procedure-------------------------------
DELIMITER //

CREATE PROCEDURE VALUED_CUTOMER()
BEGIN
SELECT c.customer_id, c.name, o.total_amount
from Customers c 
join Orders o on c.customer_id = o.customer_id
where o.total_amount > 5000;
END//

DELIMITER;

CALL VALUED_CUTOMER();
-- -----------------Parameter Stored Procedure-------------------------------

DELIMITER //

CREATE PROCEDURE PARA_VALUED_CUTOMER(IN amount DECIMAL(10,2))
BEGIN
SELECT c.customer_id, c.name, o.total_amount
from Customers c 
join Orders o on c.customer_id = o.customer_id
where o.total_amount > amount;
END//

DELIMITER;

CALL PARA_VALUED_CUTOMER(676.00);


-- -----------------VIEW-------------------------

-- THIS IS ROW LEVEL SECURITY (BY USING REPLACE KEYWORD)
CREATE OR REPLACE VIEW Cust_view as
SELECT * FROM Cutomers
WHERE name <> 'Naina';

SELECT * FROM Cust_view;

-- THIS IS COL LEVEL SECURITY (BY USING REPLACE KEYWORD)
CREATE OR REPLACE VIEW Cust_view as
SELECT customer_id, email FROM Cutomers
WHERE name <> 'Naina';

SELECT * FROM Cust_view;

-- -------------TRIGGER---------------------
DELIMITER //
CREATE TRIGGER set_created_at
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
SET NEW.created_at = '2025-09-07'
END
//
DELIMITER;