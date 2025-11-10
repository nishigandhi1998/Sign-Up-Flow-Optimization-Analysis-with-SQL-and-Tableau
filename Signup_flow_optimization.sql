SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

USE signup_flow;

select * from actions;
select * from error_messages;
select * from sessions;
select * from student_purchases;
select * from students;
select * from visitors;

-- Signup flow conversion rate 

WITH
total_visitors as
(
	SELECT
		v.visitor_id,
		v.first_visit_date, 
        s.date_registered as registration_date,
        p.purchase_date
	FROM
		visitors as v
		LEFT JOIN
		students s on v.user_id = s.user_id
		LEFT JOIN
		student_purchases p on v.user_id = p.user_id
	GROUP BY visitor_id
),

count_visitors as
(
	SELECT
		first_visit_date as date_session,
        COUNT(*) as count_total_visitors
	FROM total_visitors 
    GROUP BY date_session
),

count_registered as
(
SELECT 
    v.first_visit_date AS date_session,
    COUNT(*) AS count_registered
FROM
    total_visitors v
WHERE
    registration_date IS NOT NULL
GROUP BY date_session ),
    
count_registered_free as
(
	SELECT
		v.first_visit_date as date_session,
        COUNT(*) as count_registered_free
	FROM total_visitors v
    WHERE registration_date IS NOT NULL
    and (purchase_date is null
    or TIMESTAMPDIFF(minute, registration_date, purchase_date) > 30)
    GROUP BY date_session)

SELECT
	v.date_session as date_session, 
    v.count_total_visitors,
    IFNULL(r.count_registered, 0) as count_registered,
	IFNULL(fr.count_registered_free, 0) as free_registered_users
FROM
	count_visitors as v
    LEFT JOIN
    count_registered as r ON v.date_session = r.date_session 
    LEFT JOIN
    count_registered_free as fr ON v.date_session = fr.date_session 
ORDER BY date_session;

-- Sign up types and error :

SELECT 
    ac.visitor_id,
    s.user_id,
    CAST(s.date_registered AS DATE) AS registration_date,
    CAST(ac.action_date AS DATE) AS signup_date,
    CASE
        WHEN ac.action_name LIKE '%facebook%' THEN 'facebook'
        WHEN ac.action_name LIKE '%google%' THEN 'google'
        WHEN ac.action_name LIKE '%linkedin%' THEN 'linkedin'
        ELSE 'email'
    END AS signup_type,
    CASE
        WHEN
            ac.action_name LIKE '%success%'
                AND date_registered IS NOT NULL
                AND CAST(s.date_registered AS DATE) = CAST(ac.action_date AS DATE)
        THEN
            'direct success'
        WHEN
            ac.action_name LIKE '%fail%'
                AND s.date_registered IS NULL
        THEN
            'fail'
        WHEN
            ac.action_name LIKE '%fail%'
                AND s.date_registered IS NOT NULL
                AND CAST(s.date_registered AS DATE) >= CAST(ac.action_date AS DATE)
        THEN
            'successful retry'
    END AS signup_attempt,
    IFNULL(e.error_text, ' ') AS error_message,
    se.session_os,
    CASE
        WHEN
            se.session_os LIKE '%Android%'
                OR se.session_os LIKE 'iOS%'
        THEN
            'mobile'
        WHEN
            se.session_os LIKE '%windows%'
                OR se.session_os LIKE 'OS%'
                OR se.session_os LIKE '%Linux%'
                OR se.session_os LIKE '%Ubuntu%'
                OR se.session_os LIKE '%Chrome%'
        THEN
            'desktop'
        ELSE 'other'
    END AS device
FROM
    actions AS ac
        LEFT JOIN
    visitors AS v ON v.visitor_id = ac.visitor_id
        LEFT JOIN
    students AS s ON s.user_id = v.user_id
        LEFT JOIN
    error_messages e ON e.error_id = ac.error_id
        LEFT JOIN
    sessions se ON se.visitor_id = ac.visitor_id
WHERE
    v.first_visit_date >= '2022-07-01'
        AND ac.action_name LIKE '%sign%'
        AND ac.action_name LIKE '%click%'
        AND (ac.action_name LIKE '%success%'
        OR ac.action_name LIKE '%fail%')
        AND ac.action_date BETWEEN '2022-07-01' AND '2023-02-01'
GROUP BY visitor_id
HAVING signup_attempt IS NOT NULL
ORDER BY signup_date ; 

-- login Types and errors 

SELECT 
    ac.session_id,
    v.visitor_id,
    s.user_id,
    CAST(s.date_registered AS DATE) AS registration_date,
    CAST(ac.action_date AS DATE) AS login_date,
    CASE
        WHEN ac.action_name LIKE '%facebook%' THEN 'facebook'
        WHEN ac.action_name LIKE '%google%' THEN 'google'
        WHEN ac.action_name LIKE '%linkedin%' THEN 'linkedin'
        ELSE 'email'
    END AS login_type,
    CASE
        WHEN ac.action_name LIKE '%success%' THEN 'success'
        WHEN ac.action_name LIKE '%fail%' THEN 'fail'
        ELSE 'other'
    END AS login_attempt,
    IFNULL(e.error_text, ' ') AS error_message,
    CASE
        WHEN
            se.session_os LIKE '%Android%'
			OR se.session_os LIKE '%iOS%'
        THEN
            'mobile'
        WHEN
            se.session_os LIKE '%Windows%'
			OR se.session_os LIKE '%Mac%'
			OR se.session_os LIKE '%Linux%'
			OR se.session_os LIKE '%Ubuntu%'
			OR se.session_os LIKE '%Chrome%'
        THEN 'desktop'
        ELSE 'other'
        END AS device_type
FROM
    actions ac
        LEFT JOIN
    visitors v ON v.visitor_id = ac.visitor_id
        LEFT JOIN
    students s ON s.user_id = v.user_id
        LEFT JOIN
    error_messages e ON e.error_id = ac.error_id
        LEFT JOIN
    sessions se ON se.session_id = ac.session_id
WHERE
		v.first_visit_date >= '2022-07-01'
        AND ac.action_name LIKE '%login%'
        AND ac.action_name LIKE '%click%'
        AND (ac.action_name LIKE '%success%'
        OR ac.action_name LIKE '%fail%')
GROUP BY ac.session_id
HAVING login_attempt IS NOT NULL
    AND registration_date <= login_date
ORDER BY login_date;
