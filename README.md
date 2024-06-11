### 프로젝트 폴더 구조

```
cloud-story
│
├── initialize_cloud_db_schema.sql
├── initialize_cloud_db_data.sql
└── README.md
```

# Cloud Story 데이터베이스 초기화

이 저장소는 Cloud Story 애플리케이션을 위한 데이터베이스 스키마를 초기화하고 더미 데이터를 삽입하기 위한 SQL 스크립트를 포함하고 있습니다.

## 데이터베이스 스키마

데이터베이스 스키마에는 다음 테이블이 포함됩니다:

### 1. Users 테이블

- **테이블 이름**: `users`
- **설명**: 사용자 정보를 저장합니다.

| 속성 명             | 의미                       |
| ------------------- | -------------------------- |
| `id`                | 사용자 ID (Primary Key)    |
| `email`             | 사용자 이메일 (Unique)     |
| `password`          | 사용자 비밀번호            |
| `nickname`          | 사용자 닉네임 (Unique)     |
| `profile_image_url` | 사용자 프로필 이미지 URL   |
| `created_at`        | 계정 생성 일시             |
| `updated_at`        | 계정 정보 마지막 수정 일시 |

### 2. Posts 테이블

- **테이블 이름**: `posts`
- **설명**: 게시글 정보를 저장합니다.

| 속성 명         | 의미                          |
| --------------- | ----------------------------- |
| `id`            | 게시글 ID (Primary Key)       |
| `user_id`       | 사용자 ID (users 테이블 참조) |
| `title`         | 게시글 제목                   |
| `content`       | 게시글 내용                   |
| `created_at`    | 게시글 작성 일시              |
| `updated_at`    | 게시글 마지막 수정 일시       |
| `like_count`    | 게시글 좋아요 수              |
| `dislike_count` | 게시글 싫어요 수              |
| `view_count`    | 게시글 조회수                 |

### 3. Post Photos 테이블

- **테이블 이름**: `post_photos`
- **설명**: 게시글의 사진 정보를 저장합니다.

| 속성 명       | 의미                          |
| ------------- | ----------------------------- |
| `id`          | 사진 ID (Primary Key)         |
| `post_id`     | 게시글 ID (posts 테이블 참조) |
| `url`         | 사진 URL                      |
| `photo_order` | 사진 순서                     |

### 4. Comments 테이블

- **테이블 이름**: `comments`
- **설명**: 게시글에 대한 댓글 정보를 저장합니다.

| 속성 명         | 의미                          |
| --------------- | ----------------------------- |
| `id`            | 댓글 ID (Primary Key)         |
| `post_id`       | 게시글 ID (posts 테이블 참조) |
| `user_id`       | 사용자 ID (users 테이블 참조) |
| `content`       | 댓글 내용                     |
| `created_at`    | 댓글 작성 일시                |
| `updated_at`    | 댓글 마지막 수정 일시         |
| `like_count`    | 댓글 좋아요 수                |
| `dislike_count` | 댓글 싫어요 수                |

### 5. Post Likes 테이블

- **테이블 이름**: `post_likes`
- **설명**: 게시글에 대한 좋아요 정보를 저장합니다.

| 속성 명      | 의미                          |
| ------------ | ----------------------------- |
| `id`         | 좋아요 ID (Primary Key)       |
| `post_id`    | 게시글 ID (posts 테이블 참조) |
| `user_id`    | 사용자 ID (users 테이블 참조) |
| `created_at` | 좋아요 일시                   |

### 6. Post Dislikes 테이블

- **테이블 이름**: `post_dislikes`
- **설명**: 게시글에 대한 싫어요 정보를 저장합니다.

| 속성 명      | 의미                          |
| ------------ | ----------------------------- |
| `id`         | 싫어요 ID (Primary Key)       |
| `post_id`    | 게시글 ID (posts 테이블 참조) |
| `user_id`    | 사용자 ID (users 테이블 참조) |
| `created_at` | 싫어요 일시                   |

### 7. Comment Likes 테이블

- **테이블 이름**: `comment_likes`
- **설명**: 댓글에 대한 좋아요 정보를 저장합니다.

