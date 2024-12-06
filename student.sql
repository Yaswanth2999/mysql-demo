create database college;

use college;

CREATE TABLE COURSE (
    courseId INT PRIMARY KEY,      -- Primary Key for the course
    cName VARCHAR(255) NOT NULL,   -- Course name, cannot be null
    Fees INT NOT NULL              -- Fees for the course, cannot be null
);

CREATE TABLE STUDENT (
    rollNo INT PRIMARY KEY,             -- Primary Key for the student
    fName VARCHAR(255),                 -- First name of the student
    lName VARCHAR(255),                 -- Last name of the student
    Phone VARCHAR(15) UNIQUE,           -- Phone number, must be unique (uc)
    cId INT,                            -- Foreign key referencing COURSE
    email VARCHAR(255) UNIQUE,          -- Email address, must be unique (uc)
    FOREIGN KEY (cId) REFERENCES COURSE(courseId)  -- Foreign Key constraint
);

CREATE TABLE FACULTY (
    fId INT PRIMARY KEY,                  -- Primary Key for the faculty member
    fName VARCHAR(255) NOT NULL,          -- Faculty name, cannot be null
    Designation VARCHAR(255),             -- Designation of the faculty member
    Qualification VARCHAR(255),           -- Qualification of the faculty member
    PhoneNo VARCHAR(15) UNIQUE,           -- Phone number, must be unique (uc)
    cId INT,                              -- Foreign key referencing COURSE
    FOREIGN KEY (cId) REFERENCES COURSE(courseId)  -- Foreign Key constraint
);

CREATE TABLE BOOK (
    Bid INT PRIMARY KEY,              -- Primary Key for the book
    BName VARCHAR(255) UNIQUE,        -- Book name, must be unique (uc)
    Author VARCHAR(255),              -- Author of the book
    Publisher VARCHAR(255),           -- Publisher of the book
    Price INT,                        -- Price of the book
    Qty INT                           -- Quantity of the book available
);

CREATE TABLE LIBRARY (
    LId INT PRIMARY KEY,                  -- Primary Key for the library record
    BookId INT,                           -- Foreign key referencing BOOK table
    IssueDate DATE,                       -- Date the book was issued
    ReturnDate DATE,                      -- Date the book is returned
    rollNo INT,                           -- Foreign key referencing STUDENT table
    FOREIGN KEY (BookId) REFERENCES BOOK(Bid),  -- Foreign Key constraint for BookId
    FOREIGN KEY (rollNo) REFERENCES STUDENT(rollNo)  -- Foreign Key constraint for rollNo
);

CREATE TABLE ADDRESS (
    AdId INT PRIMARY KEY,            -- Primary Key for the address
    houseNo VARCHAR(50),             -- House number
    street VARCHAR(255),             -- Street name
    city VARCHAR(100),               -- City name
    state VARCHAR(100),              -- State name
    pincode VARCHAR(10),             -- Pincode for the address
    rNo INT,                         -- Foreign key referencing STUDENT table
    FOREIGN KEY (rNo) REFERENCES STUDENT(rollNo)  -- Foreign Key constraint
);

INSERT INTO COURSE 
VALUES
(101, 'CSE', 100000),
(102, 'EE', 75000),
(103, 'Mech', 80000);
INSERT INTO COURSE 
VALUES
(104, 'ECE', 95000),
(105, 'Civil', 60000);
select * from course;

