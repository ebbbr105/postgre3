--Вывести распределение (количество) клиентов по сферам деятельности, отсортировав результат по убыванию количества.
SELECT job_industry_category, count (*) 
FROM module3.customer c 
GROUP BY job_industry_category
ORDER BY 2 DESC 


--Найти общую сумму дохода (list_price*quantity) по всем подтвержденным заказам за каждый месяц по сферам деятельности клиентов. Отсортировать результат по году, месяцу и сфере деятельности.
SELECT DATE_TRUNC('month', order_date::date)::date AS dt, c.job_industry_category, sum(p.list_price*oi.quantity) AS sum_revenue
FROM orders o
LEFT JOIN customer c ON o.customer_id = c.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id 
LEFT JOIN product p ON oi.product_id = p.product_id 
WHERE o.order_status = 'Approved'
GROUP BY DATE_TRUNC('month', order_date::date), c.job_industry_category 
ORDER BY 1, 2
