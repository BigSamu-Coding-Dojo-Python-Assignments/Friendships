
-- FRIENDSHIPS

ALTER TABLE friends.users AUTO_INCREMENT=1;
ALTER TABLE friends.friendships AUTO_INCREMENT=1;

-- I) MAIN TASK
-- Write a SQ`PRIMARY`friendshipsL query that returns a list of users along with their friends' names.

SELECT users.id, users.first_name, users.last_name, friends.id, friends.first_name AS friend_first_name, friends.last_name AS friend_last_name
FROM users
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS friends ON friendships.friend_id = friends.id;

-- II) ADDITIONAL EXCERCISES

-- 1. Return all users who are friends with Kermit, make sure their names are displayed in the results.

SELECT users.id, users.first_name, users.last_name, friends.id, friends.first_name AS friend_first_name, friends.last_name AS friend_last_name
FROM users
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS friends ON friendships.friend_id = friends.id
WHERE friends.first_name = 'KERMIT';

-- 2. Return the count of all friendships

SELECT CONCAT(users.first_name, " ", users.last_name) AS full_name, COUNT(friendships.id) as number_of_friendships
FROM users
JOIN friendships ON users.id = friendships.user_id
GROUP BY full_name;

-- 3. Find out who has the most friends and return the count of their friends.

SELECT CONCAT(users.first_name, " ", users.last_name) AS full_name, COUNT(friendships.id) as number_of_friendships
FROM users
JOIN friendships ON users.id = friendships.user_id
GROUP BY full_name
ORDER BY number_of_friendships DESC
LIMIT 1;

-- 4. Create a new user and make them friends with Eli Byers, Kermit The Frog, and Marky Mark

INSERT INTO users(first_name, last_name, created_at, updated_at) VALUES ('John','The Crazy',NOW(),NOW());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at) VALUES (6,2,NOW(),NOW());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at) VALUES (6,4,NOW(),NOW());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at) VALUES (6,5,NOW(),NOW());

-- 5. Return the friends of Eli in alphabetical order

SELECT users.id, users.first_name, users.last_name, friends.id, friends.first_name AS friend_first_name, friends.last_name AS friend_last_name
FROM users
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS friends ON friendships.friend_id = friends.id
WHERE friends.first_name = 'ELI'
ORDER BY friends.first_name ASC;

-- 6. Remove Marky Mark from Eli’s friends.

DELETE FROM friendships WHERE user_id = 2 AND friend_id = 5;

-- 7. Return all friendships, displaying just the first and last name of both friends

SELECT users.id, users.first_name, users.last_name, friends.id, friends.first_name AS friend_first_name, friends.last_name AS friend_last_name
FROM users
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS friends ON friendships.friend_id = friends.id;