INSERT INTO STUDENT (rollNo, fName, lName, Phone, cId, email)
VALUES
(1, 'John', 'Doe', '1234567890', 101, 'john.doe@example.com'),
(2, 'Jane', 'Smith', '2345678901', 102, 'jane.smith@example.com'),
(3, 'David', 'Johnson', '3456789012', 103, 'david.johnson@example.com'),
(4, 'Michael', 'Brown', '4567890123', 104, 'michael.brown@example.com'),
(5, 'Emily', 'Davis', '5678901234', 102, 'emily.davis@example.com'),
(6, 'Daniel', 'Garcia', '6789012345', 104, 'daniel.garcia@example.com'),
(7, 'Sophia', 'Martinez', '7890123456', 101, 'sophia.martinez@example.com'),
(8, 'William', 'Hernandez', '8901234567', 102, 'william.hernandez@example.com'),
(9, 'Olivia', 'Lopez', '9012345678', 103, 'olivia.lopez@example.com'),
(10, 'James', 'Gonzalez', '0123456789', 101, 'james.gonzalez@example.com'),
(11, 'Charlotte', 'Wilson', '1023456789', 105, 'charlotte.wilson@example.com'),
(12, 'Benjamin', 'Anderson', '1123456789', 103, 'benjamin.anderson@example.com'),
(13, 'Mia', 'Thomas', '1223456789', 101, 'mia.thomas@example.com'),
(14, 'Alexander', 'Taylor', '1323456789', 102, 'alexander.taylor@example.com'),
(15, 'Amelia', 'Moore', '1423456789', 104, 'amelia.moore@example.com'),
(16, 'Ethan', 'Jackson', '1523456789', 101, 'ethan.jackson@example.com'),
(17, 'Ava', 'Martin', '1623456789', 102, 'ava.martin@example.com'),
(18, 'Lucas', 'Lee', '1723456789', 103, 'lucas.lee@example.com'),
(19, 'Isabella', 'Perez', '1823456789', 105, 'isabella.perez@example.com'),
(20, 'Logan', 'White', '1923456789', 105, 'logan.white@example.com'),
(21, 'Harper', 'Harris', '2023456789', 103, 'harper.harris@example.com'),
(22, 'Elijah', 'Clark', '2123456789', 101, 'elijah.clark@example.com'),
(23, 'Abigail', 'Lewis', '2223456789', 102, 'abigail.lewis@example.com'),
(24, 'Jacob', 'Walker', '2323456789', 104, 'jacob.walker@example.com'),
(25, 'Evelyn', 'Hall', '2423456789', 101, 'evelyn.hall@example.com');

select *from student;