| 속성 명      | 의미                           |
| ------------ | ------------------------------ |
| `id`         | 좋아요 ID (Primary Key)        |
| `comment_id` | 댓글 ID (comments 테이블 참조) |
| `user_id`    | 사용자 ID (users 테이블 참조)  |
| `created_at` | 좋아요 일시                    |

### 8. Comment Dislikes 테이블

- **테이블 이름**: `comment_dislikes`
- **설명**: 댓글에 대한 싫어요 정보를 저장합니다.

| 속성 명      | 의미                           |
| ------------ | ------------------------------ |
| `id`         | 싫어요 ID (Primary Key)        |
| `comment_id` | 댓글 ID (comments 테이블 참조) |
| `user_id`    | 사용자 ID (users 테이블 참조)  |
| `created_at` | 싫어요 일시                    |

### 9. Email Verification 테이블

- **테이블 이름**: `email_verification`
- **설명**: 이메일 인증 코드를 저장합니다.

| 속성 명             | 의미                        |
| ------------------- | --------------------------- |
| `id`                | 인증 ID (Primary Key)       |
| `email`             | 인증할 이메일 (Unique)      |
| `verification_code` | 인증 코드                   |
| `created_at`        | 인증 요청 일시              |
| `verified`          | 인증 완료 여부 (true/false) |
| `verified_at`       | 인증 완료 일시              |

## 더미 데이터

`initialize_cloud_story_db_data.sql` 파일은 테스트 목적으로 더미 데이터를 테이블에 삽입합니다.

### 1. Users 더미 데이터

```sql
INSERT INTO users (email, password, nickname, profile_image_url) VALUES
('user1@example.com', 'password1', 'user1', 'http://example.com/image1.jpg'),
('user2@example.com', 'password2', 'user2', 'http://example.com/image2.jpg'),
('user3@example.com', 'password3', 'user3', 'http://example.com/image3.jpg');
```

### 2. Posts 더미 데이터

```
INSERT INTO posts (user_id, title, content) VALUES
(1, 'First Post', 'This is the content of the first post.'),
(2, 'Second Post', 'This is the content of the second post.'),
(3, 'Third Post', 'This is the content of the third post.');
```

### 3. Post Photos 더미 데이터

```
INSERT INTO post_photos (post_id, url, photo_order) VALUES
(1, 'http://example.com/post1_photo1.jpg', 1),
(1, 'http://example.com/post1_photo2.jpg', 2),
(2, 'http://example.com/post2_photo1.jpg', 1),
(2, 'http://example.com/post2_photo2.jpg', 2),
(3, 'http://example.com/post3_photo1.jpg', 1),
(3, 'http://example.com/post3_photo2.jpg', 2);

```

### 4. Comments 더미 데이터

```
INSERT INTO comments (post_id, user_id, content) VALUES
(1, 1, 'First comment on first post.'),
(2, 2, 'Second comment on second post.'),
(3, 3, 'Third comment on third post.');

```

### 5. Post Likes 더미 데이터

```INSERT INTO post_likes (post_id, user_id) VALUES
(1, 1),
(2, 2),
(3, 3);
```

### 6. Post Dislikes 더미 데이터

```INSERT INTO post_dislikes (post_id, user_id) VALUES
(1, 2),
(2, 3),
(3, 1);
```

### 7. Comment Likes 더미 데이터

```
INSERT INTO comment_likes (comment_id, user_id) VALUES
(1, 1),
(2, 2),
(3, 3);

```

### 8. Comment Dislikes 더미 데이터

```
INSERT INTO comment_dislikes (comment_id, user_id) VALUES
(1, 2),
(2, 3),
(3, 1);
```

### 9. Email Verification 더미 데이터

```
INSERT INTO email_verification (email, verification_code, verified) VALUES
('verify1@example.com', 'code1', false),
('verify2@example.com', 'code2', false),
('verify3@example.com', 'code3', true);
```

## SQL 스크립트 실행 방법

데이터베이스 스키마를 초기화하고 더미 데이터를 삽입하려면 MySQL CLI에서 다음 명령을 실행하세요:

```
mysql -u your_username -p cloud_db < path/to/initialize_cloud_db_schema.sql
mysql -u your_username -p cloud_db < path/to/initialize_cloud_db_data.sql
```

또는 MySQL Workbench나 다른 SQL 클라이언트를 사용하여 스크립트를 실행할 수 있습니다.
