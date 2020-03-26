CREATE DATABASE training;
CREATE USER 'training'@'localhost' IDENTIFIED WITH mysql_native_password BY 'training';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, INDEX, DROP, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON training.* TO 'training'@'localhost';


CREATE TABLE IF NOT EXISTS training.trainee(
    trainee_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS training.course(
    course_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS training.history(
    history_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    trainee_id INT(10) UNSIGNED,
    course_id INT(10) UNSIGNED,
    start INT(11),
    end INT(11),
    status TINYINT(4),
    CONSTRAINT FOREIGN KEY (trainee_id) REFERENCES training.trainee (trainee_id),
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES training.course (course_id)
);


INSERT INTO `training`.`trainee` (`name`, `email`) VALUES ('Ivan', 'ivan@mail.ru');
INSERT INTO `training`.`trainee` (`name`, `email`) VALUES ('Petr', 'petr@mail.ru');
INSERT INTO `training`.`trainee` (`name`, `email`) VALUES ('Sergey', 'sergey@mail.ru');
INSERT INTO `training`.`trainee` (`name`, `email`) VALUES ('Illarion', 'illarion@mail.ru');
INSERT INTO `training`.`trainee` (`name`, `email`) VALUES ('Svyatoslav', 'svyatoslav@mail.ru');

INSERT INTO `training`.`course` (`name`, `description`) VALUES ('php', 'php course');
INSERT INTO `training`.`course` (`name`, `description`) VALUES ('sql', 'sql course');
INSERT INTO `training`.`course` (`name`, `description`) VALUES ('javascript', 'javascript course');

INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (1, 1, 1580515200, 1582934400, 1);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (2, 1, 1580515200, 1582934400, 0);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (3, 1, 1580515200, 1582934400, 1);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (4, 1, 1580515200, 1582934400, 0);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (1, 1, 1583020800, 1585612800, 0);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (2, 1, 1583020800, 1585612800, 1);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (3, 1, 1583020800, 1585612800, 1);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (4, 1, 1583020800, 1585612800, 0);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (1, 2, 1583020800, 1585612800, 1);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (2, 2, 1583020800, 1585612800, 1);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (3, 2, 1583020800, 1585612800, 0);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (5, 2, 1583020800, 1585612800, 1);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (1, 3, 1583020800, 1585612800, 1);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (2, 3, 1583020800, 1585612800, 0);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (3, 3, 1583020800, 1585612800, 1);
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`) VALUES (5, 3, 1583020800, 1585612800, 0);


SELECT t.name, t.email, c.name, h.end FROM training.history h JOIN
    training.trainee t ON h.trainee_id=t.trainee_id JOIN
    training.course c ON h.course_id=c.course_id
WHERE
    c.name='php' AND
    h.status=1 AND
    h.end=1582934400;

SELECT c.name, COUNT(*) FROM training.history h JOIN
    training.trainee t ON h.trainee_id=t.trainee_id JOIN
    training.course c ON h.course_id=c.course_id
WHERE
    h.status=1 AND
    h.end=1585612800
GROUP BY
    c.name;