INSERT INTO BOOK (Bid, BName, Author, Publisher, Price, Qty)
VALUES
(1, 'Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', 50, 5),
(2, 'The C Programming Language', 'Brian W. Kernighan', 'Prentice Hall', 35, 7),
(3, 'Clean Code', 'Robert C. Martin', 'Prentice Hall', 45, 10),
(4, 'Artificial Intelligence: A Modern Approach', 'Stuart Russell', 'Pearson', 70, 4),
(5, 'A good Programmer', 'Andrew Hunt', 'Addison-Wesley', 55, 8),
(6, 'Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma', 'Addison-Wesley', 60, 3),
(7, 'Operating System Concepts', 'Abraham Silberschatz', 'Wiley', 65, 6),
(8, 'Computer Networking', 'Andrew S. Tanenbaum', 'Pearson', 50, 10),
(9, 'Database System Concepts', 'Abraham Silberschatz', 'McGraw Hill', 75, 2),
(10, 'The Art of Computer Programming', 'Donald E. Knuth', 'Addison-Wesley', 80, 1),
(11, 'Web Development with Node and Express', 'Evan Hahn', 'O\'Reilly Media', 40, 12),
(12, 'Learning Python', 'Mark Lutz', 'O\'Reilly Media', 55, 9),
(13, 'Head First Java', 'Kathy Sierra', 'O\'Reilly Media', 50, 5),
(14, 'You Don\'t Know JS', 'Kyle Simpson', 'O\'Reilly Media', 30, 15),
(15, 'Effective Java', 'Joshua Bloch', 'Addison-Wesley', 60, 7),
(16, 'JavaScript: The Good Parts', 'Douglas Crockford', 'O\'Reilly Media', 25, 14),
(17, 'CSS: The Definitive Guide', 'Eric A. Meyer', 'O\'Reilly Media', 30, 12),
(18, 'HTML and CSS: Design and Build Websites', 'Jon Duckett', 'Wiley', 35, 11),
(19, 'Eloquent JavaScript', 'Marijn Haverbeke', 'No Starch Press', 30, 9),
(20, 'Python Crash Course', 'Eric Matthes', 'No Starch Press', 40, 10),
(21, 'Learning Java', 'Marc Loy', 'O\'Reilly Media', 50, 6),
(22, 'The Clean Coder', 'Robert C. Martin', 'Prentice Hall', 50, 4),
(23, 'The Mythical Man-Month', 'Frederick P. Brooks', 'Addison-Wesley', 60, 3),
(24, 'Code Complete', 'Steve McConnell', 'Microsoft Press', 70, 5),
(25, 'Introduction to the Theory of Computation', 'Michael Sipser', 'Cengage Learning', 65, 2),
(26, 'Computer Vision: Algorithms and Applications', 'Richard Szeliski', 'Springer', 75, 1),
(27, 'Deep Learning', 'Ian Goodfellow', 'MIT Press', 85, 1),
(28, 'Pattern Recognition and Machine Learning', 'Christopher Bishop', 'Springer', 90, 1),
(29, 'Machine Learning Yearning', 'Andrew Ng', 'Self-Published', 25, 10),
(30, 'The Elements of Statistical Learning', 'Trevor Hastie', 'Springer', 40, 10),
(31, 'Artificial Intelligence: Foundations of Computational Agents', 'David L. Poole', 'Cambridge University Press', 50, 7),
(32, 'Computer Graphics: Principles and Practice', 'John F. Hughes', 'Addison-Wesley', 80, 3),
(33, 'Digital Design and Computer Architecture', 'David Harris', 'Morgan Kaufmann', 60, 4),
(34, 'Computer Architecture: A Quantitative Approach', 'John L. Hennessy', 'Morgan Kaufmann', 90, 2),
(35, 'Introduction to Machine Learning', 'Ethem Alpaydin', 'MIT Press', 50, 5),
(36, 'Data Mining: Concepts and Techniques', 'Jiawei Han', 'Morgan Kaufmann', 75, 2),
(37, 'Data Science from Scratch', 'Joel Grus', 'O\'Reilly Media', 45, 10),
(38, 'The Data Warehouse Toolkit', 'Ralph Kimball', 'Wiley', 70, 4),
(39, 'Fundamentals of Database Systems', 'Ramez Elmasri', 'Pearson', 60, 6),
(40, 'Web Design with HTML, CSS, JavaScript and jQuery', 'Jon Duckett', 'Wiley', 55, 8),
(41, 'Beginning SQL', 'Paul Wilton', 'Wiley', 30, 15),
(42, 'Introduction to Information Retrieval', 'Christopher D. Manning', 'MIT Press', 65, 3),
(43, 'Information Theory, Inference, and Learning Algorithms', 'David J.C. MacKay', 'Cambridge University Press', 70, 2),
(44, 'Algorithms Unlocked', 'Thomas H. Cormen', 'MIT Press', 40, 8),
(45, 'Understanding Machine Learning: From Theory to Algorithms', 'Shai Shalev-Shwartz', 'Cambridge University Press', 60, 5),
(46, 'Digital Image Processing', 'Rafael C. Gonzalez', 'Pearson', 75, 4),
(47, 'Artificial Intelligence: A Guide to Intelligent Systems', 'Michael Negnevitsky', 'Addison-Wesley', 50, 10),
(48, 'Software Engineering at Google', 'Titania McGrath', 'O\'Reilly Media', 40, 5),
(49, 'Graph Theory', 'Reinhard Diestel', 'Springer', 30, 15),
(50, 'Introduction to Cryptography', 'Menezes', 'CRC Press', 65, 3),
(51, 'Statistics for Data Science', 'James D. Miller', 'Springer', 45, 10),
(52, 'Big Data: Principles and Best Practices of Scalable Real-Time Data Systems', 'Nathan Marz', 'Manning Publications', 70, 5),
(53, 'Data Analysis with Python', 'Wes McKinney', 'O\'Reilly Media', 55, 6),
(54, 'The Data Warehouse Lifecycle Toolkit', 'Ralph Kimball', 'Wiley', 60, 7),
(55, 'Building Microservices', 'Sam Newman', 'O\'Reilly Media', 40, 8),
(56, 'The Phoenix Project', 'Gene Kim', 'IT Revolution Press', 30, 15),
(57, 'Refactoring: Improving the Design of Existing Code', 'Martin Fowler', 'Addison-Wesley', 45, 10),
(58, 'Continuous Delivery', 'Jez Humble', 'Addison-Wesley', 65, 5),
(59, 'Docker Deep Dive', 'Nigel Poulton', 'Independently Published', 50, 4),
(60, 'Kubernetes Up & Running', 'Kelsey Hightower', 'O\'Reilly Media', 70, 3),
(61, 'The Pragmatic Programmer', 'Andrew Hunt', 'Addison-Wesley', 55, 8),
(62, 'The Road to React', 'Robin Wieruch', 'Self-Published', 40, 10),
(63, 'JavaScript: The Definitive Guide', 'David Flanagan', 'O\'Reilly Media', 60, 5),
(64, 'Learning React', 'Alex Banks', 'O\'Reilly Media', 45, 6),
(65, 'React - Up & Running', 'Stoyan Stefanov', 'O\'Reilly Media', 50, 4),
(66, 'Node.js Design Patterns', 'Mario Casciaro', 'Packt Publishing', 70, 3),
(67, 'Spring in Action', 'Craig Walls', 'Manning Publications', 55, 7),
(68, 'Angular Up & Running', 'Shyam Seshadri', 'O\'Reilly Media', 40, 10),
(69, 'The Art of SQL', 'Stephane Faroult', 'O\'Reilly Media', 65, 5),
(70, 'Learning SQL', 'Alan Beaulieu', 'O\'Reilly Media', 50, 6);

