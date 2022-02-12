#Q1.USERS WHO'VE been around the longest 
SELECT * from users
ORDER BY created_at DESC
LIMIT 5;

#Q2.BY WHAT day of the week do most users register on 
#since we need to schedule an ad compaign 

SELECT DAYNAME(created_at) AS day ,COUNT(*) AS 'total' 
FROM users
GROUP BY day
ORDER BY 'total' DESC
LIMIT 2;

#Q3. Finder the users who have never posted a photo
SELECT COUNT(*) from users 
LEFT JOIN photos 
ON users.id = photos.user_id
WHERE photos.id IS NULL;

SELECT username from users 
LEFT JOIN photos 
ON users.id = photos.user_id
WHERE photos.id IS NULL;


#Q4. Identify the most popular photo and who created it
SELECT username, photos.id, photos.image_url, COUNT(*) as total FROM photos
JOIN likes ON likes.photo_id = photos.id 
JOIN users ON users.id = photos.user_id
GROUP BY photos.user_id
ORDER BY total DESC
LIMIT 20;


#Q5 How many times does the average USER post
#total number of photos/ total number of users
SELECT (SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users);


#Q6 Top 5 commonly used HASHTAGSALTER
SELECT COUNT(*) Total FROM tags
JOIN photo_tags ON photo_tags.tag_id= tags.id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

SELECT COUNT(*) AS total from tags
JOIN photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY total DESC
LIMIT 5;
 
#Q7 FIND USERS WHO'VE LIKED EVERY SINGLE PHOTO 
SELECT COUNT(*) FROM photos;

SELECT username,COUNT(*) AS total FROM likes
JOIN users ON likes.user_id = users.id
GROUP BY user_id
HAVING total = (SELECT COUNT(*) FROM photos);

SELECT COUNT(*) FROM likes;

