
/*Task_1*/
SELECT 
	u.id,
	CONCAT(u.firstname, ' ', u.lastname) AS full_name,
	p.birthday,
	COUNT(l.id) AS num_likes
FROM users u
JOIN profiles p ON u.id = p.user_id AND TIMESTAMPDIFF(YEAR, p.birthday, CURDATE())<=13
-- JOIN profiles p ON u.id = p.user_id AND DATEDIFF(DATEPART(yyyy, CURDATE()), DATEPART(yyyy, p.birthday))<=13   /* ТАК почему-то не работает*/
-- JOIN profiles p ON u.id = p.user_id AND DATEDIFF(YEAR(CURDATE()), YEAR(p.birthday))<=13
LEFT JOIN likes l ON u.id = l.user_id
GROUP BY u.id ORDER BY u.id;


/*Task_2*/
SELECT CASE (gender)
        WHEN 'm' THEN 'male'
        WHEN 'f' THEN 'female'
    	END AS 'Gender', COUNT(*) as 'total_likes'
FROM profiles p 
JOIN likes l 
WHERE l.user_id = p.user_id
GROUP BY gender; 


/*Task_3*/
SELECT DISTINCT id, CONCAT(firstname, ' ', lastname ) AS 'Do not send message'
FROM users u
WHERE NOT EXISTS (
	SELECT from_user_id
	FROM messages m
	WHERE u.id = m.from_user_id
);



/*Task_4*/
SELECT from_user_id AS 'Sender id', 
	(SELECT CONCAT(firstname,' ', lastname) 
    FROM users 
    WHERE id = messages.from_user_id) AS 'Sender Fullname', COUNT(*) AS `Messages send`
FROM messages 
WHERE to_user_id = 1 AND from_user_id IN (
	SELECT initiator_user_id 
    FROM friend_requests 
    WHERE (target_user_id = 1) AND status ='approved'
    UNION
    SELECT target_user_id 
    FROM friend_requests 
    WHERE (initiator_user_id = 1) AND status ='approved' 
)
GROUP BY from_user_id
ORDER BY `Messages send` DESC 





