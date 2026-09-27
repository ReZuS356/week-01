-- Uloha 2
SELECT 
    o.order_id AS identifikátor_objednávky,
    c.customer_name AS meno_zákazníka,
    o.sales AS hodnota_predaja
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
WHERE 
    o.sales > 500
ORDER BY 
    hodnota_predaja DESC;


-- Uloha 3
SELECT 
    o.order_id AS identifikátor_objednávky,
    c.customer_name AS meno_zákazníka,
    p.category AS kategóriu_produktu,
    o.sales AS hodnota_predaja
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
JOIN 
    products p ON o.product_id = p.product_id;


-- Uloha 4
SELECT 
    c.region AS región,
    SUM(o.sales) AS celkovú_hodnotu_predaja
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.region;


-- Uloha 5
SELECT 
    p.product_name AS názov_produktu,
    SUM(o.sales) AS celkovú_hodnotu_predaja
FROM 
    products p
LEFT JOIN 
    orders o ON p.product_id = o.product_id
GROUP BY 
    p.product_id, 
    p.product_name;


-- Uloha 6
SELECT 
    c.customer_name AS meno_zákazníka,
    o.order_id AS identifikátor_objednávky,
    o.sales AS hodnota_predaja
FROM 
    customers c
FULL OUTER JOIN 
    orders o ON c.customer_id = o.customer_id;


-- Uloha 7
SELECT 
    c.region AS región_zákazníka,
    SUM(o.sales) AS celkovú_hodnotu_predaja_v_danom_regióne
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.region;


-- Uloha 8
SELECT 
    c.customer_name AS meno_zákazníka,
    COUNT(o.order_id) AS počet_jeho_objednávok
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, 
    c.customer_name;


-- Uloha 9
SELECT 
    p.category AS kategóriu_produktu,
    AVG(o.discount) AS priemernú_hodnotu_zľavy_pre_danú_kategóriu
FROM 
    products p
JOIN 
    orders o ON p.product_id = o.product_id
GROUP BY 
    p.category;


-- Uloha 10
SELECT 
    c.customer_name AS meno_zákazníka,
    SUM(o.sales) AS celkovú_hodnotu_jeho_nákupov
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, 
    c.customer_name
HAVING 
    SUM(o.sales) > 2000;


-- Uloha 11
SELECT 
    c.region AS región,
    SUM(o.sales) AS celkovú_hodnotu_predaja,
    AVG(o.discount) AS priemernú_hodnotu_poskytnutej_zľavy,
    COUNT(o.order_id) AS počet_objednávok
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.region;


-- Uloha 12
SELECT 
    c.region AS názov_regiónu,
    COUNT(CASE WHEN o.sales > 1000 THEN 1 END) AS počet_high_value_objednávok,
    COUNT(CASE WHEN o.sales <= 1000 THEN 1 END) AS počet_low_value_objednávok
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.region;


-- Uloha 13
SELECT 
    c.customer_name AS meno_zákazníka,
    SUM(o.sales) AS celkový_predaj,
    AVG(o.discount) AS priemerná_zľava,
    COUNT(o.order_id) AS počet_objednávok,
    CASE 
        WHEN SUM(o.sales) > 2500 THEN 'VIP'
        ELSE 'REGULAR'
    END AS typ_zákazníka
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, 
    c.customer_name
ORDER BY 
    celkový_predaj DESC;