select * from book;

INSERT INTO FACULTY (fId, fName, Designation, Qualification, PhoneNo, cId)
VALUES
(1, 'Dr. Alice Johnson', 'Professor', 'PhD in Computer Science', '1234567890', 101),
(2, 'Dr. Bob Smith', 'Associate Professor', 'PhD in Electrical Engineering', '2345678901', 104),
(3, 'Dr. Charlie Brown', 'Assistant Professor', 'PhD in Mechanical Engineering', '3456789012', 103),
(4, 'Dr. David Wilson', 'Lecturer', 'MSc in Computer Science', '4567890123', 101),
(5, 'Dr. Eva Adams', 'Professor', 'PhD in Information Technology', '5678901234', 102),
(6, 'Dr. Frank Moore', 'Associate Professor', 'PhD in Software Engineering', '6789012345', 104),
(7, 'Dr. Grace Taylor', 'Assistant Professor', 'PhD in Data Science', '7890123456', 101),
(8, 'Dr. Henry Lee', 'Lecturer', 'MSc in Computer Science', '8901234567', 102),
(9, 'Dr. Isabella Harris', 'Professor', 'PhD in Cybersecurity', '9012345678', 105),
(10, 'Dr. Jack Martin', 'Associate Professor', 'PhD in Computer Networks', '0123456789', 101),
(11, 'Dr. Karen Clark', 'Assistant Professor', 'PhD in AI', '1023456789', 104),
(12, 'Dr. Liam Rodriguez', 'Lecturer', 'MSc in Software Engineering', '1123456789', 105),
(13, 'Dr. Mia White', 'Professor', 'PhD in Web Development', '1223456789', 101),
(14, 'Dr. Noah Lewis', 'Associate Professor', 'PhD in Cloud Computing', '1323456789', 104),
(15, 'Dr. Olivia Walker', 'Assistant Professor', 'PhD in Data Analytics', '1423456789', 105);

INSERT INTO FACULTY (fId, fName, Designation, Qualification, PhoneNo, cId)
VALUES
(16, 'Dr. Alice Johnson', 'Professor', 'PhD in Computer Science', '1234567893', 103);

select * from faculty;

INSERT INTO ADDRESS (AdId, houseNo, street, city, state, pincode, rNo)
VALUES
(1, '101', 'First St', 'CityA', 'StateA', '10001', 1),
(2, '102', 'Second St', 'CityB', 'StateB', '10002', 2),
(3, '103', 'Third St', 'CityC', 'StateC', '10003', 3),
(4, '104', 'Fourth St', 'CityD', 'StateD', '10004', 4),
(5, '105', 'Fifth St', 'CityE', 'StateE', '10005', 5),
(6, '106', 'Sixth St', 'CityF', 'StateF', '10006', 6),
(7, '107', 'Seventh St', 'CityG', 'StateG', '10007', 7),
(8, '108', 'Eighth St', 'CityH', 'StateH', '10008', 8),
(9, '109', 'Ninth St', 'CityI', 'StateI', '10009', 9),
(10, '110', 'Tenth St', 'CityJ', 'StateJ', '10010', 10),
(11, '111', 'Eleventh St', 'CityK', 'StateK', '10011', 11),
(12, '112', 'Twelfth St', 'CityL', 'StateL', '10012', 12),
(13, '113', 'Thirteenth St', 'CityM', 'StateM', '10013', 13),
(14, '114', 'Fourteenth St', 'CityN', 'StateN', '10014', 14),
(15, '115', 'Fifteenth St', 'CityO', 'StateO', '10015', 15),
(16, '116', 'Sixteenth St', 'CityP', 'StateP', '10016', 16),
(17, '117', 'Seventeenth St', 'CityQ', 'StateQ', '10017', 17),
(18, '118', 'Eighteenth St', 'CityR', 'StateR', '10018', 18),
(19, '119', 'Nineteenth St', 'CityS', 'StateS', '10019', 19),
(20, '120', 'Twentieth St', 'CityT', 'StateT', '10020', 20),
(21, '121', 'Twenty-First St', 'CityU', 'StateU', '10021', 21),
(22, '122', 'Twenty-Second St', 'CityV', 'StateV', '10022', 22),
(23, '123', 'Twenty-Third St', 'CityW', 'StateW', '10023', 23),
(24, '124', 'Twenty-Fourth St', 'CityX', 'StateX', '10024', 24),
(25, '125', 'Twenty-Fifth St', 'CityY', 'StateY', '10025', 25);

