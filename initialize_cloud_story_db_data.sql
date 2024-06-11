-- File: initialize_cloud_story_db_data.sql

USE cloud_story_db;

-- users 테이블에 더미 데이터 삽입
INSERT INTO users (email, password, nickname, profile_image_url, created_at, updated_at)
VALUES
    ('user1@example.com', 'password1', 'user1', '/uploads/user1.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('user2@example.com', 'password2', 'user2', '/uploads/user2.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('user3@example.com', 'password3', 'user3', '/uploads/user3.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- posts 테이블에 더미 데이터 삽입
INSERT INTO posts (user_id, title, content, created_at, updated_at, like_count, dislike_count, view_count)
VALUES
    (1, 'Post Title 1', 'This is the content of post 1.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0, 0),
    (2, 'Post Title 2', 'This is the content of post 2.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0, 0),
    (3, 'Post Title 3', 'This is the content of post 3.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0, 0);

-- post_photos 테이블에 더미 데이터 삽입
INSERT INTO post_photos (post_id, url, photo_order)
VALUES
    (1, '/uploads/post1_photo1.jpg', 1),
    (1, '/uploads/post1_photo2.jpg', 2),
    (2, '/uploads/post2_photo1.jpg', 1),
    (2, '/uploads/post2_photo2.jpg', 2),
    (3, '/uploads/post3_photo1.jpg', 1),
    (3, '/uploads/post3_photo2.jpg', 2);

-- comments 테이블에 더미 데이터 삽입
INSERT INTO comments (post_id, user_id, content, created_at, updated_at, like_count, dislike_count)
VALUES
    (1, 2, 'This is a comment on post 1 by user 2.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0),
    (1, 3, 'This is another comment on post 1 by user 3.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0),
    (2, 1, 'This is a comment on post 2 by user 1.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0),
    (3, 2, 'This is a comment on post 3 by user 2.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0),
    (3, 1, 'This is another comment on post 3 by user 1.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0);

-- post_likes 테이블에 더미 데이터 삽입
INSERT INTO post_likes (post_id, user_id, created_at)
VALUES
    (1, 2, CURRENT_TIMESTAMP),
    (2, 3, CURRENT_TIMESTAMP),
    (3, 1, CURRENT_TIMESTAMP);

-- post_dislikes 테이블에 더미 데이터 삽입
INSERT INTO post_dislikes (post_id, user_id, created_at)
VALUES
    (1, 3, CURRENT_TIMESTAMP),
    (2, 1, CURRENT_TIMESTAMP),
    (3, 2, CURRENT_TIMESTAMP);

-- comment_likes 테이블에 더미 데이터 삽입
INSERT INTO comment_likes (comment_id, user_id, created_at)
VALUES
    (1, 3, CURRENT_TIMESTAMP),
    (2, 1, CURRENT_TIMESTAMP),
    (3, 2, CURRENT_TIMESTAMP);

-- comment_dislikes 테이블에 더미 데이터 삽입
INSERT INTO comment_dislikes (comment_id, user_id, created_at)
VALUES
    (1, 1, CURRENT_TIMESTAMP),
    (2, 2, CURRENT_TIMESTAMP),
    (3, 3, CURRENT_TIMESTAMP);

-- email_verification 테이블에 더미 데이터 삽입
INSERT INTO email_verification (email, verification_code, created_at, verified, verified_at)
VALUES
    ('user1@example.com', '123456', CURRENT_TIMESTAMP, FALSE, NULL),
    ('user2@example.com', '234567', CURRENT_TIMESTAMP, FALSE, NULL),
    ('user3@example.com', '345678', CURRENT_TIMESTAMP, FALSE, NULL);
