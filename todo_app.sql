DROP USER IF EXISTS "michael";
CREATE USER "michael" WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;
CREATE DATABASE todo_app WITH OWNER "michael";

\c todo_app;

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(45),
  description TEXT,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  completed boolean
);

ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;

INSERT INTO tasks ( title, description, created_at, updated_at, completed_at )
VALUES ('Study SQL', 'Complete this exercise', NOW(), NOW(), NULL);

INSERT INTO tasks ( title, description, created_at, updated_at, completed_at ) VALUES ('Study PostgreSQL', 'Read all the documentation', NOW(), NOW(), NULL);

SELECT title FROM tasks WHERE completed_at is NULL;

UPDATE tasks SET completed_at = NOW() WHERE id = 1;

SELECT title, description FROM tasks WHERE completed_at is NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks ( title, description, created_at, updated_at, completed_at)
VALUES ('mistake 1', 'a test entry', NOW(), NOW(), NULL);

INSERT INTO tasks ( title, description, created_at, updated_at, completed_at)
VALUES ('mistake 2', 'another test entry', NOW(), NOW(), NULL);

SELECT title, description, created_at, updated_at, completed_at FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE id = 4;

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;