select * from address;

INSERT INTO LIBRARY (LId, BookId, IssueDate, ReturnDate, rollNo)
VALUES
(1, 10, '2024-01-01', '2024-01-15', 1),
(2, 22, '2024-01-02', '2024-01-16', 2),
(3, 5, '2024-01-03', '2024-01-17', 3),
(4, 30, '2024-01-04', '2024-01-18', 4),
(5, 15, '2024-01-05', '2024-01-19', 5),
(6, 11, '2024-01-06', '2024-01-20', 6),
(7, 6, '2024-01-07', '2024-01-21', 7),
(8, 27, '2024-01-08', '2024-01-22', 8),
(9, 9, '2024-01-09', '2024-01-23', 9),
(10, 18, '2024-01-10', '2024-01-24', 10),
(11, 36, '2024-01-11', '2024-01-25', 11),
(12, 3, '2024-01-12', '2024-01-26', 12),
(13, 12, '2024-01-13', '2024-01-27', 13),
(14, 22, '2024-01-14', '2024-01-28', 14),
(15, 41, '2024-01-15', '2024-01-29', 15),
(16, 48, '2024-01-16', '2024-01-30', 16),
(17, 30, '2024-01-17', '2024-01-31', 17),
(18, 57, '2024-01-18', '2024-02-01', 18),
(19, 24, '2024-01-19', '2024-02-02', 19),
(20, 33, '2024-01-20', '2024-02-03', 20),
(21, 50, '2024-01-21', '2024-02-04', 21),
(22, 40, '2024-01-22', '2024-02-05', 22),
(23, 25, '2024-01-23', '2024-02-06', 23),
(24, 54, '2024-01-24', '2024-02-07', 24),
(25, 70, '2024-01-25', '2024-02-08', 25);

INSERT INTO LIBRARY 
VALUES
(45, 20, '2024-02-12', '2024-02-26', 1),
(46, 68, '2024-02-13', '2024-02-27', 6),
(47, 55, '2024-02-14', '2024-02-28', 4);


select * from library;

#Find all students who have issued books
SELECT s.rollNo, s.fName, b.BName
FROM STUDENT s
JOIN LIBRARY l ON s.rollNo = l.rollNo
JOIN BOOK b ON l.BookId = b.Bid;

#List all faculties who are teaching more than one course
SELECT f.fName, COUNT(c.courseId) AS course_count
FROM FACULTY f
JOIN COURSE c ON f.cId = c.courseId
GROUP BY f.fId
HAVING COUNT(c.courseId) > 1;

#Update the address of a student and propagate the changes
UPDATE ADDRESS
SET city = 'NewCity', pincode = '123456'
WHERE rNo = (SELECT rollNo FROM STUDENT WHERE fName = 'John Doe');

#Find how many books each student has issued
SELECT s.rollNo, s.fName, COUNT(l.BookId) AS books_issued
FROM STUDENT s
JOIN LIBRARY l ON s.rollNo = l.rollNo
GROUP BY s.rollNo, s.fName;

#Find the number of students in each city
SELECT a.city, COUNT(s.rollNo) AS student_count
FROM STUDENT s
JOIN ADDRESS a ON s.rollNo = a.rNo
GROUP BY a.city;

select s.rollNo,s.fName,s.cId,c.cName As student_count
from student s
join course c on s.cId = c.courseId;

#Update the fees of all engineering courses by 10%
set sql_safe_updates=0;
UPDATE COURSE
SET Fees = Fees * 1.10
WHERE cName IN ('CSE', 'ECE', 'EE', 'Mech');
 
 select * from course;
 

