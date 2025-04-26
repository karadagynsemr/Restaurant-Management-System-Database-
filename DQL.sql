--1.All waiting reservations for today 
SELECT r.id, c.name, c.surname, r.date, r.time, r.table_id, r.status
FROM Reservations r
JOIN Customers c ON r.customer_id = c.id
WHERE r.date = '2025-04-05' AND r.status = 'waiting';

--2.Staff grouped by roles
SELECT r.rolename, COUNT(*) AS user_count
FROM staff s
JOIN roles r ON s.role_id = r.id
GROUP BY r.rolename;

-- Staff informations
SELECT r.rolename, s.name, s.surname, s.email, s.phone_number
FROM staff s
JOIN roles r ON s.role_id = r.id
ORDER BY r.rolename , s.name;

--3. Empty tables (Customer views to select)
SELECT id, capacity, status
FROM Tables 
WHERE status = 'empty'
ORDER by capacity;

--4. Total reservations and cancellation rate
SELECT 
    (SELECT COUNT(*) FROM Reservations) AS total_reservations, 
    (SELECT COUNT(*) FROM Reservations WHERE status = 'canceled') AS canceled_reservations, 
	
    ROUND((SELECT COUNT(*) FROM Reservations WHERE status = 'canceled') * 100.0 /
    (SELECT COUNT(*) FROM Reservations),2) AS cancellation_rate
FROM Reservations
LIMIT 1;

-- 5.Busiest hours for reservations
SELECT 
    time AS reservation_hour, 
    COUNT(*) AS reservation_count 
FROM Reservations 
WHERE status IN ('active', 'completed') 
GROUP BY time
ORDER BY reservation_count DESC;

-- 6.All the  menu With categories and allergens
SELECT 
    c.category_name AS category,
    m.itemname AS item_name,
    m.price AS price,
    m.allergens AS allergens
FROM Menu m
JOIN Categories c 
ON m.category_id = c.id
ORDER BY 
    c.category_name desc,
    m.price;


-- 7.Top dishes ordered by customers
SELECT 
    o.ItemName , m.price, 
    c.category_name AS category, 
    SUM(o.quantity) AS total_ordered, 
    SUM(o.quantity * m.price) AS total_revenue 
FROM Orders o
JOIN Menu m ON o.ItemName = m.itemName 
JOIN Categories c ON m.category_id = c.ID 
GROUP BY o.ItemName, m.price, c.category_name
ORDER BY total_ordered DESC
LIMIT 5;

-- 8.Customer details for a specific reservation
SELECT r.id, c.name, c.surname, c.email, c.phone_number, r.date, r.time, t.id AS table_id
FROM Reservations r
JOIN Customers c ON r.customer_id = c.id
JOIN Tables t ON r.table_id = t.id
WHERE r.id = 3;

--9.List all orders for a specific reservation
SELECT o.ItemName, o.quantity, m.price, (o.quantity * m.price) AS total
FROM Orders o
JOIN Menu m ON o.ItemName = m.itemName
WHERE o.reservation_id = 15;


--10.Total revenue from completed payments for a specific date
SELECT SUM(p.amount) AS daily_revenue
FROM Payments p
WHERE p.status = 'completed' and p.date::date = '2025.04.12';

-- 11. April weekly total revenue
SELECT
  CASE
    WHEN date::date BETWEEN '2025-04-01' AND '2025-04-07' THEN 'April 1st Week'
    WHEN date::date BETWEEN '2025-04-08' AND '2025-04-14' THEN 'April 2nd Week'
    WHEN date::date BETWEEN '2025-04-15' AND '2025-04-21' THEN 'April 3rd Week'
    WHEN date::date BETWEEN '2025-04-22' AND '2025-04-30' THEN 'April 4th Week'
  END AS week,
  SUM(amount) AS total_revenue
FROM payments
GROUP BY week
ORDER BY week;


--12.  April Total Revenue
SELECT 'April Total' AS period, SUM(amount) AS total_revenue
FROM payments
WHERE date >= '2025-04-01' AND date < '2025-05-01';


