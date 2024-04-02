CREATE TABLE Courses (
    student VARCHAR NOT NULL,
    class VARCHAR NOT NULL,
    PRIMARY KEY (student, class)
);

INSERT INTO Courses (student, class)
VALUES
  ('A', 'Math'),
  ('B', 'English'),
  ('C', 'Math'),
  ('D', 'Biology'),
  ('E', 'Math'),
  ('F', 'Computer'),
  ('G', 'Math'),
  ('H', 'Math'),
  ('I', 'Math');

-- -- --

select
  class
from courses
group by class
having count(student) >= 5
