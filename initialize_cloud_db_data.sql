-- File: initialize_cloud_db_data.sql

-- 3. 더미 데이터 삽입

USE cloud_db;

-- users 더미 데이터
INSERT INTO users (email, password, nickname, profile_image_url) VALUES 
('user1@example.com', 'password1', 'user1', 'http://example.com/image1.jpg'),
('user2@example.com', 'password2', 'user2', 'http://example.com/image2.jpg'),
('user3@example.com', 'password3', 'user3', 'http://example.com/image3.jpg');

-- posts 더미 데이터
INSERT INTO posts (user_id, title, content) VALUES 
(1, 'First Post', 'This is the content of the first post.'),
(2, 'Second Post', 'This is the content of the second post.'),
(3, 'Third Post', 'This is the content of the third post.');

-- comments 더미 데이터
INSERT INTO comments (post_id, user_id, content) VALUES 
(1, 1, 'First comment on first post.'),
(2, 2, 'Second comment on second post.'),
(3, 3, 'Third comment on third post.');

-- post_likes 더미 데이터
INSERT INTO post_likes (post_id, user_id) VALUES 
(1, 1),
(2, 2),
(3, 3);

-- post_dislikes 더미 데이터
INSERT INTO post_dislikes (post_id, user_id) VALUES 
(1, 2),
(2, 3),
(3, 1);

-- comment_likes 더미 데이터
INSERT INTO comment_likes (comment_id, user_id) VALUES 
(1, 1),
(2, 2),
(3, 3);

-- comment_dislikes 더미 데이터
INSERT INTO comment_dislikes (comment_id, user_id) VALUES 
(1, 2),
(2, 3),
(3, 1);

-- email_verification 더미 데이터
INSERT INTO email_verification (email, verification_code, verified) VALUES 
('verify1@example.com', 'code1', false),
('verify2@example.com', 'code2', false),
('verify3@example.com', 'code3', true);
