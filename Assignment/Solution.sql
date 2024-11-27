-- Display total no.of records from Customer table
SELECT COUNT(*) AS NO_OF_CUSTOMERS FROM CUSTOMER;

-- Display total records by menu_type example : Non-Veg 4 Veg 3 Beragage 2 
SELECT MEN_SPECIALITY,COUNT(MEN_SPECIALITY) as MENU_TYPE FROM MENU GROUP BY MEN_SPECIALITY;

-- Display all records from Menu Table
SELECT COUNT(*) AS TOTAL_MENU FROM MENU;

-- Display authentication query for vendor table as enter username and passcode if correct return 1 else return 0
SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN 1 
        ELSE 0 
    END AUTHENTICATED
FROM VENDOR
WHERE VEN_USERNAME = 'balan89' 
  AND VEN_PASSWORD = 'chennai@123';


-- Display customer details who have wallets

SELECT DISTINCT CUSTOMER.* FROM CUSTOMER
LEFT JOIN WALLET
ON CUSTOMER.CUS_ID = WALLET.CUS_ID
WHERE WALLET.WAL_ID IS NOT NULL;
-- display Customer Details who don't have wallets

SELECT DISTINCT CUSTOMER.* FROM CUSTOMER
LEFT JOIN WALLET
ON CUSTOMER.CUS_ID = WALLET.CUS_ID
WHERE WALLET.WAL_ID IS NULL;

-- Display customer details who placed orders

SELECT DISTINCT CUSTOMER.* FROM CUSTOMER
LEFT JOIN ORDERS
ON CUSTOMER.CUS_ID = ORDERS.CUS_ID
WHERE ORDERS.ORD_ID IS NOT NULL;
-- Display customer details who don't placed any orders

SELECT DISTINCT CUSTOMER.* FROM CUSTOMER
LEFT JOIN ORDERS
ON CUSTOMER.CUS_ID = ORDERS.CUS_ID
WHERE ORDERS.ORD_ID IS NULL;

-- Display vendor details who recieved orders

SELECT DISTINCT VENDOR.* FROM VENDOR
LEFT JOIN ORDERS
ON VENDOR.VEN_ID = ORDERS.VEN_ID
WHERE ORDERS.ORD_ID IS NOT NULL;

-- Display Vendors who got more than one order

SELECT VENDOR.*
FROM VENDOR
JOIN ORDERS ON VENDOR.VEN_ID = ORDERS.VEN_ID
GROUP BY VEN_ID
HAVING COUNT(ORD_ID) > 1;

-- Display all customer details who got more than one wallet

SELECT CUSTOMER.* FROM CUSTOMER
JOIN WALLET
ON CUSTOMER.CUS_ID = WALLET.CUS_ID
GROUP BY CUS_ID
HAVING (COUNT(WAL_ID) > 1) ; 

-- Display Menu Item details which is got more than one order 

SELECT MENU.* FROM MENU 
JOIN ORDERS
ON MENU.MEN_ID = ORDERS.MEN_ID
GROUP BY MENU.MEN_ID
HAVING (COUNT(MENU.MEN_ID) > 1);

-- Display all customer details who have wallet 'PAYTM'

SELECT CUSTOMER.* FROM CUSTOMER
JOIN WALLET
ON CUSTOMER.CUS_ID = WALLET.CUS_ID
WHERE WALLET.WAL_SOURCE = 'PAYTM';