CREATE TABLE user_followers (
    user_id INT NOT NULL,
    follower_id INT NOT NULL,
    PRIMARY KEY (user_id, follower_id)
);

---


INSERT INTO user_followers (user_id, follower_id) VALUES
(0, 1),
(1, 0),
(2, 0),
(2, 1);

---

select
  user_id,
  count(follower_id) as followers_count
from followers
group by user_id
order by user_id
