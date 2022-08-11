CREATE TABLE users
(
  user_id INT NOT NULL,
  given_name VARCHAR(63) NOT NULL,
  family_name VARCHAR(63) NOT NULL,
  birthdate DATE NOT NULL,
  gender INT NOT NULL,
  created_date DATE NOT NULL,
  family_name_kana VARCHAR(63) NOT NULL,
  given_name_kana VARCHAR(63) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE daily_events
(
  daily_event_id INT NOT NULL,
  happened_date DATE NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (daily_event_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE my_profiles
(
  my_profile_id INT NOT NULL,
  title_of_item VARCHAR(63) NOT NULL,
  detail VARCHAR(1024) NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (my_profile_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE user_profiles
(
  user_profile_id INT NOT NULL,
  title_of_item VARCHAR(63) NOT NULL,
  detail VARCHAR(1023) NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (user_profile_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE personal_histories
(
  personal_history_id INT NOT NULL,
  attribution VARCHAR(127) NOT NULL,
  detail VARCHAR(1023) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (personal_history_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE followers
(
  follower_id INT NOT NULL,
  followed_date DATE NOT NULL,
  following_user_id INT NOT NULL,
  followed_user_id INT NOT NULL,
  PRIMARY KEY (follower_id),
  FOREIGN KEY (following_user_id) REFERENCES users(user_id),
  FOREIGN KEY (followed_user_id) REFERENCES users(user_id)
);

CREATE TABLE daily_event_shared_users
(
  daily_event_shared_user_id INT NOT NULL,
  daily_event_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (daily_event_shared_user_id),
  FOREIGN KEY (daily_event_id) REFERENCES daily_events(daily_event_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE daily_event_details
(
  daily_event_detail_id INT NOT NULL,
  created_date DATE NOT NULL,
  detail VARCHAR(1024) NOT NULL,
  daily_event_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (daily_event_detail_id),
  FOREIGN KEY (daily_event_id) REFERENCES daily_events(daily_event_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE privacy_levels
(
  privacy_level_id INT NOT NULL,
  privacy_code INT NOT NULL,
  privacy_name VARCHAR(31) NOT NULL,
  PRIMARY KEY (privacy_level_id)
);

CREATE TABLE daily_event_images
(
  daily_event_image_id INT NOT NULL,
  daily_event_id INT NOT NULL,
  privacy_level_id INT NOT NULL,
  PRIMARY KEY (daily_event_image_id),
  FOREIGN KEY (daily_event_id) REFERENCES daily_events(daily_event_id),
  FOREIGN KEY (privacy_level_id) REFERENCES privacy_levels(privacy_level_id)
);
