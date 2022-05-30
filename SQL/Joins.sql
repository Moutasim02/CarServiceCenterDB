
-- Service Center relation JOIN Equipments relation
SELECT * FROM SERVICE_CENTER sc INNER JOIN EQUIPMENTS e ON sc.service_center_id=e.service_center_id;

-- Service Center relation JOIN Employee Profile relation
SELECT * FROM SERVICE_CENTER sc INNER JOIN EMPLOYEE_PROFILE ep ON sc.service_center_id=ep.service_center_id;

-- Employee Profile relation JOIN Employee Car History relation
SELECT * FROM EMPLOYEE_PROFILE ep INNER JOIN EMPLOYEE_CAR_HISTORY ech ON ep.em_profile_id=ech.em_profile_id;

-- Employee Service Car relation JOIN Employee Car History relation
SELECT * FROM EMPLOYEE_SERVICE_CARS esc INNER JOIN EMPLOYEE_CAR_HISTORY ech ON esc.em_service_car_id=ech.em_service_car_id;

-- Employee Profile relation JOIN Customer Service History relation
SELECT * FROM EMPLOYEE_PROFILE ep INNER JOIN CUSTOMER_SERVICE_HISTORY csh ON ep.em_profile_id=csh.em_profile_id;

-- Customer Profile relation JOIN Customer Service History relation
SELECT * FROM CUSTOMER_PROFILE cp INNER JOIN CUSTOMER_SERVICE_HISTORY csh ON cp.customer_id=csh.customer_id;

-- Customer Profile relation JOIN Feedbacks relation
SELECT * FROM CUSTOMER_PROFILE cp INNER JOIN FEEDBACKS f ON cp.customer_id=f.customer_id;

-- Customer Cars relation JOIN Customer Profile relation
SELECT * FROM CUSTOMER_CARS cc INNER JOIN CUSTOMER_PROFILE cp ON cc.customer_car_id=cp.customer_car_id;

-- Customer Order relation JOIN Customer Service History  relation
SELECT * FROM CUSTOMER_ORDER co INNER JOIN CUSTOMER_SERVICE_HISTORY csh ON co.customer_order_id=csh.customer_order_id;

-- Service JOIN Customer Order relation
SELECT * FROM SERVICES s INNER JOIN CUSTOMER_ORDER co ON s.service_id=co.service_id;

-- Ordered Products JOIN Customer Order relation
SELECT * FROM ORDERED_PRODUCTS op INNER JOIN CUSTOMER_ORDER co ON op.customer_order_id=co.customer_order_id;

-- Service JOIN Payments relation
SELECT * FROM SERVICES s INNER JOIN PAYMENTS p ON s.service_id=p.service_id;

-- Products JOIN Ordered Products  relation
SELECT * FROM PRODUCTS pr INNER JOIN ORDERED_PRODUCTS op ON pr.serial_number=op.serial_number;

-- Products JOIN Payments relation
SELECT * FROM PRODUCTS pr INNER JOIN PAYMENTS p ON pr.serial_number=p.serial_number;