--13. Reservations that have called a waiter for a spesific date
SELECT r.id, c.name, c.surname, r.date, r.time, n.text
FROM Reservations r
JOIN Customers c ON r.customer_id = c.id
JOIN Notifications n ON n.reservation_id = r.id
WHERE n.notification_type = 'call_waiter' and r.date = '2025.04.04';

-- 14. Average ratings for food, staff, and restaurant
SELECT ROUND (AVG(food_rate), 2) AS avg_food_rate,
       ROUND(AVG(staff_rate), 2) AS avg_staff_rate,
       ROUND (AVG(restaurant_rate), 2) AS avg_restaurant_rate
FROM Reviews ;

--15. All canceled reservations with customer details
SELECT r.id, c.name, c.surname, c.email, r.date, r.time, r.status
FROM Reservations r
JOIN Customers c ON r.customer_id = c.id
WHERE r.status = 'canceled';


--16. Menu items with allergens
SELECT m.itemName, m.price, m.allergens, c.category_name
FROM Menu m
JOIN Categories c ON m.category_id = c.id
WHERE m.allergens != 'none'
ORDER BY c.category_name, m.itemName;

--17. Waiting  reservation statistics for a specific week
SELECT date AS reservation_date, COUNT(r.id) AS reservation_count
FROM Reservations r
WHERE r.date BETWEEN '2025-04-10' AND '2025-04-16' and r.status = 'waiting'
GROUP BY DATE(r.date)
ORDER BY reservation_date;

--18. Payments that are pending for a spesific date
SELECT p.id, p.reservation_id, p.payment_method, p.amount, p.date , p.status
FROM Payments p
JOIN reservations r 
ON p.reservation_id = r.id
WHERE p.status = 'pending' and r.date = '2025.04.29' ;
 
-- 19.Reservations with orders in 'cooking' status for a spesific date
SELECT r.id, c.name, c.surname, r.date, r.time, r.order_status
FROM Reservations r
JOIN Customers c ON r.customer_id = c.id
WHERE r.order_status = 'cooking' and r.date = '2025-04-01';


--20.Feedback for reservations with low ratings (less than 4 for any metric)
SELECT r.id, c.name, c.surname, rev.food_rate, rev.staff_rate, rev.restaurant_rate, rev.comment
FROM Reservations r
JOIN Customers c ON r.customer_id = c.id
JOIN Reviews rev ON rev.reservation_id = r.id
WHERE rev.food_rate < 4 OR rev.staff_rate < 4 OR rev.restaurant_rate < 4;

-- 21 Total order value per customer (Most paid customers to restaurant)
SELECT c.id, c.name, c.surname, SUM(o.quantity * m.price) AS total_spent
FROM Customers c
JOIN Reservations r ON c.id = r.customer_id
JOIN Orders o ON o.reservation_id = r.id
JOIN Menu m ON o.ItemName = m.itemName
GROUP BY c.id, c.name, c.surname
ORDER BY total_spent DESC
LIMIT 5;

--22. All notifications for a specific date
SELECT n.id, n.notification_type, n.text, r.date, r.time
FROM Notifications n
JOIN Reservations r ON n.reservation_id = r.id
WHERE r.date = '2025-04-06';

-- 23.Total payments by method
SELECT 
    payment_method AS payment_type, 
    COUNT(*) AS total_payments 
FROM Payments
Where status = 'completed'
GROUP BY payment_method
ORDER BY total_payments DESC;

-- 24.High ratings and comments 
SELECT 
    c.name, 
    c.surname, 
    r.food_rate, 
    r.staff_rate, 
    r.restaurant_rate, 
    r.comment
FROM Reviews r
JOIN Reservations res ON r.reservation_id = res.ID
JOIN Customers c ON res.customer_id = c.ID
WHERE r.food_rate >= 4 AND r.staff_rate >= 4 AND r.restaurant_rate >= 4
ORDER BY r.restaurant_rate DESC, r.food_rate DESC;




